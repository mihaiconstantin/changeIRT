Estimator = R6Class("Estimator",
	inherit = CoreStructure,

	# private
	private = list(
		ModelFitVia.mirt = function(data) {
			return(mirt(data, 1))
		},
		ParametersVia.mirt = function(estimationObject) {
			return(coef(estimationObject, IRTpars = TRUE, simplify = TRUE)$items)
		},
		ThetaVia.mirt = function(estimationObject, method) {
			return(fscores(estimationObject,  method, full.scores = TRUE, full.scores.SE = TRUE))
		}

	),

	# public
	public = list(
		initialize = function(data, method) {
			tempEstimationObject = private$ModelFitVia.mirt(data)

			private$parameters 	 = private$ParametersVia.mirt(tempEstimationObject) 
			private$theta 		 = private$ThetaVia.mirt(tempEstimationObject, method)
			
			rm(tempEstimationObject)
		}
	),

	# active bindings
	active = list(
	)

) # Estimator