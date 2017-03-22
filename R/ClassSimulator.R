Simulator = R6::R6Class("Simulator",
	inherit = CoreStructure,

	# private
	private = list(
		data = NULL
	),

	# public
	public = list(
		initialize = function(theta, b, a) {
			private$theta = theta
			private$parameters = cbind(b, a)
		}
	),

	# active bindings
	active = list(
		get.data = function() { return(private$data) }
	)

) # Simulator