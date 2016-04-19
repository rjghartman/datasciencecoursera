---
title: "README"
author: "R Hartman"
date: "19 april 2016"
output: html_document
---

##The R script uploaded as run_analysis.R works as following:

1. It reads in the data of the train-, and testsets, if the train and test directories are in your working directory. After reading in, it will merge the sets.

2. It extracts the data of the columns that contain mean and standard deviation data, by using the grep function to search for names with either mean() or std(). After this has been completed, it changes the column names of the merged data from V1 etc. to actual value-names.

3. It reads in the activity file, while changing the names of the activities to lower case. It replaces the numbers of the activities with the actual activity, and the column name to "activity"

4. The script changes the the column name of the subject data to "subject".

5. The data of the subjects, activities and actual sets are merged, with subject and activity being the first 2 columns.

6. Using the function ddply, the colMeans function is used over subject and activity variables for every other variable. This dataset is then written into a file called "tidy data set.txt" into the working directory. 

##Codebook

The codebook.md file contains information about how the variables, the data-set, and which transformations were used on these variables to create a tidy data set.

##.txt file

The "tidy data set.txt" is the output of the script, a.k.a. the tidy data set created for this course project.