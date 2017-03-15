SimulatorGRM = R6Class("SimulatorGRM",
	inherit = Simulator,

	# private
	private = list(
		# GRM sepcific fields
		cumulativeIrf = NULL, 
		cumulativeIif = NULL, 
		cumulativeTrfTif = NULL, 

		# methods
		GenerateData = function(irf) {
			return(rowSums(sweep(irf, 1, runif(dim(irf)[1], 0, 1), private$ComputeResponse), dims = 2))
		}
	),

	# public
	public = list(
		initialize = function(theta, b, a) {
			super$initialize(theta, b, a)

			private$irf 	= private$ComputeIrf(theta, b, a)
			#private$iif 	= private$ComputeIif(theta, b, a)
			#private$trftif = private$ComputeTrfTif(theta, b, a)

			private$cumulativeIrf 		= private$ComputeCumulativeIrf(private$irf)
			#private$cumulativeIif 		= private$ComputeCumulativeIif(theta, b, a)
			#private$cumulativeTrfTif 	= private$ComputeCumulativeTrfTif(theta, b, a)

			private$data 	= private$GenerateData(private$irf)
			private$model = " Simulated GRM"
		}
	),

	active = list(
		get.cumulativeIrf 		= function() { return(private$cumulativeIrf) },
		get.cumulativeIif 		= function() { return(private$cumulativeIif) },
		get.cumulativeTrfTif 	= function() { return(private$cumulativeTrfTif) }

	)

) # SimulatorGRM