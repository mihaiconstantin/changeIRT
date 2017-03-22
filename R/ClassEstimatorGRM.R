EstimatorGRM = R6Class("EstimatorGRM",
	inherit = Estimator,

	# private
	private = list(
	),

	# public
	public = list(
		initialize = function(data, method) {
			super$initialize(data, method)
		
			private$model = "Estimated GRM"
		}
	)

) # EstimatorGRM