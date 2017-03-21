CoreMethods = R6Class("CoreMethods",

	# private
	private = list(
		# IRT related
		ComputeIrf = function(theta, b, a) {
			return(1 / (1 + exp(-sweep(outer(theta, b, "-"), 2, a, "*"))))
		},

		ComputeIif = function(irf, a) {
			return(sweep(irf * (1 - irf), 2, a ^ 2, "*"))
		},

		ComputeTrfTif = function(irf, iif) {
			return(cbind(apply(irf, 1, sum), apply(iif, 1, sum)))
		},


		# GRM sepecific
		ComputeExpectedItemMeans = function(isrf) {
			return(rowSums(isrf, dims = 2))
		},


		# Generting data
		# in the case of GRM isrf are passed instead of irf
		GenerateData = function(irf, model) {
			if(model == "2PLM") {
				return(sweep(irf, 1, runif(dim(irf)[1] * dim(irf)[2], 0, 1), private$ComputeResponse, check.margin = FALSE))
			} else {
				return(rowSums(sweep(irf, 1, runif(dim(irf)[1] * dim(irf)[2], 0, 1), private$ComputeResponse, check.margin = FALSE), dims = 2))
			}
		},
		
		ComputeResponse = function(x, y) {
			return(1 * (x - y >= 0))
		}
	)

) # CoreMethods