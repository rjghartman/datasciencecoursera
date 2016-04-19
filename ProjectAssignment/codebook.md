---
title: "Codebook"
author: "R Hartman"
date: "19 april 2016"
output: html_document
---
##In 5 major steps, the data is transformed.
The script first reads in the data with read.table, after which it binds the X_train and X_test via rows, as well as for the labels, and subjects. 
It extracts the data of the columns that contain mean and standard deviation data, by using the grep function to search for names with either mean() or std(). After this has been completed, it changes the column names of the merged data from V1 etc. to actual value-names.
It reads in the activity file, while changing the names of the activities to lower case. It replaces the numbers of the activities with the actual activity, and the column name to "activity". The script changes the the column name of the subject data to "subject".The data of the subjects, activities and actual sets are merged, with subject and activity being the first 2 columns.Using the function ddply, the colMeans function is used over subject and activity variables for every other variable. This dataset is then written into a file called "tidy data set.txt" into the working directory. 

##FILES
X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, and subject_test.txt are the files obtained by downloading according to the course "Getting and cleaning data". 
features.txt and activity_labels.txt are files to help extract proper data and labeling the activites.

##VARIABLES
features, trainset, testset, trainlabels, testlabels, trainsubject, testsubject, activitylabels are the variables used to store the read data.
joinedData, joinedSubject, and joinedLabels are the variables made by rowbinding respectively set, subject and label data.
selectedfeatures contains the index of the grep-search.
joinedData is then subsetted by this index, to only have the mean() and std() columns.
activitylabels is changed to lowercase, and the numbers in the joinedLabels variable are replaced by the actual activities contained in the activitylabels variable.
The column name of joinedLabels is changed to "activity"
The column name of joinedSubject is changed to "subject"
All data is then bound in orderly fashion in the variable data, with cbind, with subject being the first column, followed by subject and the actual data. 
tidy_data is the variable that contains the dataframe after using ddply on data to average all the values for all the activities for all the subjects. 