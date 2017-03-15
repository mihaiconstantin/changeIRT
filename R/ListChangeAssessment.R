ChangeAssessment = list(
	
	# thetaPre: matrix where column one is the ability and column 2 the se
	wald = function(thetaPre, thetaPost) {
		(thetaPost[, 1] - thetaPre[, 1]) / sqrt((thetaPre[, 2] ^ 2) + (thetaPost[, 2] ^ 2))
	}
)