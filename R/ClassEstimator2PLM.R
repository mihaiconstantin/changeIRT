Estimator2PLM = R6Class("Estimator2PLM",
	inherit = Estimator,

	# private
	private = list(
	),

	# public
	public = list(
		initialize = function(data, method) {
			super$initialize(data, method)

			# rearanging the paramaters: b and then a
			private$parameters = private$parameters[, c(1, 2)]
			private$model = "Estimated 2PLM"
		}
	)

) # Estimator2PLM