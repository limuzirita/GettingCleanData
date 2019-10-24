# Muzi Li
# Get Clean Data Final Assignment

#Download data and unzip file
filename <- "Coursera_DS3_Final.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename,exdir =getwd()) 
}

#Read tables
#Features and activities
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
#Subjects
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
#Y Data
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
#X Data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)

#Question 1: Merges the training and the test sets to create one data set.
#Aggregate tables
Subject <- rbind(subject_train, subject_test)
Y <- rbind(y_train, y_test)
X <- rbind(x_train, x_test)
Data <- cbind(Subject, Y, X)

#Question 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#Select only mean and std variables/columns from data
library(dplyr)
Extracted_Data <- Data %>% select(subject, code, contains("mean"), contains("std"))

#Question 3: Uses descriptive activity names to name the activities in the data set.
#Name activities (provide corresponding name for code) lookup table
Extracted_Data$code <- activities[Extracted_Data$code, 2]

#Question 4: Appropriately labels the data set with descriptive variable names.
names(Extracted_Data)[1] = "Subject"
names(Extracted_Data)[2] = "Activity"
names(Extracted_Data)<-gsub("Acc", "Accelerometer", names(Extracted_Data))
names(Extracted_Data)<-gsub("Gyro", "Gyroscope", names(Extracted_Data))
names(Extracted_Data)<-gsub("BodyBody", "Body", names(Extracted_Data))
names(Extracted_Data)<-gsub("Mag", "Magnitude", names(Extracted_Data))
names(Extracted_Data)<-gsub("^t", "Time", names(Extracted_Data))
names(Extracted_Data)<-gsub("^f", "Frequency", names(Extracted_Data))
names(Extracted_Data)<-gsub("tBody", "TimeBody", names(Extracted_Data))
names(Extracted_Data)<-gsub("-mean()", "Mean", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("-std()", "STD", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("-freq()", "Frequency", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("angle", "Angle", names(Extracted_Data))
names(Extracted_Data)<-gsub("gravity", "Gravity", names(Extracted_Data))
names(Extracted_Data)<-gsub("...", ".", names(Extracted_Data),fixed=TRUE)
names(Extracted_Data)<-gsub("..", ".", names(Extracted_Data),fixed=TRUE)

#Question 5: From the data set in step 4, creates a second, independent tidy data set with the average of each 
          #variable for each activity and each subject.
Clean_Data <- Extracted_Data %>%
  group_by(Activity,Subject) %>%
  summarise_all(funs(mean))

write.table(Clean_Data, "FinalData.txt", row.name=FALSE)








