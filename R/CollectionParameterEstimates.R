# Parameter Estimates
#
# role		 : collection of functions for estimating item parameters
# approaches : two approaches: external vs. internal
# output 	 : all outputs must represent a matrix with 1st column a and rest b(s)
# wrapper	 : estimate_parameters()



#



# # # # # # # # # # # # # # # # # # # # # # # # # #
# # # External approaches
# # # # # # # # # # # # # # # # # # # # # # # # # #

# --------------------------------------------
# mirt: in future we want to move to internal ways 
# --------------------------------------------

fit_external_mirt <- function(data) {
	mirt_object 	<- mirt::mirt(data, 1, verbose = FALSE)
	mirt_parameters <- mirt::coef(mirt_object, IRTpars = TRUE, simplify = TRUE)$items
	return(list(object = mirt_object, parameters = mirt_parameters))
}



#



# # # # # # # # # # # # # # # # # # # # # # # # # #
# # # Internal approaches
# # # # # # # # # # # # # # # # # # # # # # # # # #

# --------------------------------------------
# cpp: cpp approach to estimate the parameters
# --------------------------------------------

parameters_cpp_2plm <- function(data) {
	stop("not implemented")
}

parameters_cpp_grm <- function(data) {
	stop("not implemented")
}


parameters_cpp <- function(data) if(max(data) > 1) parameters_cpp_grm(data) else parameters_cpp_2plm(data)



# # #



# exported
estimate_parameters <- function(data, internal = TRUE) {
	if(!internal) {
		fit_external_mirt(data)
	} else {
		parameters_cpp(data)
	}
}


