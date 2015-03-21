Run_Analysis.R
21-March-2015

Script created for Coursera ‘Getting and Cleaning Data’ course week3 assignment

The script reads in data about people in various states of activity recorded by a mobile phone. It combines the data sets, removes the columns not required, summarises the data by person/activity and writes out a file. The output file has one record per person per activity type.

Working Directory: script needs to run with working directory "./UCI HAR Dataset" which contains the input data


Input Files: read in the 3 train files and combine into a single data frame.
	     Read in the 3 test files and combine into a single data frame.
 	     Read in the description of the features

Colummn Names: Use the feature read in to set the column names of the train and test data frames
	       Keep the columns that relate to mean() and std() features.
	       In this script the required columns are identified if the column name contains either “mean()” or “std()”. Columns that contain “mean” or “std” without the brackets are not included.

Combine data frames: the rows for from the test data is combined with the training data using rbind()

Activity Description: update the data frame with the activity description by merging the activity frame joining with the activityID. Followed by removal of the activityID column

Tidy Data: group the data frame by each person and activity type. Summarise each combination of person/activity to get the mean for each feature

Write Output: using write table to create the output file. Row names excluded
