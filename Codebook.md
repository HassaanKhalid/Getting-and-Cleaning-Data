# The following is a codebook describing what each variable represents in the run_analysis.R file

train_x - The X_train dataset

train_y - The y_train dataset

test_X - The X_test dataset

test_y - The y_test dataset

train_subject - The subject_train dataset

test_subject - The subject_test dataset

activity_names - The descriptive activity names

x_data - The merged train_x and test_x dataset

y_data - The merged train_y and test_y dataset

subjectdata - The merged train_subject and test_subject dataset

feature_list - The list of features recorded taken from the features file

mean_and_stdev_features - The features from feature_list which record the mean and standard deviation

complete_data - The merged training and test datasets along with the subject and activity labels

Averages - The averages of every column in the complete_data variable which measures an activity reading. The averages are grouped by individuals and by activity.
