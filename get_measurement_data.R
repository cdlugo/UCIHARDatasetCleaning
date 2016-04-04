# Loads the measurement data from the specified data subset and renames 
# the columns to the appropriate feature as supplied in features.txt
get_measurement_data <- function(data_subset, dataset_dir) {
  print(paste("Getting measurement data for", data_subset))
  
  # Read in measurement data
  mesurements_path <- paste(dataset_dir,"/", data_subset,"/X_", data_subset, ".txt", sep = "")
  measurements <- read.fwf(mesurements_path, rep_len(c(-1, 15), 561 * 2))
  
  # Read in feature labels 
  features_path <- paste(dataset_dir,"/features.txt", sep = "")
  features <- read.delim(features_path, sep = " ", header = FALSE, col.names = c("index", "feature"))
  
  # Apply feature labels to measurement columns
  names(measurements) <- features$feature
  
  measurements
}