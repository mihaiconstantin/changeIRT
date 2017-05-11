Ancestor <- R6:R6Class(
	"Ancestor",


	# Private.
	private = list(
		# Fields.
		.model = NULL,


		# Methods.
		.determine_model_from_data = function(data)
		{
			if(max(data) > 1) private$.item_type <- "GRM" else private$.item_type <- "2PLM"
		}


		.determine_model_from_parameters = function(parameters) 
		{
			if(dim(parameters)[2] > 2 private$.item_type <- "GRM" else private$.item_type <- "2PLM")
		}
	),


	# Public.
	public = list(
		# Let's not intalize the determination here, but rather
		# make the calls on demand from the base children.
	),


	# Active.
	active = list() 


) # Ancestor