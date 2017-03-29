Estimator <- R6::R6Class(
	"Estimator",
	inherit = CoreStructure,


	# private
	private = list(
		
		# store the appropriate settings (2PLM or GRM) in functions
		# they rely on variables defined within the scope of initialize()
		# this means that no parameters are passed -> the functions only serve
		# the purpose of keeping the constructor logic readable
		.target_2plm = function() {
			# dropping additional columns created by mirt estimation
			private$parameters 	<- private$parameters[, c(1, 2)]
			
			private$irf 	<- irf_2plm(private$theta, private$parameters[, 1], private$parameters[, 2])
			private$iif 	<- iif_2plm(private$irf, private$parameters[, 1])
			private$trftif 	<- cbind(trf(private$irf), tif(private$iif))
			private$data 	<- generate_data_2plm(private$irf)
			private$model 	<- "Estimated 2PLM"
		},

		.target_grm = function() {
			private$isrf 	<- irf_2plm(private$theta, private$parameters[, 1], private$parameters[, 2:dim(private$parameters)[2]])
			private$eim 	<- eim(private$isrf)
			private$data 	<- generate_data_grm(private$isrf)
			private$model 	<- "Estimated GRM"
			# TODO: 
			private$irf 	<- "not implemented"
			private$iif 	<- "not implemented"
			private$trftif 	<- "not implemented"
		}
	),
	

	# public
	public = list(
		initialize = function(data, method) {
			# temporary fit the mirt object so we can pass it to estimate_theta()
			fit_mirt <- estimate_parameters(data)
			
			# when the estimate_theta() is implemented internally, things will look better
			private$parameters <- fit_mirt$parameters
			
			# determine the thetas
			private$theta <- estimate_theta(data, method)

			# determine the irt model -> just a wrapper for readability
			if(max(data) > 1) private$.target_grm() else private$.target_2plm()

			# cleaning the mirt object -> when estimate_theta() is ready, will be no need
			fit_mirt["object"] <- NULL
		}
	)


) # Estimator


#' Estimate IRT model based on data
#'
#' Works for 2PLM and GRM - decide the dependency: ltm or mirt?
#'
#' @param data matrix
#' @param theta.method character
#'
#' @return children of class Estimator (to be added...)
#'
#' @export
estimateirt = function(data, theta.method = "WLE") {
	
	if(max(data) > 1) {
		return(EstimatorGRM$new(data, theta.method))
	} else {
		return(Estimator2PLM$new(data, theta.method))
	}
}
