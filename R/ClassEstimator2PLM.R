Estimator2PLM = R6Class("Estimator2PLM",
	inherit = Estimator,

	# private
	private = list(
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

) # Estimator2PLM