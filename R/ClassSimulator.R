Simulator <- R6::R6Class(
	"Simulator",
	inherit = CoreStructure,


	# private
	private = list(
		.data = NULL,

		# store the appropriate settings (2PLM or GRM) in functions
		# they rely on variables defined within the scope of initialize()
		# this means that no parameters are passed -> the functions only serve
		# the purpose of keeping the constructor logic readable
		.target_2plm = function() {
			private$irf 	<- irf_2plm(theta, a, b)
			private$iif 	<- iif_2plm(private$irf, a)
			private$trftif 	<- cbind(trf(private$irf), tif(private$iif))
			private$data 	<- generate_data_2plm(private$irf)
			private$model 	<- "Simulated 2PLM"
		},

		.target_grm = function() {
			private$isrf 	<- irf_2plm(theta, a, b)
			private$eim 	<- eim(private$isrf)
			private$data 	<- generate_data_grm(private$isrf)
			private$model 	<- "Simulated GRM"
			# TODO: 
			private$irf 	<- "not implemented"
			private$iif 	<- "not implemented"
			private$trftif 	<- "not implemented"
		}
	),


	# public
	public = list(
		initialize = function(theta, a, b) {
			# common for both 2PLM & GRM
			private$theta 		<- theta
			private$parameters 	<- cbind(a, b)
		
			# determine the irt model -> just a wrapper to keep things readable
			if(is.matrix(b)) private$.target_grm() else private$.target_2plm()
		}
	),


	# active bindings
	active = list(
		data = function() { return(private$.data) }
	)


) # Simulator




