# IRT Indices
#
# role		 : collection of functions for computing the IRT indices 
# indices 	 : irf, iif, trf, tif, isrf, eim
# output 	 : all outputs must represent a matrix
# wrapper	 : one wrapper for each indice



#



# # # # # # # # # # # # # # # # # # # # # # # # # #
# # # Internal approaches
# # # # # # # # # # # # # # # # # # # # # # # # # #




# --------------------------------------------
# item response functions
# --------------------------------------------

irf_2plm <- function(theta, a, b) {
	return(1 / (1 + exp(-sweep(outer(theta, b, "-"), 2, a, "*"))))
}

irf_grm <- function(...) {
	stop("not implemented")
}


# exported
irf <- function(theta, a, b) if(is.matrix(b)) irf_grm(theta, a, b) else irf_2plm(theta, a, b)


>>>>>>>>>>>>>>>> HERE <<<<<<<<<<<<<<<<<<
#



# --------------------------------------------
# item information functions
# --------------------------------------------

iif_2plm <- function(irf, a) {
	return(sweep(irf * (1 - irf), 2, a ^ 2, "*"))
}

iif_grm <- function(...) {
	stop("not implemented")
}


# exported
iif <- function(irf, a, model = "GRM") if(model == "GRM") iif_grm(...) else iif_2plm(irf, a)



#



# --------------------------
# test response function
# --------------------------
trf <- function(irf) {
	return(apply(irf, 1, sum))
}


# --------------------------
# test information function
# --------------------------
tif <- function(iif) {
	return(apply(iif, 1, sum))
}


# --------------------------
# expected item means
# --------------------------
eim <- function(isrf) {
	return(rowSums(isrf, dims = 2))
}




