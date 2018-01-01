## This assumes you have already unzipped the data and have the folder "UCI HAR Dataset" in your working directory.

## Read in the train and test sets and the labels telling which activity was 
## being performed (1:6) and by whom (subjects 1:30)
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Read in the features which correspond to the collumn variables,
## and activity labels which correspond to the train and test label values
features <- read.table("UCI HAR Dataset/features.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
variablenames <- c("Subject", "Activity", as.character(features[,2]))

## Put together the training data and assign variable names
## 4. Appropriately labels the data set with descriptive variable names.
train <- bind_cols(train_subjects, train_labels, train_set)
names(train) <- variablenames

## Put together the testing data and assign variable names
## 4. Appropriately labels the data set with descriptive variable names.
test <- bind_cols(test_subjects, test_labels, test_set)
names(test) <- variablenames

## 1. Merges the training and the test sets to create one data set.
data <- bind_rows(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## which means, keep only the columns that include "mean()" or "std()"
data <- select(data, "Subject", "Activity", contains("mean()"), contains("std()"))

## 3. Uses descriptive activity names to name the activities in the data set
## Because the activitylabels are in numerical order, we can use the Activity number
## as an index instead of searching for a match.
data <- mutate(data, Activity = activitylabels[Activity,2])
write.table(data, "./data.txt", row.names = FALSE)

## 5. From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
averages <- aggregate(data[,3:68], list(data$Subject, data$Activity), mean)
names(averages)[1] <- "Subject"
names(averages)[2] <- "Activity"
averages <- averages[order(averages$Subject),]
write.table(averages, "./averages.txt", row.names = FALSE)