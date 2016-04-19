library(plyr); library(data.table)
#Step 1
#The following piece of script reads in the data in the working directory, and merges it.

features <- read.table("features.txt")
trainset <- read.table("./train/X_train.txt")
testset <- read.table("./test/X_test.txt")
joinedData <- rbind(trainset, testset)

trainlabels <- read.table("./train/y_train.txt")
testlabels <- read.table("./test/y_test.txt")
joinedLabels <- rbind(trainlabels, testlabels)

trainsubject <- read.table("./train/subject_train.txt")
testsubject <- read.table("./test/subject_test.txt")
joinedSubject <- rbind(trainsubject, testsubject)

#Step 2
#The next piece of script only extracts the mean and standard deviation data

selectedfeatures <- grep("-(mean|std)\\(\\)", features[,2])
joinedData <- joinedData[,selectedfeatures]
names(joinedData) <- features[selectedfeatures, 2]

#Step 3
#Naming activities with descriptive names

activitylabels <- read.table("activity_labels.txt")
activitylabels[,2] <- tolower(activitylabels[,2])
joinedLabels[, 1] <- activitylabels[joinedLabels[, 1], 2]
names(joinedLabels) <- "activity"

#Step 4
#Naming subject column
names(joinedSubject) <- "subject"

#Binding all data in orderly fashion
data <- cbind(joinedSubject, joinedLabels, joinedData)

#From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.

tidy_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 3:68]))

#Please upload the tidy data set created in step 5 of the instructions. Please 
#upload your data set as a txt file created with write.table() using row.name=FALSE 

write.table(tidy_data, file = "tidy data set.txt", row.name=FALSE)
