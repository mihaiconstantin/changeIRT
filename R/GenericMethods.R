# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # This files consists of generic methods. Mostly overloads avaialable to the useria via the generic function.
# # # Must be documented with roxygen2.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



# # # 



#' @rdname simulateirt-methods
#' @aliases simulateirt
setMethod(
	f = "simulateirt",
	# signature for 1PL
	signature = c(theta = "numeric", difficulty = "numeric", discrimination = "missing", lower_asymptote = "missing", upper_asymptote = "missing"),
	definition = function(theta, difficulty) {

		theta.length <- length(theta)
		difficulty.length <- length(difficulty)


		# create the simulation object
		simulation.obj <- new("Simulator")


		# populate the object with the obvious details
		simulation.obj@model <- "1PL"
		
		simulation.obj@items$count <- difficulty.length
		simulation.obj@items$parameters$difficulty <- difficulty

		simulation.obj@respondents$count = theta.length
		simulation.obj@respondents$theta = theta


		# make sure the vectors are not empty
		if(difficulty.length > 0 && theta.length > 0) {

			# builds the matrix of proabilities & bind it to the simulation object
			simulation.obj@probabilities <- probability.matrix("1PL", theta, difficulty)
			
			# transform the matrix of probabilities into a matrix of item responses
			simulation.obj@responses <- response.dich.matrix(simulation.obj@probabilities)

		} else {

			stop("All vector arguments must have at least one element. All vectors of item parameters must be of equal size.")
		}

		# house keeping
		rm(theta.length, difficulty.length)

		# return the Simulator object for 1PL model
		return(simulation.obj)
})


#' @rdname simulateirt-methods
#' @aliases simulateirt
setMethod(
	f = "simulateirt",
	# signature for 2PL
	signature = c(theta = "numeric", difficulty = "numeric", discrimination = "numeric", lower_asymptote = "missing", upper_asymptote = "missing"),
	definition = function(theta, difficulty, discrimination) {

		theta.length <- length(theta)
		difficulty.length <- length(difficulty)
		discrimination.length <- length(discrimination)


		# create the simulation object
		simulation.obj <- new("Simulator")


		# populate the object with the obvious details
		simulation.obj@model <- "2PL"
		
		simulation.obj@items$count <- difficulty.length
		simulation.obj@items$parameters$difficulty <- difficulty
		simulation.obj@items$parameters$discrimination <- discrimination

		simulation.obj@respondents$count = theta.length
		simulation.obj@respondents$theta = theta


		# make sure the vectors are not empty & the paramters are of equal length
		if(difficulty.length == discrimination.length && difficulty.length > 0 && discrimination.length > 0 && theta.length > 0) {

			# builds the matrix of proabilities & bind it to the simulation object
			simulation.obj@probabilities <- probability.matrix("2PL", theta, difficulty, discrimination)
			
			# transform the matrix of probabilities into a matrix of item responses
			simulation.obj@responses <- response.dich.matrix(simulation.obj@probabilities)

		} else {

			stop("All vector passed as arguments must have at least one element. All item parameters vectors must be of equal length.")
		}

		# house keeping
		rm(theta.length, difficulty.length, discrimination.length)
		
		# return the Simulator object for 1PL model
		return(simulation.obj)
})


#' @rdname simulateirt-methods
#' @aliases simulateirt
setMethod(
	f = "simulateirt",
	# signature for 3PL
	signature = c(theta = "numeric", difficulty = "numeric", discrimination = "numeric", lower_asymptote = "numeric", upper_asymptote = "missing"),
	definition = function(theta, difficulty, discrimination, lower_asymptote) {

		theta.length <- length(theta)
		difficulty.length <- length(difficulty)
		discrimination.length <- length(discrimination)
		lower_asymptote.length <- length(lower_asymptote)


		# create the simulation object
		simulation.obj <- new("Simulator")


		# populate the object with the obvious details
		simulation.obj@model <- "3PL"
		
		simulation.obj@items$count <- difficulty.length
		simulation.obj@items$parameters$difficulty <- difficulty
		simulation.obj@items$parameters$discrimination <- discrimination
		simulation.obj@items$parameters$lower_asymptote <- lower_asymptote

		simulation.obj@respondents$count = theta.length
		simulation.obj@respondents$theta = theta


		# make sure the vectors are not empty & the paramters are of equal length
		if(
			difficulty.length == discrimination.length && 
			difficulty.length == lower_asymptote.length && 
			discrimination.length == lower_asymptote.length && 
			difficulty.length > 0 && 
			discrimination.length > 0 && 
			lower_asymptote.length > 0 && 
			theta.length > 0
			) {

			# builds the matrix of proabilities & bind it to the simulation object
			simulation.obj@probabilities <- probability.matrix("3PL", theta, difficulty, discrimination, lower_asymptote)
			
			# transform the matrix of probabilities into a matrix of item responses
			simulation.obj@responses <- response.dich.matrix(simulation.obj@probabilities)

		} else {

			stop("All vector passed as arguments must have at least one element. All item parameters vectors must be of equal length.")
		}

		# house keeping
		rm(theta.length, difficulty.length, discrimination.length, lower_asymptote.length)

		# return the Simulator object for 1PL model
		return(simulation.obj)
})


#' @rdname simulateirt-methods
#' @aliases simulateirt
setMethod(
	f = "simulateirt",
	# signature for 4PL
	signature = c(theta = "numeric", difficulty = "numeric", discrimination = "numeric", lower_asymptote = "numeric", upper_asymptote = "numeric"),
	definition = function(theta, difficulty, discrimination, lower_asymptote, upper_asymptote) {

		theta.length <- length(theta)
		difficulty.length <- length(difficulty)
		discrimination.length <- length(discrimination)
		lower_asymptote.length <- length(lower_asymptote)
		upper_asymptote.length <- length(upper_asymptote)


		# create the simulation object
		simulation.obj <- new("Simulator")


		# populate the object with the obvious details
		simulation.obj@model <- "4PL"
		
		simulation.obj@items$count <- difficulty.length
		simulation.obj@items$parameters$difficulty <- difficulty
		simulation.obj@items$parameters$discrimination <- discrimination
		simulation.obj@items$parameters$lower_asymptote <- lower_asymptote
		simulation.obj@items$parameters$upper_asymptote <- upper_asymptote

		simulation.obj@respondents$count = theta.length
		simulation.obj@respondents$theta = theta


		# make sure the vectors are not empty & the paramters are of equal length
		if(
			difficulty.length == discrimination.length &&
			difficulty.length == lower_asymptote.length &&
			difficulty.length == upper_asymptote.length &&
			discrimination.length == lower_asymptote.length &&
			discrimination.length == upper_asymptote && 
			difficulty.length > 0 && 
			discrimination.length > 0 && 
			lower_asymptote.length > 0 && 
			upper_asymptote.length > 0 && 
			theta.length > 0
			) {

			# builds the matrix of proabilities & bind it to the simulation object
			simulation.obj@probabilities <- probability.matrix("4PL", theta, difficulty, discrimination, lower_asymptote, upper_asymptote)
			
			# transform the matrix of probabilities into a matrix of item responses
			simulation.obj@responses <- response.dich.matrix(simulation.obj@probabilities)

		} else {

			stop("All vector passed as arguments must have at least one element. All item parameters vectors must be of equal length.")
		}

		# house keeping
		rm(theta.length, difficulty.length, discrimination.length, lower_asymptote.length, upper_asymptote)

		# return the Simulator object for 1PL model
		return(simulation.obj)
})


# # # 