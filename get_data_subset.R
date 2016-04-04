source("get_measurement_data.R")
source("get_activity_data.R")
source("get_subject_data.R")

# Gets the complete data for the specified data subset,
# adding in activity and subject information, and properly labeling the data
get_data_subset <- function(data_subset, dataset_dir) {
  measurements <- get_measurement_data(data_subset, dataset_dir)
  activities <- get_activity_data(data_subset, dataset_dir)
  subjects <- get_subject_data(data_subset, dataset_dir)
  
  measurements[,"activity"] <- activities$label
  measurements[,"subject"] <- subjects$subject
  measurements
}