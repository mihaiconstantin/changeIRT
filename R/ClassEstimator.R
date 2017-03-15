Estimator = R6Class("Estimator",
	inherit = CoreStructure,

	# private
	private = list(
		personFit = NULL
	),

	# public
	public = list(
		initialize = function(data) {
		}
	),

	# active bindings
	active = list(
		get.personFit = function() { return(private$personFit) }
	)

) # Estimator