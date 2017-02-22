# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # This files consists of functions that internally used in the package and are not avilable to the end user.
# # # Roxygen2 documentation no necessary.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



# takes 1 element numerical values and returns the probability of endorsing an item based on the IRT model equation
# it is used inside "probability.matrix" and selected based on the "model" argument
# can be extended by adding more models here as long as they return a single numerical value
probability.1PL <- function(theta, difficulty) { 
	x = exp(1) ^ (theta - difficulty) 
	return(x / (1 + x))
}

probability.2PL <- function(theta, difficulty, discrimination) {

	x = exp(1) ^ (discrimination * (theta - difficulty)) 
	return(x / (1 + x))
}

probability.3PL <- function(theta, difficulty, discrimination, lower_asymptote) { 
	
	y = lower_asymptote + (1 - lower_asymptote)
	x = exp(1) ^ (discrimination * (theta - difficulty)) 
	return(y * (x / (1 + x)))
}

probability.4PL <- function(theta, difficulty, discrimination, lower_asymptote, upper_asymptote) { 
	
	y = lower_asymptote + (upper_asymptote - lower_asymptote)
	x = exp(1) ^ (discrimination * (theta - difficulty)) 
	return(y * (x / (1 + x)))
}



# # #



# builds the right type of matrix of probabilities based on the "model" specified
# e.g., if model == "2PL" -> uses the formula from the "probability.2PL"
# returns a matrix containing the probability of answering each item (for each respondent)
# TODO: turn the loop into a vectorized operation for large computations (~100.000 participants or more) -> e.g., 2PL: exp(outer(discrimination, theta - difficulty, "*"))
probability.matrix <- function(model, theta, difficulty, discrimination = FALSE, lower_asymptote = FALSE, upper_asymptote = FALSE) {

	prob.mtx <- NULL
	tmp_prob_rsp_row <- NULL

	# for each respondent compute its response probability on each item -> output: a vector that will be binded as a row to the matrix
	for(i in 1:length(theta)) 
	{
		for(j in 1:length(difficulty)) 
		{	
			if(model == "1PL") {
		 		tmp_prob_rsp_row[j] = probability.1PL(theta[i], difficulty[j])
			
			} else if (model == "2PL") {
				tmp_prob_rsp_row[j] = probability.2PL(theta[i], difficulty[j], discrimination[j])
			
			} else if(model == "3PL") {
				tmp_prob_rsp_row[j] = probability.3PL(theta[i], difficulty[j], discrimination[j], lower_asymptote[j])

			} else if(model == "4PL") {
				tmp_prob_rsp_row[j] = probability.4PL(theta[i], difficulty[j], discrimination[j], lower_asymptote[j], upper_asymptote[j])

			} else {
				stop("Model not recognized.")
			}
		}
		
		prob.mtx <- rbind(prob.mtx, tmp_prob_rsp_row)
	}

	# reset the matric indices
	rownames(prob.mtx) <- NULL

	return(prob.mtx)
}



# # # 



# taks a probability value and returns a dichotmous item response
# "method_type" indicates how the value is drawed (e.g., from a binomial distribution or using the runif in conjuction with prof. Wilco's trick)
response.dich <- function(probability, method_type) {
		
	if(method_type == "runif") {
		
		if(is.na(probability)) {
			
			warning("One or more probabilities were NA. NAs produced.")
			return(NA)
			
		} else {
			
			if(runif(1, 0, 1) > probability) {
				
				return(0)
				
			} else {
				
				return(1)
			}
		}
		
	} else if(method_type == "binom") {
		
		return(rbinom(1, 1, probability))

	} else {
		
		stop("Method type not recognised. Only 'method_type = runif' or 'method_type = binom' accepted.")
	}
}


# applies the "response.dich" function to a matrix of probabilities using the default method type "runif"
# returns a matrix item responses -> i.e., the data we're interested in 
response.dich.matrix <- function(probability_matrix, method_type = "runif") {
			
	return(apply(probability_matrix, c(1, 2), response.dich, method_type = method_type))
}