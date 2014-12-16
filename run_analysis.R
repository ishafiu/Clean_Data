run_analysis<-function(){



#Question 1. Merge the two data set to create a single data set

#Read the features from features table
features <-read.table("./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#Readt the test and train data and change the name of the columns to the relevent feature names
file_loc_xtest <-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
file_loc_xtrain <-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
x_test <- read.table(file_loc_xtest, col.names=features[,2])
x_train <- read.table(file_loc_xtrain, col.names=features[,2])


# The columns merged are given a code to identify between test data and train data
x_test$data.type<-rep(1)  # type 1 = test data
x_train$data.type<-rep(2) # type 2 = train data

#Finally merge the two data sets
full_setX<-rbind(x_test,x_train)

#==================================================================================

#Question 2. Extract only the measurements on the mean and the standard deviation for each measurement
ms_features <-features[grep("mean|std\\(", features[,2]),]
mean_and_std <-full_setX[,ms_features[,1]]


#==================================================================================
#Question 3. Use descriptive activity names to name the activities in the data set

file_loc<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(file_loc,col.names=c("activity"))
file_loc<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(file_loc, col.names=c("activity"))

# The columns merged are given a code to identify between test data and train data
y_test$data.type<-rep(1) # type 1 = test data
y_train$data.type<-rep(2)# type 2 = train data
full_setY<-rbind(y_test,y_train)

#===============================================================================
#Question 4. Appropriate label the data set with descriptive activity names.
X_with_labels <- cbind(full_setY, full_setX)

mean_and_std_with_labels <- cbind(full_setY, mean_and_std)

head(mean_and_std_with_labels)

#Question 6. Creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject. 
sub_file_loc_test<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/test/subject_test.txt"
sub_file_loc_train<-"./Data Cleaning/getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/train/subject_train.txt"
subject_test <- read.table(sub_file_loc_test, col.names = c('subject'))
subject_train <- read.table(sub_file_loc_train, col.names = c('subject'))
subject <- rbind(subject_test, subject_train)
head(subject)
averages <- aggregate(full_setX, by = list(activity = full_setY[,1], subject = subject[,1]), mean)
write.csv(averages, file='tidy_dataset.txt', row.names=FALSE)
}

