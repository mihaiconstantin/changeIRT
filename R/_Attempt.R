ThetaBase <- R6::R6Class(
	"ThetaBase", 

	# private
	private = list(
		.type = NULL,
		.theta = NULL,
		.se    = NULL,

		# determine for all chidren to model used
		.determine_item_type = function(data) {
			if(max(data) > 1) private$.type <- "poly" else private$.type <- "dich"
		}
	),

	# before estimation computations for all children
	public = list(
		initialize = function(data) {
			private$.determine_item_type(data)
		}
	),

	# getters
	active = active(
		result = function() { return (cbind(theta = private$.theta, se = private$.se)) }
	)
) # ThetaBase



ThetaWle <- R6::R6Class(
	"ThetaWle",
	inherit = ThetaBase,

	# internals for wle
	private = list(
		# all sorts of nasty things 
		# used for the WLE estimation
		# then we call them from the 
		# public wrappers 2plm and grm
	),

	# wle wrappers for both item types
	public = list(
		initialize = function(data, item_parameters) {
			super$initialize(data)

			if (private$.type == "poly") {
				wle <- self$poly(data, item_parameters)
			} else {
				wle <- self$dich(data, item_parameters)
			}

			private$.theta <- wle[, 1]
			private$.se <- wle[, 2]
		},

		dich = function(data, item_parameters) { 
			# logic for estimating for the 2PLM
			# using helps from withing private scope
			# each should return a matrix: 1st theta, 2nd se
			stop("not implemented") 
		},

		poly = function(data, item_parameters) { 
			# logic for estimating for the GRM
			# using helps from withing private scope
			# each should return a matrix: 1st theta, 2nd se
			stop("not implemented") 
		}
	)
) # ThetaWle



# more classes here: e.g., ThetaMLE, ThetaEAP
# the principle is the same, just inherit from ThetaBase
# and unfold the appropiate logic.



# # # 



#' Estimate theta and standard error
#' 
#' @param data Numeric matrix of item scores.
#' @param item_parameters Numeric matrix of item parameters. First column must contain the \code{a} parameters. Second column contains the \code{b} parameters. If the matrix consists of more than two columns, columns two to \code{n} are considered items steps.
#' @param method Three letters character indicating the estimation method. Available options: WLE, MLE, EAP. Defaults to WLE. 
#' @export
estimatetheta <- function(data = data, item_parameters = item_parameters, method = "WLE") {
	if(method == "WLE") {
		estimation <- ThetaWle$new(data, item_parameters)
	} else if(method == "MLE") {
		stop("Method not yet implemented.")
	} else if(method == "EAP") {
		stop("Method not yet implemented.")
	} else {
		stop("Unrecognized method. Try '?estimatetheta'.")
	}

	return(estimation$result)
}
