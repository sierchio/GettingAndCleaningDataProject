## Getting and Cleaning Data Course Project

#First set the working directory and obtain the data set
# No test on whether the file or folder exists since I know the 
# file doesn't exist and I want it in this folder
setwd("/users/jen/R_Programming")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,"accelerometer_dataset.zip",method="curl")
unzip("accelerometer_dataset.zip")

# Read in labels
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)
feature_label <- read.table("UCI HAR Dataset/features.txt",header=FALSE)

# Read in training and test sets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)

# Assign labels to the data
colnames(x_train) <- feature_label[,2]
colnames(x_test) <- feature_label[,2]
colnames(y_train) <- "ActivityLabel"
colnames(y_test) <- "ActivityLabel"
colnames(subject_train) <- "SubjectLabel"
colnames(subject_test) <- "SubjectLabel"
colnames(activity_label) <- c("ActivityLabel","Activity")

# 1) merge the data sets
# organize the sets by subject, activity, then the data (column bind)
training_set <- cbind(subject_train,y_train,x_train)
test_set <- cbind(subject_test,y_test,x_test)
full_set <- rbind(training_set,test_set) # row bind since it's by subject

# 2) Extract measurements on the mean and std
# looking at the labels, we search for "mean" and "std" with grepl
full_column_names <- colnames(full_set)
extracted_columns <- (grepl("SubjectLabel",full_column_names) | grepl("ActivityLabel",full_column_names) |
                      grepl("mean..",full_column_names) | grepl("std..",full_column_names))
mean_std_set <- full_set[,extracted_columns]

# 3) Label the activities in the data set with descriptive names
mean_std_labeled_set <- merge(mean_std_set,activity_label,by="ActivityLabel",all.x=TRUE)

# 4) Label the columns with descriptive variable names
colnames(mean_std_labeled_set) <- gsub("^t","time",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("^f","frequency",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("BodyBody","Body",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("mean()..","Mean",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("std()..","Std",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("Acc","Accelerometer",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("Gyro","Gyroscope",colnames(mean_std_labeled_set))
colnames(mean_std_labeled_set) <- gsub("Mag","Magnitude",colnames(mean_std_labeled_set))

# 5) Create tidy set with average of each variable for each activity and each subject
# first remove column with activity names (can't average over that column)
mean_std_labeled_set2 <- mean_std_labeled_set[,colnames(mean_std_labeled_set) != 'Activity']
# aggregate by formula, order first by activity then by subject
tidy_set <- aggregate(. ~ SubjectLabel+ActivityLabel,mean_std_labeled_set2,mean)
tidy_set <- tidy_set[order(tidy_set$ActivityLabel,tidy_set$SubjectLabel),]
# export the data
write.table(tidy_set, "tidy_set.txt", row.name=FALSE)
