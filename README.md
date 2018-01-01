# GettingAndCleaningDataProject
End of Class Project for Getting and Cleaning Data through Coursera

## run_analysis.R
The script assumes the "UCI HAR Dataset" folder is unzipped and available in the working directory.

It reads in the appropriate files and transforms the train and test data into one tidy data set given as a data frame named 'data'.

It then creates a new tbl_df (data frame) named 'averages' that shows the mean value for each column by Subject and Acivity.
