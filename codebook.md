# Code Book

Describes the variables, the data, and any transformations or work that you performed to clean up the data

## 'data' table

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.

### Variables and Transformations

* train_set : the original table of training data
* train_labels : the original training labels for which activity was being performed (numbers 1 through 6)
* train_subjects : the original subjects who did the activity (numbers 1 through 30)
* test_set : the original table of test data
* test_labels : the original test labels for which activity was being performed (numbers 1 through 6)
* test_subjects : the original subjects who did the activity (numbers 1 through 30)
* features : the original list of features corresponding to the column names of the train and test data. None of these names were changed.
* activitylabels : the original list of 6 activities each subject performed matching up with the numbers 1 through 6. None of these names were changed.
* variablenames : all of the column names for the data set about to be created. It starts with the Subject who performed the activity, followed by the Activity being performed, followed by each of the features (in the features variable) for which data was collected and computed.
* train : combining as columns the train_subjects, train_labels, and train_set into one training data set; adding the variablenames as the names of the columns
* test : combining as columns the test_subjects, test_labels, and test_set into one test data set; adding the variablenames as the names of the columns
* data : combining as rows the train and test datasets into one merged dataset, first train, then test. Then selecting only the first two columns (Subject and Activity) and those columns which contain "mean()" or "std()" corresponding to the mean and standard deviation for each measurement. Also, the activitylabels were used to turn the numbers 1 through 6 in the Activity column into the actual activity being performed (STANDING, SITTING, etc.)

## 'averages' table

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Variables and Transformations

* averages : aggregates the last 66 columns of the tidy 'data' table from above grouping first by Subject, then by Activity and applying the 'mean' function to the values. The first two column names are again rewritten to be "Subject" and "Activity;" and the table reordered by Subject.
