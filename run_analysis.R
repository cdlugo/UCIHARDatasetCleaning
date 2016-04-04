source("get_data_subset.R")

library(dplyr)

# Top level entry point for UCI HAR Dataset cleaning script
run_analysis <- function() {
  dataset_dir <- "UCI HAR Dataset"
  
  # Load and combine data sets
  train_data <- get_data_subset("train", dataset_dir)
  test_data <- get_data_subset("test", dataset_dir)
  
  print("Merging datasets")
  combined_data <- rbind_list(train_data, test_data)
  
  # Free up some memory
  rm("train_data")
  rm("test_data")
  
  # Get only mean and std measurements
  print("Filtering columns")
  mean_and_std_only <- combined_data[,grepl("^activity$|^subject$|-mean\\(\\)|-std\\(\\)", names(combined_data))]
  
  # Create summary dataset
  print("Summarizing data")
  summary <- mean_and_std_only %>%
    group_by(activity, subject) %>%
    summarise_each(funs(mean))
  
  print("Writing summary data")
  write.table(summary, "summary_data.txt", row.names = FALSE)
}