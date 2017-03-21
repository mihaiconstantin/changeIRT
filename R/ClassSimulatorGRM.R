# TODO: Irf, Iif, Trf, and Irf.

SimulatorGRM = R6Class("SimulatorGRM",
	inherit = Simulator,

	# private
	private = list(
		isrf    		  = NULL, 
		expectedItemMeans = NULL
	),

	# public
	public = list(
		initialize = function(theta, b, a) {
			super$initialize(theta, b, a)

			private$isrf 				= private$ComputeIrf(theta, b, a)
			private$expectedItemMeans 	= private$ComputeExpectedItemMeans(private$isrf)

			private$data  = private$GenerateData(private$isrf, model = "GRM")
			private$model = "Simulated GRM" 
		}
	),

	active = list(
		get.isrf 				= function() { return(private$isrf) },
		get.expectedItemMeans 	= function() { return(private$expectedItemMeans) }
	)

) # SimulatorGRM