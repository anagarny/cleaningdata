run_analysis <- function() { 
  # Reading features and activity labels
  features <- read.csv("features.txt", sep = "", header = FALSE)
  activity_labels <- read.csv("activity_labels.txt", sep = "", header = FALSE)
  
  # Reading and combining sets
  testSet <- read.csv("test/X_test.txt", sep = "", header = FALSE)
  trainingSet <- read.csv("train/X_train.txt", sep = "", header = FALSE)
  mergedSet <- rbind(testSet,trainingSet)

  # Reading and combining activities
  testActivities <- read.csv("test/Y_test.txt", sep = "", header = FALSE)
  trainingActivities <- read.csv("train/Y_train.txt", sep = "", header = FALSE)
  mergedActivities <- rbind(testActivities,trainingActivities)

  # Reading and combining subject IDs 
  testSubjectid <- read.csv("test/subject_test.txt", sep = "", header = FALSE)
  trainingSubjectid <- read.csv("train/subject_train.txt", sep = "", header = FALSE)
  mergedSubjectid <- rbind(testSubjectid,trainingSubjectid)

  # Extracting mean and standard deviation measurements
  names(mergedSet) <- features[ ,2]
  mergedSet <- mergedSet[ grepl("std|mean", names(mergedSet), ignore.case = TRUE) ] 

  # Adding descriptive activity names with dplyr
  library(dplyr)
  activity_labels <- inner_join(mergedActivities, activity_labels, by ="V1")

  # Creating a tidy data set
  mergedSet <- cbind(mergedSubjectid, y = factor(activity_labels[,2]), mergedSet)
  names(mergedSet)[1:2] <- c("SubjectID", "Activities")

  # Creating an independent tidy data set with the average of each variable
  # for each activity and each subject
  tidydb_mean <- group_by(mergedSet, SubjectID, Activities) %>%
   summarize_all(mean, na.rm = TRUE) %>%
    print()
}
