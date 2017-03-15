CoreMethods = R6Class("CoreMethods",

	# private
	private = list(
		# IRT related
		ComputeIrf = function(theta, b, a) {
			return(1 / (1 + exp(-sweep(outer(theta, b, "-"), 2, a, "*"))))
		},

		ComputeIif = function() {
			return("not implemented")
		},

		ComputeTrfTif = function() {
			return("not implemented")
		},

		# GRM sepecific
		ComputeCumulativeIrf = function(irf) {
			return(rowSums(irf, dims = 2))
		},

		ComputeCumulativeIif = function() {
			return("not implemented")
		},
		ComputeCumulativeTrfTif = function() {
			return("not implemented")
		},
		
		# helpers
		ComputeResponse = function(x, y) {
			return(1 * (x - y >= 0))
		}
	)

) # CoreMethods