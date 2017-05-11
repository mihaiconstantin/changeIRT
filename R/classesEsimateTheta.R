EstimateThetaBase <- R6::R6Class(
	"EstimateThetaBase",
	inherit = Ancestor,


	# Private.
	private = list(
		# Fields.
		.theta = NULL,
		.se = NULL
	),


	# Public.
	public = list(),


	# Active.
	active = list(
		# Getters.
		theta = function()
		{
			return cbind("theta" = private$.theta, "se" = private$.se)
		}
	)


) # EstimateThetaBase


# # # 


ThetaWLE <- R6::R6Class(
	"ThetaWLE",
	inherit = EstimateThetaBase,


	# Private.
	private = list(
		# Methods.

		# Here is the place for the things we use to estimate theta
		# using the WLE estimation method. This is the place for
		# listing all the C++ source files and then we just
		# call them from the constructor based on the 
		# type of the model we already detected.
	),


	# Public.
	public = list(
		# Methods.
		initialize = function(data, parameters)
		{
			# Determine the model type.
			private$.determine_model_from_parameters(parameters)


			# Make the right calls (model-type-wise)
			if(private$.model == 'GRM') {
				# Call the private functions to compute for GRM.

			} else if(private$.model = '2PLM') {
				# Call the private functions to compute for 2PLM.

			} else {	
				# Call the private functions to compute for another model.
			}
		}
	),


) # ThetaWLE


# # # 


ThetaEAP <- R6::R6Class(
	"ThetaEAP",
	inherit = EstimateThetaBase,


	# Private.
	private = list(
		# Methods.

		# Here is the place for the things we use to estimate theta
		# using the EAP estimation method. This is the place for
		# listing all the C++ source files and then we just
		# call them from the constructor based on the 
		# type of the model we already detected.
	),


	# Public.
	public = list(
		# Methods.
		initialize = function(data, parameters)
		{
			# Determine the model type.
			private$.determine_model_from_parameters(parameters)


			# Make the right calls (model-type-wise)
			if(private$.model == 'GRM') {
				# Call the private functions to compute for GRM.

			} else if(private$.model = '2PLM') {
				# Call the private functions to compute for 2PLM.

			} else {	
				# Call the private functions to compute for another model.
			}
		}
	),


) # ThetaEAP


# # # 


ThetaMLE <- R6::R6Class(
	"ThetaMLE",
	inherit = EstimateThetaBase,


	# Private.
	private = list(
		# Methods.

		# Here is the place for the things we use to estimate theta
		# using the MLE estimation method. This is the place for
		# listing all the C++ source files and then we just
		# call them from the constructor based on the 
		# type of the model we already detected.
	),


	# Public.
	public = list(
		# Methods.
		initialize = function(data, parameters)
		{
			# Determine the model type.
			private$.determine_model_from_parameters(parameters)


			# Make the right calls (model-type-wise)
			if(private$.model == 'GRM') {
				# Call the private functions to compute for GRM.

			} else if(private$.model = '2PLM') {
				# Call the private functions to compute for 2PLM.

			} else {	
				# Call the private functions to compute for another model.
			}
		}
	),


) # ThetaMLE



# # # 
# # # 
# # #


#' Estimate theta and standard error
#' 
#' @param data Numeric matrix of item scores.
#' @param parameters Numeric matrix of item parameters. First column must contain the \code{a} parameters. Second column contains the \code{b} parameters. If the matrix consists of more than two columns, columns two to \code{n} are considered items steps.
#' @param method Three letters indicating the estimation method. Available options: WLE, MLE, EAP. Defaults to WLE. 
#' @export
estimatetheta <- function(data = data, parameters = parameters, method = "WLE") {
	if(method == "WLE") {
		estimation <- ThetaWLE$new(data, parameters)
	} else if(method == "EAP") {
		estimation <- ThetaEAP$new(data, parameters)
	} else if(method == "MLE") {
		estimation <- ThetaMLE$new(data, parameters)
	} else {
		stop("Unrecognized method. Try '?estimatetheta'.")
	}

	return(estimation$theta)
}
