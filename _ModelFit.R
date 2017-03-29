ModelFitBase <- R6::R6Class(
	"ModelFitBase",

	# private
	private = list(
		.model 		= NULL,
		.parameters = NULL,
		.theta 		= NULL,
		.irf  		= NULL,
		.iif  		= NULL,
		.trftif  	= NULL,
		.isrf		= "not applicable",
		.eim 		= "not applicable"
	),

	# getters
	active = list(
		model 		= function() { return(private$.model) 		},
		parameters 	= function() { return(private$.parameters) 	},
		theta 		= function() { return(private$.theta) 		},
		irf 		= function() { return(private$.irf) 		},
		iif 		= function() { return(private$.iif) 		},
		trftif 		= function() { return(private$.trftif) 		},
		isrf 		= function() { return(private$.isrf) 		},
		eim 		= function() { return(private$.eim) 		}
	)
) # ModelFitBa


