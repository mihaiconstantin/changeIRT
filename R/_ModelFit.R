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
		.isrf		= NULL,
		.eim 		= NULL,
		.data  		= NULL,

		# methods all children must implement
		.determine_model = function() { stop("implemented by children") },
		.set_common_fields = function(object) {} 
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
		eim 		= function() { return(private$.eim) 		},
		data 		= function() { return(private$.data) 		}
	)
) # ModelFitBase



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



ModelFitEstimate <- R6::R6Class(
	"ModelFitEstimate",
	inherit = ModelFitBase,

	# private
	private = list(
		.determine_model = function(data) {
			if(max(data) > 1) private$.model <- "GRM" else private$.model <- "2PLM"
		}
	),	

	# public
	public = list(
		initialize = function(data, method) {
			private$.determine_model(b)

			if(private$.model == "GRM") {
				private$.isrf       <- object$isrf()
				private$.eim        <- object$eim()
				private$.irf  	    <- object$irf_grm()
				private$.iif  	    <- object$iif_grm()
				private$.trf  	    <- object$trf()
				private$.tif  	    <- object$tif()
				private$.parameters <- object$parameters()
				private$.theta 	    <- object$estimatetheta(data, item_parameters, method)
			} else {
				private$.isrf       <- "n.a."
				private$.eim        <- "n.a."
				private$.irf  	    <- object$irf_2plm()
				private$.iif  	    <- object$iif_2plm()
				private$.trf  	    <- object$trf()
				private$.tif  	    <- object$tif()
				private$.parameters <- object$parameters()
				private$.theta 	    <- object$theta()
			}
		}
	)
) # ModelFitEstimate



# # # 



#' Fit an IRT model (2PLM or GRM)
#'
#' Depends on mirt package for paramter estimation.
#'
#' @param data Numeric matrix of item scores.
#' @param method Three letters character indicating the estimation method for theta. Available options: WLE, MLE, EAP. Defaults to WLE. 
#' @export
estimateirt <- function(data, method = "WLE") {
	return(ModelFitEstimate$new(data, method))
}



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



ModelFitSimulate <- R6::R6Class(
	"ModelFitSimulate",
	inherit = ModelFitBase,

	# private
	private = list(
		.determine_model = function(b) {
			if(is.matrix(b) && dim(b)[2] > 1) private$.model <- "GRM" else private$.model <- "2PLM"
		}
	),
	
	# public
	public = list(
		initialize = function(theta, a, b) {
			private$.determine_model(b)

			if(private$.model == "GRM") {
				private$.isrf   <- object$isrf()
				private$.eim    <- object$eim()
				private$.irf  	<- object$irf_grm()
				private$.iif  	<- object$iif_grm()
				private$.trf  	<- object$trf()
				private$.tif  	<- object$tif()
			} else {
				private$.isrf   <- "n.a."
				private$.eim    <- "n.a."
				private$.irf  	<- object$irf_2plm()
				private$.iif  	<- object$iif_2plm()
				private$.trf  	<- object$trf()
				private$.tif  	<- object$tif()
			}
		}
	)
) # ModelFitSimulate



# # # 



#' Simulate an IRT model-fit (2PLM or GRM)
#'
#' Depnds on mirt package for ability estimates.
#'
#' @param theta Numeric vector.
#' @param a Numeric vector.
#' @param b Numeric vector.
#' @export
simulateirt <- function(theta, a, b) {
	return(ModelFitSimulate$new(theta, a, b))
}



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
