CoreStructure = R6Class("CoreStructure",
	inherit = CoreMethods,

	# private
	private = list(
		# fields
		model 		= NULL,
		parameters 	= NULL,
		theta 		= NULL,
		irf 		= NULL,
		iif 		= NULL,
		trftif 		= NULL,

		# methods
		AttachLabels = function() { return("not implemented") }
	),

	# active bindings
	active = list(
		get.model 		= function() { return(private$model) 		},
		get.parameters 	= function() { return(private$parameters) 	},
		get.theta 		= function() { return(private$theta) 		},
		get.irf 		= function() { return(private$irf) 			},
		get.iif 		= function() { return(private$iif) 			},
		get.trftif 		= function() { return(private$trftif) 		}
	)

) # CoreMethods