### Cleaning UCI HAR Dataset

To use this script, place the UCI HAR Dataset in your working directory,
source "run_analysis.R", and execute the "run_analysis()" function.

Using the provided helper functions, run_analysis() will:

  1. Execute the following for both train and test datasets
    1. Load the measurement data
    2. Rename the measurement columns to match features.txt
    3. Load the activity data
    4. Add a label column to the activity data matching activity_labels.txt
    5. Load the subject data
  2. Merge the two datasets
  3. Remove columns not containg activity labels, subject indexes,
  means, or standard deviations
  4. Group the data by activity then by subject
  5. Calculate the mean for each variable
  6. Write the resulting table to "summary_data.txt"
