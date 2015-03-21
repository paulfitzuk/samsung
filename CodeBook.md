Run_Analysis.R
21-March-2015

Script created for Coursera ‘Getting and Cleaning Data’ course week3 assignment

TRAINING DATA

3 data frames used to reading the training data
train_subject
train_X 
train_y 

TEST DATA

3 data frames used to reading the test data
test_subject
test_X 
test_y 

FEATURES LIST

1 data frame to hold the measurement features descriptions. This is used to add the column names to the TEST and TRAINING DATA frames. They also identify the mean and std columns. In this script column names have to include either “mean()” or “std()” in the description to be regarded as relevant mean/std columns. I’ve chosen to exclude other columns even if they have “mean” or “std” in the column names without the bracket 

ACTIVITIIES LIST

1 data frame to hold the activity descriptions. This frame is merged with the combined TEST and TRAINING DATA frame using the activityID

TIDY DATA

A tidy data frame is created by grouping the data by Person and Activity type. For each record the mean of each feature is calculated
