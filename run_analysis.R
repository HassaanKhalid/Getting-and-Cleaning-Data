library(plyr)
##Merge Training and Test sets to create one data set (Step 1)
  ##Loading data into R (Step 1A)

train_x <- read.table("X_train.txt") ##To read Train X dataset
train_y <- read.table("y_train.txt") ##To read Train Y dataset
train_subject <- read.table("subject_train.txt") ##To read Subject train dataset

test_x <- read.table("X_test.txt") ##To read the test X dataset
test_y <- read.table("y_test.txt") ##To read the test Y dataset 
test_subject <- read.table("subject_test.txt") ##To read Subject test dataset

activity_names <- read.table("activity_labels.txt") ##To read descriptive activity names into R

  ##Merging datasets (Step 1B)
x_data <- rbind(train_x, test_x) ##merging x datasets
y_data <- rbind(train_y, test_y) ##merging y datasets
subjectdata <- rbind(train_subject, test_subject) ##merging subject datasets
names(subjectdata) <- "subject"

##Extracts only the measurements on the mean and 
##standard deviation for each measurement (Step 2)
  ##Reading list of features into R (Step 2A)
feature_list <- read.table("features.txt") 

  ##to get feature names with mean or std mentioned from second column of features (Step 2B)
  ##use grep function. 
  ##Link to usage "https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html"
mean_and_stdev_features <- grep("-(mean|std)\\(\\)", feature_list[, 2]) 

  ##to get correct data columns (Step 2C)
x_data <- x_data[, mean_and_stdev_features]

  ##to get correct names for data columns (Step 2D)
names(x_data) <- feature_list[mean_and_stdev_features, 2]

##Uses descriptive activity names to name the activities in the data set (Step 3)
  
  ##update values with correct activity names (Step 3A)
  ##Relabel first column of y_data through reading row number equalling y_data value
  ##from the second column of activity names data
y_data[, 1] <- activity_names[y_data[, 1], 2]

  ##correct column name - y_data has only one column - renamed as activity (Step 3B)
names(y_data) <- "activity"

##Appropriately labels the data set with descriptive variable names (Step 4)
complete_data <- cbind(x_data, y_data, subjectdata)

##From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject

averages <- ddply(complete_data, .(activity, subject), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages.txt", row.name=FALSE)