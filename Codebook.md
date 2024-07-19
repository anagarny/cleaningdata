# Dataset Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## Dataset information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Attribute information:
For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Script to create the codebook file for tidydb
```javascript
make.codeBook <- function(set){
  library(knitr)
  library(magrittr)
 
  db <- data.frame(
    row.names = NULL,
    variable = names(tidydb_mean),
    class = sapply(tidydb_mean, class),
    range = sapply(tidydb_mean, function(x)
      if(class(x) == "numeric" ||
         class(x) == "integer")
        paste(format(round(min(x),3)), format(round(max(x),3)), sep = "/")
      else if (class(x) == "factor")
        paste(levels(x), collapse = " / ")
      else
        class (x)),
    mean = sapply(tidydb_mean, function(x)
      if(class(x) == "numeric")
        format(round(mean(x),3))
      else
        "Not available")
)

db %>%
  kable()
write.table(db, “codebook.md”, sep = “ | ”)
}
```


## The dataset includes the following variables:
|               variable               |  class  |                                      range                                      |      mean     |
|:------------------------------------:|:-------:|:-------------------------------------------------------------------------------:|:-------------:|
| SubjectID                            | integer | 1/30                                                                            | Not available |
| Activities                           | factor  | LAYING / SITTING / STANDING / WALKING / WALKING_DOWNSTAIRS /   WALKING_UPSTAIRS | Not available |
| tBodyAcc-mean()-X                    | numeric | 0.222/0.301                                                                     | 0.274         |
| tBodyAcc-mean()-Y                    | numeric | -0.041/-0.001                                                                   | -0.018        |
| tBodyAcc-mean()-Z                    | numeric | -0.153/-0.075                                                                   | -0.109        |
| tBodyAcc-std()-X                     | numeric | -0.996/0.627                                                                    | -0.558        |
| tBodyAcc-std()-Y                     | numeric | -0.99/0.617                                                                     | -0.46         |
| tBodyAcc-std()-Z                     | numeric | -0.988/0.609                                                                    | -0.576        |
| tGravityAcc-mean()-X                 | numeric | -0.68/0.975                                                                     | 0.697         |
| tGravityAcc-mean()-Y                 | numeric | -0.48/0.957                                                                     | -0.016        |
| tGravityAcc-mean()-Z                 | numeric | -0.495/0.958                                                                    | 0.074         |
| tGravityAcc-std()-X                  | numeric | -0.997/-0.83                                                                    | -0.964        |
| tGravityAcc-std()-Y                  | numeric | -0.994/-0.644                                                                   | -0.952        |
| tGravityAcc-std()-Z                  | numeric | -0.991/-0.61                                                                    | -0.936        |
| tBodyAccJerk-mean()-X                | numeric | 0.043/0.13                                                                      | 0.079         |
| tBodyAccJerk-mean()-Y                | numeric | -0.039/0.057                                                                    | 0.008         |
| tBodyAccJerk-mean()-Z                | numeric | -0.067/0.038                                                                    | -0.005        |
| tBodyAccJerk-std()-X                 | numeric | -0.995/0.544                                                                    | -0.595        |
| tBodyAccJerk-std()-Y                 | numeric | -0.99/0.355                                                                     | -0.565        |
| tBodyAccJerk-std()-Z                 | numeric | -0.993/0.031                                                                    | -0.736        |
| tBodyGyro-mean()-X                   | numeric | -0.206/0.193                                                                    | -0.032        | 
| tBodyGyro-mean()-Y                   | numeric | -0.204/0.027                                                                    | -0.074        | 
| tBodyGyro-mean()-Z                   | numeric | -0.072/0.179                                                                    | 0.087         |
| tBodyGyro-std()-X                    | numeric | -0.994/0.268                                                                    | -0.692        |
| tBodyGyro-std()-Y                    | numeric | -0.994/0.477                                                                    | -0.653        |
| tBodyGyro-std()-Z                    | numeric | -0.986/0.565                                                                    | -0.616        |
| tBodyGyroJerk-mean()-X               | numeric | -0.157/-0.022                                                                   | -0.096        |
| tBodyGyroJerk-mean()-Y               | numeric | -0.077/-0.013                                                                   | -0.043        |
| tBodyGyroJerk-mean()-Z               | numeric | -0.092/-0.007                                                                   | -0.055        |
| tBodyGyroJerk-std()-X                | numeric | -0.997/0.179                                                                    | -0.704        |
| tBodyGyroJerk-std()-Y                | numeric | -0.997/0.296                                                                    | -0.764        |
| tBodyGyroJerk-std()-Z                | numeric | -0.995/0.193                                                                    | -0.71         |
| tBodyAccMag-mean()                   | numeric | -0.986/0.645                                                                    | -0.497        |
| tBodyAccMag-std()                    | numeric | -0.986/0.428                                                                    | -0.544        |
| tGravityAccMag-mean()                | numeric | -0.986/0.645                                                                    | -0.497        |
| tGravityAccMag-std()                 | numeric | -0.986/0.428                                                                    | -0.544        |
| tBodyAccJerkMag-mean()               | numeric | -0.993/0.434                                                                    | -0.608        |
| tBodyAccJerkMag-std()                | numeric | -0.995/0.451                                                                    | -0.584        |
| tBodyGyroMag-mean()                  | numeric | -0.981/0.418                                                                    | -0.565        |
| tBodyGyroMag-std()                   | numeric | -0.981/0.3                                                                      | -0.63         |
| tBodyGyroJerkMag-mean()              | numeric | -0.997/0.088                                                                    | -0.736        |
| tBodyGyroJerkMag-std()               | numeric | -0.998/0.25                                                                     | -0.755        |
| fBodyAcc-mean()-X                    | numeric | -0.995/0.537                                                                    | -0.576        |
| fBodyAcc-mean()-Y                    | numeric | -0.989/0.524                                                                    | -0.489        |
| fBodyAcc-mean()-Z                    | numeric | -0.989/0.281                                                                    | -0.63         |
| fBodyAcc-std()-X                     | numeric | -0.997/0.659                                                                    | -0.552        |
| fBodyAcc-std()-Y                     | numeric | -0.991/0.56                                                                     | -0.481        |
| fBodyAcc-std()-Z                     | numeric | -0.987/0.687                                                                    | -0.582        |
| fBodyAcc-meanFreq()-X                | numeric | -0.636/0.159                                                                    | -0.232        |
| fBodyAcc-meanFreq()-Y                | numeric | -0.38/0.467                                                                     | 0.012         |
| fBodyAcc-meanFreq()-Z                | numeric | -0.52/0.403                                                                     | 0.044         |
| fBodyAccJerk-mean()-X                | numeric | -0.995/0.474                                                                    | -0.614        |
| fBodyAccJerk-mean()-Y                | numeric | -0.989/0.277                                                                    | -0.588        |
| fBodyAccJerk-mean()-Z                | numeric | -0.992/0.158                                                                    | -0.714        |
| fBodyAccJerk-std()-X                 | numeric | -0.995/0.477                                                                    | -0.612        |
| fBodyAccJerk-std()-Y                 | numeric | -0.99/0.35                                                                      | -0.571        |
| fBodyAccJerk-std()-Z                 | numeric | -0.993/-0.006                                                                   | -0.756        |
| fBodyAccJerk-meanFreq()-X            | numeric | -0.576/0.331                                                                    | -0.069        |
| fBodyAccJerk-meanFreq()-Y            | numeric | -0.602/0.196                                                                    | -0.228        |
| fBodyAccJerk-meanFreq()-Z            | numeric | -0.628/0.23                                                                     | -0.138        |
| fBodyGyro-mean()-X                   | numeric | -0.993/0.475                                                                    | -0.637        |
| fBodyGyro-mean()-Y                   | numeric | -0.994/0.329                                                                    | -0.677        |
| fBodyGyro-mean()-Z                   | numeric | -0.986/0.492                                                                    | -0.604        |
| fBodyGyro-std()-X                    | numeric | -0.995/0.197                                                                    | -0.711        |
| fBodyGyro-std()-Y                    | numeric | -0.994/0.646                                                                    | -0.645        |
| fBodyGyro-std()-Z                    | numeric | -0.987/0.522                                                                    | -0.658        |
| fBodyGyro-meanFreq()-X               | numeric | -0.396/0.249                                                                    | -0.105        |
| fBodyGyro-meanFreq()-Y               | numeric | -0.667/0.273                                                                    | -0.167        |
| fBodyGyro-meanFreq()-Z               | numeric | -0.507/0.377                                                                    | -0.057        |
| fBodyAccMag-mean()                   | numeric | -0.987/0.587                                                                    | -0.537        |
| fBodyAccMag-std()                    | numeric | -0.988/0.179                                                                    | -0.621        |
| fBodyAccMag-meanFreq()               | numeric | -0.312/0.436                                                                    | 0.076         |
| fBodyBodyAccJerkMag-mean()           | numeric | -0.994/0.538                                                                    | -0.576        |
| fBodyBodyAccJerkMag-std()            | numeric | -0.994/0.316                                                                    | -0.599        |
| fBodyBodyAccJerkMag-meanFreq()       | numeric | -0.125/0.488                                                                    | 0.163         |
| fBodyBodyGyroMag-mean()              | numeric | -0.987/0.204                                                                    | -0.667        |
| fBodyBodyGyroMag-std()               | numeric | -0.981/0.237                                                                    | -0.672        |
| fBodyBodyGyroMag-meanFreq()          | numeric | -0.457/0.41                                                                     | -0.036        |
| fBodyBodyGyroJerkMag-mean()          | numeric | -0.998/0.147                                                                    | -0.756        |
| fBodyBodyGyroJerkMag-std()           | numeric | -0.998/0.288                                                                    | -0.772        |
| fBodyBodyGyroJerkMag-meanFreq()      | numeric | -0.183/0.426                                                                    | 0.126         |
| angle(tBodyAccMean,gravity)          | numeric | -0.163/0.129                                                                    | 0.007         |
| angle(tBodyAccJerkMean),gravityMean) | numeric | -0.121/0.203                                                                    | 0.001         |
| angle(tBodyGyroMean,gravityMean)     | numeric | -0.389/0.444                                                                    | 0.022         |
| angle(tBodyGyroJerkMean,gravityMean) | numeric | -0.224/0.182                                                                    | -0.011        |
| angle(X,gravityMean)                 | numeric | -0.947/0.738                                                                    | -0.524        |
| angle(Y,gravityMean)                 | numeric | -0.875/0.425                                                                    | 0.079         |
| angle(Z,gravityMean)                 | numeric | -0.874/0.39                                                                     | -0.04         |
