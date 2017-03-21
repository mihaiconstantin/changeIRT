CoreStructure = R6Class("CoreStructure",
	inherit = CoreMethods,

	# private
	private = list(
		# fields
		model 		= NULL,
		parameters 	= NULL,
		theta 		= NULL,

		# methods
		AttachLabels = function() { return("not implemented") }
	),

	# active bindings
	active = list(
		get.model 		= function() { return(private$model) 		},
		get.parameters 	= function() { return(private$parameters) 	},
		get.theta 		= function() { return(private$theta) 		}
	)

) # CoreMethods