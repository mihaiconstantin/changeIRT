IrtIndices <- R6::R6Class(
	"IrtIndices", 

	private = list(
	),

	public = list(

	),
) # IrtIndices


# # #


IrtParametersBase <- R6::R6Class(
	"IrtParametersBase", 

	private = list(
		.a = NULL,
		.b = NULL
	),

	public = list(
	),

	actie = list(
		result = function() { return (cbind(a = private$.a, b = private$.b)) }
	)
) # IrtParametersBase




IrtParametersMirt <- R6::R6Class(
	"IrtParametersMirt", 
	inherit = IrtParametersBase,

	private = list(
	),

	public = list(
	),

	actie = list(
		result = function() { return (cbind(a = private$.a, b = private$.b)) }
	)
) # IrtParametersMirt


##############
#### HERE ####
##############



#' Estimate model parameters
#' 
#' @param data Numeric matrix of item scores.
#' @export
parameters <- function(data) {
	estimation <- ParametersMirt$new(data)
	return(estimation$result)
}





















































# # #


IrtData <- R6::R6Class(
	"IrtData", 

	private = list(
		# behind the scenes things necessary for public scope
		.compute_response <- function(x, y) {
			return(1 * (x - y >= 0))
		}
	),

	public = list(
		data_2plm <- function(irf) {
			return(sweep(irf, 1, runif(dim(irf)[1] * dim(irf)[2], 0, 1), private$.compute_response, check.margin = FALSE))		
		},
		data_grm <- function(isrf) {
			# array: dimensions by step, not item
			return(rowSums(sweep(irf, 1, runif(dim(irf)[1] * dim(irf)[2], 0, 1), private$.compute_response, check.margin = FALSE), dims = 2))
		}
	),
) # IrtData



# # #



IrtWrapper <- R6::R6Class(
	"IrtWrapper", 

	private = list(
	),

	public = list(
		isrf 		<- function() { ... },
		eim 		<- function() { ... },
		irf		 	<- function() { ... },
		iif		 	<- function() { ... },
		trf 		<- function() { ... },
		tif 		<- function() { ... },
		parameters 	<- function() { ... },
		theta 		<- function() { ... },
		data 		<- function() { ... }
	),
) # IrtWrapper
