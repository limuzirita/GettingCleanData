This is the codebook for the FinalData.txt after run 5 steps in processing the smartphone data

Step 0: Download and read all data.
features <- features.txt (561 rows, 2 columns)
activities <- activity_labels.txt (6 rows, 2 columns)
subject_train <- test/subject_train.txt (7352 rows, 1 column)
subject_test <- test/subject_test.txt (2947 rows, 1 column)
x_train <- test/X_train.txt (7352 rows, 561 columns)
x_test <- test/X_test.txt (2947 rows, 561 columns)
y_train <- test/y_train.txt (7352 rows, 1 columns)
y_test <- test/y_test.txt (2947 rows, 1 columns)

Step 1: Merges the training and the test sets to create one data set.
Subject (10299 rows, 1 column); Y (10299 rows, 1 column); X (10299 rows, 561 columns) -rbind each dataset
Data (10299 rows, 563 column) -cbind all three datasets

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
Extracted_Data (10299 rows, 88 columns) -Select only first two columns and columns that contain "mean" or "std"

Step 3: Uses descriptive activity names to name the activities in the data set
Use lookup table to match the exact name for variable "code"

Step 4: Appropriately labels the data set with descriptive variable names
Name column 1 as "Subject"
Name column 2 as "Activity"
All "Acc" changes to "Accelerometer"
All "Gyro" changes to "Gyroscope"
All "BodyBody" changes to "Body"
All "Mag" changes to "Magnitude"
All start with character f changes to "Frequency"
All start with character t changes to"Time"
All "..." changes to "."
All ".." changes to "."

Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Clean_Data(180 rows, 88 columns) - Group Extracted_Data by Activity and Subject and compute mean for each variable

Finally: Save Clean_Data as FinalData.txt file using write.table
