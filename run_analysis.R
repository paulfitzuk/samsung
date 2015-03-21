# script needs to run with working directory "./UCI HAR Dataset"
library(dplyr)

# read in the 3 train files and combine into a single data frame

filetrain_subject <- "./train/subject_train.txt"
filetrain_X <- "./train/X_train.txt"
filetrain_y <- "./train/y_train.txt"

train_subject <- read.table(filetrain_subject)
train_X <- read.table(filetrain_X)
train_y <- read.table(filetrain_y)

# read in the 3 train files and combine into a single data frame

filetest_subject <- "./test/subject_test.txt"
filetest_X <- "./test/X_test.txt"
filetest_y <- "./test/y_test.txt"

test_subject <- read.table(filetest_subject)
test_X <- read.table(filetest_X)
test_y <- read.table(filetest_y)


# read in features list
filefeatures <- "./features.txt"
features <- read.table(filefeatures)

colnames(test_X) <- c(as.character(features$V2))
colnames(train_X) <- c(as.character(features$V2))

colnames(test_subject) <- c("PersonID")
colnames(test_y) <- c("Activity")
colnames(train_subject) <- c("PersonID")
colnames(train_y) <- c("Activity")

#remove unwanted columns - keeping just those that have 'mean()' or 'std()'
test_X <- test_X[,-which(!grepl("mean\\()|std\\()", colnames(test_X)))]
train_X <- train_X[,-which(!grepl("mean\\()|std\\()", colnames(train_X)))]

#combine
train <- cbind(train_subject, train_y, train_X)
test <- cbind(test_subject, test_y, test_X)

# concateonate data frames

train_test <- rbind(train, test)

# read in activities list
fileactivity <- "./activity_labels.txt"
activity <- read.table(fileactivity)
colnames(activity) <- c('Activity','ActivityDescription')

train_test <- merge(activity, train_test, by.x="Activity", by.y="Activity")
train_test <- train_test[,-1]

tidy_train_test <- train_test %>% group_by(PersonID, ActivityDescription) %>% summarise_each(funs(mean))

write.table(tidy_train_test, file = "Tidy_Train_Test.txt", row.name=FALSE)

#remove data frames no longer needed
rm(test)
rm(test_subject)
rm(test_X)
rm(test_y)
rm(train)
rm(train_subject)
rm(train_X)
rm(train_y)
rm(features)
rm(activity)

