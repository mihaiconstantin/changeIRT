# Theta Estimates
#
# role		 : collection of functions for estimating theta and the standard error
# approaches : two approaches: external vs. internal
# methods 	 : WLE, LE, and EAP
# output 	 : all outputs must represent a matrix with 1st column theta and 2nd SE
# wrapper	 : estimate_theta()



#



# # # # # # # # # # # # # # # # # # # # # # # # # #
# # # External approaches
# # # # # # # # # # # # # # # # # # # # # # # # # #

# ------------------------------------------------------
# mirt: in future we want to discard external approaches 
# ------------------------------------------------------
theta_external_mirt <- function(mirt_object, method) {
	return(mirt::fscores(mirt_object, method, full.scores = TRUE, full.scores.SE = TRUE, verbose = FALSE))
}



#



# # # # # # # # # # # # # # # # # # # # # # # # # #
# # # Internal approaches
# # # # # # # # # # # # # # # # # # # # # # # # # #

# --------------------------------------------
# estimate by WLE
# --------------------------------------------
theta_wle_2plm <- function(data, item_parameters) {
	stop("not implemented")
}

theta_wle_grm <- function(data, item_parameters) {
	stop("not implemented")
}


theta_wle <- function(data, item_parameters) if(max(data) > 1) theta_wle_grm(data, item_parameters) else theta_wle_2plm(data, item_parameters)


#


# --------------------------------------------
# estimate by LE
# --------------------------------------------
theta_le_2plm <- function(data, item_parameters) {
	stop("not implemented")
}

theta_le_grm <- function(data, item_parameters) {
	stop("not implemented")
}


theta_le <- function(data, item_parameters) if(max(data) > 1) theta_le_grm(data, item_parameters) else theta_le_2plm(data, item_parameters)


#


# --------------------------------------------
# estimate by EAP
# --------------------------------------------
theta_eap_2plm <- function(data, item_parameters) {
	stop("not implemented")
}

theta_eap_grm <- function(data, item_parameters) {
	stop("not implemented")
}


theta_eap <- function(data, item_parameters) if(max(data) > 1) theta_eap_grm(data, item_parameters) else theta_eap_2plm(data, item_parameters)



# # #



# exported
estimate_theta <- function(data, item_parameters = item_parameters, method = method, ...) {
	if(missing(data)) {
		args <- list(...)
		theta_external_mirt(args$mirt_object, method)
	} else {
		switch(method,
			"WLE" = theta_wle(data, item_parameters),
			"LE"  = theta_le(data, item_parameters),
			"EAP" = theta_eap(data, item_parameters)
		)
	}
}































