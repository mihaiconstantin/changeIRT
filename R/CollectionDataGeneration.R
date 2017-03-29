# document on NULL with name generate_data

# 2plm
generate_data_2plm <- function(irf) {
	return(sweep(irf, 1, runif(dim(irf)[1] * dim(irf)[2], 0, 1), compute_response, check.margin = FALSE))
}

# grm
generate_data_grm <- function(isrf) {
	return(rowSums(sweep(irf, 1, runif(dim(irf)[1] * dim(irf)[2], 0, 1), compute_response, check.margin = FALSE), dims = 2))
}



# helper
compute_response <- function(x, y) {
	return(1 * (x - y >= 0))
}
