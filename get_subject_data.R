# Loads the subject data from the specified data subset
get_subject_data <- function(data_subset, dataset_dir) {
  print(paste("Getting subject data for", data_subset))
  
  # Read in subject data
  subjects_path <- paste(dataset_dir,"/", data_subset,"/subject_", data_subset, ".txt", sep = "")
  subjects <- read.delim(subjects_path, sep = " ", header = FALSE, col.names = c("subject"))
  
  subjects
}