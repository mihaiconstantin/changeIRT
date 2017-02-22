# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # This files contains all Class definitions used throughout the package.
# # # Must be documented with roxygen2.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



#' Class Simulator
#' 
#' Class \code{Simulator} defines the structure of a simulated data for an IRT model. It is returned by \code{\link{simulateirt}}
#'
#' @name Simulator-class
#' @rdname Simulator-class
#'
#' @slot model A character indicated the type of the IRT model for which the data was simulated. To explore: \code{SimulatorObject@model}
#' @slot probabilities A numerical matrix containing the proabability of endorsing each item by each respondent. To explore: \code{SimulatorObject@probabilities}
#' @slot responses A numerical matrix containing the item responses. To explore: \code{SimulatorObject@responses}
#' @slot items A list containing information about the items simulated. Its structure varies with the type of model used in the simulation. Mainly, it holds the item paramters used in the simulation, but can also hold other item-related statistics via integration with specialized third-party packages. To explore: \code{SimulatorObject@items}. The previous example provides access to the list. In order to access specific elements within it, subsequent calls must use the \code{$} operator, e.g., \code{SimulatorObject@items$parameters}.
#' @slot respondents A lost containing information about the respondents simulated. It's structure may vary. To explore: \code{SimulatorObject@respondents}. In order to access specific elements within it, subsequent calls must use the \code{$} operator, e.g., \code{SimulatorObject@respondents$count}.
#' 
#' 
setClass(
	"Simulator",
	
	slots = c(
		model = "character",
		probabilities = "matrix",
		responses = "matrix",
		items = "list",
		respondents = "list"
	),
	
	prototype = list(
		model = NULL,
		probabilities = NULL,
		responses = NULL,
		items = list(
			# customizable based on selected IRT model
			parameters = list(), 
			count = NULL
		),
		respondents = list(
			count = NULL
		)
	)
)