#load reshape2 libraray for modifying data
library(reshape2)

# Read the train and test datasets
# unzip the file downloaded from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# export files to smartphone_data folder
datazip <- "getdata_projectfiles_UCI HAR Dataset.zip"
export <- "smartphone_data" 

#unzip will extract the zipfile
if (!file.exists(export)){ 
  unzip(datazip, exdir = export)
}

# loading in required data
stest <- read.table("smartphone_data/UCI HAR Dataset/test/subject_test.txt")
strain <- read.table("smartphone_data/UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("smartphone_data/UCI HAR Dataset/test/X_test.txt")
xtrain <- read.table("smartphone_data/UCI HAR Dataset/train/X_train.txt")

ytest <- read.table("smartphone_data/UCI HAR Dataset/test/Y_test.txt")
ytrain <- read.table("smartphone_data/UCI HAR Dataset/train/Y_train.txt")

features <- read.table("smartphone_data/UCI HAR Dataset/features.txt")
activitylabel <- read.table("smartphone_data/UCI HAR Dataset/activity_labels.txt")
names(activitylabel)[2] <- "ActivityLabel"

# combine test and train for x
xtrain.test <- rbind(xtrain,xtest)

#use descriptive names (#4)
names(xtrain.test) <- as.character(features[, 2])

# combine test and train for y
ytrain.test <- rbind(ytrain,ytest)
names(ytrain.test)[1] <- "ActivityLabelID"

# combine test and train for subject
strain.test <- rbind(strain,stest)
names(strain.test)[1] <- "Subject"


# extracts only mean and std for each measurement
# fetch all mean and sd column (#2)
meanstd <- c(grep("mean()",colnames(xtrain.test),fixed=TRUE),grep("std()",colnames(xtrain.test),fixed=TRUE))
xtrain.test.mean.std <- xtrain.test[, meanstd]

# descriptive activity names (#3)
ytrain.test.activity <- merge(ytrain.test,activitylabel, by=1)

# create one dataset (#1)
datamerge <- cbind(strain.test, ytrain.test.activity, xtrain.test.mean.std)

# Creates a second, independent tidy data set 
# average of each variable for each activity and each subject.
# (#5)
datamelt = melt(datamerge, id.var = c("ActivityLabelID", "ActivityLabel", "Subject"))
data.average = dcast(datamelt , Subject + ActivityLabel ~ variable, mean)

write.table(data.average, file="TidyData.txt", sep=";", row.names=FALSE)