# Loads the activity data from the specified data subset and adds
# the label information as supplied in activity_labels.txt
get_activity_data <- function(data_subset, dataset_dir) {
  print(paste("Getting activity data for", data_subset))
  
  # Load in activity labels
  activity_labels_path <- paste(dataset_dir, "/activity_labels.txt", sep = "")
  activity_labels <- read.delim(activity_labels_path, sep = " ", header = FALSE, col.names = c("index", "label"))
  
  # Load in activity data
  activities_path <- paste(dataset_dir,"/", data_subset,"/y_", data_subset, ".txt", sep = "")
  activities <- read.delim(activities_path, sep = " ", header = FALSE, col.names = c("index"))
  
  # Apply activity labels to activity data
  mutate(activities, label = activity_labels[index,"label"])
}