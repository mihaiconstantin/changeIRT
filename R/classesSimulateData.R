SimulateDataBase <- R6::R6Class(
	"SimulateDataBase",
	inherit = Ancestor,


	# Private.
	private = list(
		# Fields.
		.parameters = NULL,
		.theta 		= NULL,
		.irf  		= NULL,
		.iif  		= NULL,
		.trftif  	= NULL,
		.isrf		= NULL,
		.eim 		= NULL,
		.data  		= NULL
	),


	# Public.
	public = list(),


	# Active.
	active = list(
		# Getters.
		parameters 	= function() { return(private$.parameters) 	},
		theta 		= function() { return(private$.theta) 		},
		irf 		= function() { return(private$.irf) 		},
		iif 		= function() { return(private$.iif) 		},
		trftif 		= function() { return(private$.trftif) 		},
		isrf 		= function() { return(private$.isrf) 		},
		eim 		= function() { return(private$.eim) 		},
		data 		= function() { return(private$.data) 		}
	)


) # EstimateThetaBase


# # # 


Simulator <- R6::R6Class(
	"Simulator",
	inherit = SimulateDataBase,


	# Private.
	private = list(
		.computeIrf = function(theta, parameters) 
		{
			private$.irf = irf_2plm(theta, parameters[, 1], parameters[, 2:dim(parameters)[2]])
		},

		.computeIsrf = function(theta, parameters)
		{
			private$.isrf = irsf_grm(theta, parameters[, 1], parameters[, 2:dim(parameters)[2]])
		}
		# And so on...
	),


	# Public.
	public = list(
		# Methods.
		initialize = function(theta, parameters)
		{
			if(private$.model == '2PLM')
			{
				private$.irf = private$.computeIrf(theta, parameters[, 1], parameters[, 2:dim(parameters)[2]])
			}
			else
			{
				private$.isrf = private$.computeIsrf(theta, parameters[, 1], parameters[, 2:dim(parameters)[2]])
			}
			# And so on...		
		}
	),


) # Simulator


# # # 
# # # 
# # #


#' Simulate datasets under the unidimensional IRT 
#' 
#' @param theta Numeric matrix of item scores.
#' @param parameters Numeric matrix of item parameters. First column must contain the \code{a} parameters. Second column contains the \code{b} parameters. If the matrix consists of more than two columns, columns two to \code{n} are considered items steps.
#' @export
simulateirt <- function(theta = theta, parameters = parameters) 
{
	return (Simulator$new(theta, parameters))
}
