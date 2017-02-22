# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # This files consists of functions & generics that are exported and avilable to the end user.
# # # Must be documented with roxygen2.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # Functions
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 







# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # Generic functions
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



#' Method simulateirt
#'
#' Method \code{simulateirt} is the end-user interface for generating dichotomous item responses. It is a generic function. 
#' It currently supports "1PL", "2PL", "3PL", and "4PL" IRT models. It automatically determines the appropriate IRT model based on the arguments passed. 
#' There are 4 models supported, therefore there are 4 use cases. It is highly recommended to use named arguments to make sure the proper model is used. Use cases:
#' \itemize{
#' \item 1PL model is used if signature matches: \code{simulateirt(theta = vector, difficulty = vector)}
#' \item 2PL model is used if signature matches: \code{simulateirt(theta = vector, difficulty = vector, discriminability = vector)}
#' \item 3PL model is used if signature matches: \code{simulateirt(theta = vector, difficulty = vector, discriminability = vector, lower_asymptote = vector)}
#' \item 4PL model is used if signature matches: \code{simulateirt(theta = vector, difficulty = vector, discriminability = vector, lower_asymptote = vector, upper_asymptote = vector)}
#' }
#' 
#' @param theta A numerical vector containing the theta values to be used in the simulation. The \code{length(theta)} gives the number of respondents (e.g., the number of rows in the matrix of item responses). 
#' @param difficulty A numerical vector containing the difficulty item parameters (also known as "b"). If \code{length(difficulty)} is grater than \code{0} and identical with the length of all the other item paramters, it gives the numer of items (e.g., the number of rows in the matrix of item responses).
#' @param discrimination A numerical vector containing the discriminability item parameters (also known as "a").
#' @param lower_asymptote A numerical vector containing the lower asymptote item parameters (also known as "c").
#' @param upper_asymptote A numerical vector containing the upper asymptote item parameters (also known as "d").
#'
#' @return An object of class \code{\link{Simulator}}. Note that the object implements the formal S4 class system \url{http://adv-r.had.co.nz/S4.html}. Therefore, the generated data is contained within different fields named \code{slot}. To access, for instance, details about the items use \code{SimulatorObject@item}. This will print all the elements within the list \code{item}. Subsequent access to thee elements is permited using the \code{$} operator, e.g, \code{SimulatorObject@item$parameters$difficulty}. See \code{\link{Simulator}} class structure for an idea of what can be accessed.
#' 
#' @name simulateirt
#' @rdname simulateirt-methods
#'
#' @importFrom methods new
#' @importFrom utils head
#' @importFrom stats rbinom runif
#'
#' @exportMethod simulateirt
#' 
setGeneric(
	name = "simulateirt",
	def = function(theta, difficulty, discrimination, lower_asymptote, upper_asymptote) {
		standardGeneric("simulateirt")
	})