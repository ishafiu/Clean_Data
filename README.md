Clean_Data
==========

The assignment uploads for Clean_Data

The run_analyis.R performs the following tasks

1.Merges the training and test sets to create one data set
2. Extracts only the measurements on the mean and stadard deviation for each measurement
3. Uses dexcriptive activity names to name the activities in the data set
4. Appropriately lables the data set with the descriptive variable names
5. From the data step in step 4, creates a second, independet tidy data set with the average of each variable for each activity and eacch subject

Instructions to run the analysis
You have to ensure that the following file locations are changed appropriately 

file_loc_xtest <-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
file_loc_xtrain <-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
file_loc<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
file_loc<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
sub_file_loc_test<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/test/subject_test.txt"
sub_file_loc_train<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/train/subject_train.txt"
