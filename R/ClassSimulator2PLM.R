Simulator2PLM = R6Class("Simulator2PLM",
	inherit = Simulator,

	# private
	private = list(
		irf  	= NULL,
		iif  	= NULL,
		trftif  = NULL
	),

	# public
	public = list(
		initialize = function(theta, b, a) {
			super$initialize(theta, b, a)

			private$irf 	= private$ComputeIrf(theta, b, a)
			private$iif 	= private$ComputeIif(private$irf, a)
			private$trftif 	= private$ComputeTrfTif(private$irf, private$iif)

			private$data 	= private$GenerateData(private$irf, model = "2PLM")
			private$model 	= "Simulated 2PLM"
		},

		get.irf 	= function() { return(private$irf) },
		get.iif 	= function() { return(private$iif) },
		get.trftif 	= function() { return(private$trftif) }
	)

) # Simulator2PLM





