# Getting and Cleaning Data
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:
1.	a tidy data set as described below
2.	a link to a Github repository with your script for performing the analysis
3.	codeBook.md that describes the variables, the data, and any work that you performed to clean up the data
4.	README.md that explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

You should create one R script called run_analysis.R that does the following.
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set.
4.	Appropriately labels the data set with descriptive activity names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!

# Code explanations
*Read the files using the same format: read.csv(file, sep = “”, header = FALSE), where:  
•	file is the name of the file  
•	sep =””, that is the way the values are separated in the files,   
•	header = FALSE, to keep the first row, since the headers and values are in different files.    

The first part of the code reads the features and activity labels from UCI HAR Dataset.  
>## Reading features and activity labels
>features <- read.csv("features.txt", sep = "", header = FALSE)  
>activity_labels <- read.csv("activity_labels.txt", sep = "", header = FALSE)

In this part, the code is reading files from same location and combining first sets, then labels and finally subject IDs for test and train files with rbind function.  
>## Reading and combining sets
>testSet <- read.csv("test/X_test.txt", sep = "", header = FALSE)
>trainingSet <- read.csv("train/X_train.txt", sep = "", header = FALSE)
>mergedSet <- rbind(testSet,trainingSet)

>## Reading and combining activities
>testActivities <- read.csv("test/Y_test.txt", sep = "", header = FALSE)  
>trainingActivities <- read.csv("train/Y_train.txt", sep = "", header = FALSE)  
>mergedActivities <- rbind(testActivities,trainingActivities)

>## Reading and combining subject IDs 
>testSubjectid <- read.csv("test/subject_test.txt", sep = "", header = FALSE)  
>trainingSubjectid <- read.csv("train/subject_train.txt", sep = "", header = FALSE)  
>mergedSubjectid <- rbind(testSubjectid,trainingSubjectid)  

Now, the code assigns column names to the mergedSet and make an extract of the measurements with the words “std” (for standard deviation) or “mean” in their names.  
>## Extracting mean and standard deviation measurements
>names(mergedSet) <- features[ ,2]  
>mergedSet <- mergedSet[ grepl("std|mean", names(mergedSet), ignore.case = TRUE) ]  

This part of the code adds descriptive names for the activities (columns) using the inner_join function from dplyr, this function helps keeping the rows in their original order. 
>## Adding descriptive activity names with dplyr
>library(dplyr)  
>activity_labels <- inner_join(mergedActivities, activity_labels, by ="V1")  

Here, the code merges the columns: subject ids, the names of the activities and, the mean and standard deviation measurements, using cbind. Tydying the data set providing clear names for SubjectID and Activities
>## Creating a tidy data set
>mergedSet <- cbind(mergedSubjectid, y = activity_labels[,2], mergedSet)  
>names(mergedSet)[1:2] <- c("SubjectID", "Activities")  

Finally, the code creates a new independent tidy data set showing the average of each variable breakdown by SubjectID and Activity name.

>## Creating an independent tidy data set with the average of each variable for each activity and each subject
>tidydb_mean <- group_by(mergedSet, SubjectID, Activities) %>%  
>  summarize_all(mean, na.rm = TRUE) %>%  
>  print()
