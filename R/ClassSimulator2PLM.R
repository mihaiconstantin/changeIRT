Simulator2PLM = R6Class("Simulator2PLM",
	inherit = Simulator,

	# private
	private = list(
		GenerateData = function(irf) {
			return(sweep(irf, 1, runif(dim(irf)[1], 0, 1), private$ComputeResponse))
		}
	),

	# public
	public = list(
		initialize = function(theta, b, a) {
			super$initialize(theta, b, a)

			private$irf 	= private$ComputeIrf(theta, b, a)
			#private$iif 	= private$ComputeIif(theta, b, a)
			#private$trftif = private$ComputeTrfTif(theta, b, a)

			private$data 	= private$GenerateData(private$irf)
			private$model 	= "Simulated 2PLM"
		}
	)

) # Simulator2PLM