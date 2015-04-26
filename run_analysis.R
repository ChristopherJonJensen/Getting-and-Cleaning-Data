## This project is based on data collected by:
## [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#include the dplyr library (used below for some data manipulation tasks)
library("dplyr")

## As per the assignment description, I am assuming here that the files are indeed present in the directory.
## Read files
test_y <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
test_x <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
test_subj <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
train_y <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
train_x <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
train_subj <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
features <-  read.table(file = "UCI HAR Dataset/features.txt", strip.white=TRUE)
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt", strip.white=TRUE)

## First, extract the column names read into the "features" data-table.
## Then use grep to find the column names that include the strings "std" and "mean"
feature_vals <- features[,2]
std_cols <- grep(pattern = "std", x = feature_vals)
mean_cols <- grep(pattern = "mean", x = feature_vals)
std_and_mean_cols <- sort(c(std_cols,mean_cols))

## apply the column names to the two large data sets and subset down to the required columns
names(test_x) <- make.names(feature_vals, unique=TRUE)
names(train_x) <- make.names(feature_vals, unique=TRUE)
test_x <- test_x[,std_and_mean_cols]
train_x <- train_x[,std_and_mean_cols]

##merge the data
all_test_data <- cbind(test_subj,test_y,test_x)
all_train_data <- cbind(train_subj,train_y,train_x)
merged_data <- rbind(all_test_data,all_train_data)

## apply meaningful names to the first two columns (Subject and Task)
curnames <- names(merged_data)
curnames[1] <- "Subject"
curnames[2] <- "Task"
names(merged_data) <- curnames

##substitute in meaningful activity names
merged_data$Task <- factor(merged_data$Task,levels = 1:6, labels=activity_labels[,2])

##Now, use the dplyr library to group the data and compute the averages for each numerical variable.
compute_tbl <- as.tbl(merged_data)
compute_tbl <- group_by(compute_tbl, Subject, Task)
output <- summarise_each(compute_tbl, funs(mean))

#Output the tidy data table
write.table(output, file="tidy.txt", row.names = FALSE)