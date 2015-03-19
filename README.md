# Getting-and-Cleaning-Data
This repository holds the final project for the third course in the Data Science specialization (Getting and Cleaning Data) from John Hopkins University through Coursera.

# Explanation of the code
The run_analysis.R file first loads the datasets x_train, x_test, y_train, y_test, subject_train, subject_test and activity_labels data files using the read.table function

The x_train, x_test data sets are merged using an rbind command.
The y_train, y_test data sets are merged using a similar rbind command
The subject_train and subject_test datasets are similarly merged

The name of the only column in the subject_train + subject_test merged dataset is set to "subject"

The feature_list dataset is also loaded into R using the read.table command
The features having the word stdev or mean in their names are separated by using a grep command
Then, the merged dataset of x_train & x_test is subsetted using the activity names dervied from the grep command. 
The columns derived from above are named using the same column names as subsetted through the grep command

The numbers used to define the activities in the merged dataset of y_test & y_train are then matched with their proper names from the activity_labels data

The merged x dataset, y dataset and subject dataset are then put into a single table using a cbind command.

Averages of each measurement on the dataset involves taking averages of all 66 columns but not the last 2 columns.
Averages are hence computed for every column using the ddplyr function with a colMeans command on the first 64 columns.
The data is grouped by activity labels and subject numbers.
These means are then written out in a new text file.
