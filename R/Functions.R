simulateirt = function(theta, b, a) {
	if(is.matrix(b)) {
		return(SimulatorGRM$new(theta, b, a))
	} else {
		return(Simulator2PLM$new(theta, b, a))
	}
}

estimateirt = function(data) {
	# check of the data is binary and return
	# the appropriate IRT model
}

changeirt = function(theta.t1, theta.t2) {
	return(ChangeAssessment$wald(theta.t1, theta.t2))
}

personfit = function() {
	
}