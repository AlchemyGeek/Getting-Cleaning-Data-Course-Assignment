#Coursera: Getting and Cleaning Data Course Assignment
# Code Book for MeanGbActivitySubjectData.txt 


The data file was created as part of the Getting and Clearing Data Course assignment.

More details about the course can be found [here](https://www.coursera.org/learn/data-cleaning/home/welcome) and for the assignment [here](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project). 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and a link to the data are available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The `MeanGbActivitySubjectData.txt` file was created after running the scripts included in `run_analysis.R`. For information about the scripts please refer to `README.md`.

## Human Activity Recognition Using Smartphones Dataset 

The following information provides the high level description of the source data as it is described in the README.txt file included in the original data set. 

> Human Activity Recognition Using Smartphones Dataset
> Version 1.0
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Universit? degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws
> 	
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 	
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## Processing Steps 

1. Merged the training and the test sets to create one data set.
1. Extract only the measurements on the mean and standard deviation for each measurement.
1. Use descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, create `MeanGbActivitySubjectHeader.txt`, an independent tidy data set with the average of each variable for each activity and each subject.

## Records

* Subject: Integer 1:30 - Subject unique id number
* Activity: One of the following activities `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`
* 66 collumns, each with the average value of the mean or standard deviation of the feature variables from the original set.

Specifically:

1. tBodyAccMeanX
1. tBodyAccMeanY
1. tBodyAccMeanZ
1. tBodyAccStdX
1. tBodyAccStdY
1. tBodyAccStdZ
1. tGravityAccMeanX
1. tGravityAccMeanY
1. tGravityAccMeanZ
1. tGravityAccStdX
1. tGravityAccStdY
1. tGravityAccStdZ
1. tBodyAccJerkMeanX
1. tBodyAccJerkMeanY
1. tBodyAccJerkMeanZ
1. tBodyAccJerkStdX
1. tBodyAccJerkStdY
1. tBodyAccJerkStdZ
1. tBodyGyroMeanX
1. tBodyGyroMeanY
1. tBodyGyroMeanZ
1. tBodyGyroStdX
1. tBodyGyroStdY
1. tBodyGyroStdZ
1. tBodyGyroJerkMeanX
1. tBodyGyroJerkMeanY
1. tBodyGyroJerkMeanZ
1. tBodyGyroJerkStdX
1. tBodyGyroJerkStdY
1. tBodyGyroJerkStdZ
1. tBodyAccMagMean
1. tBodyAccMagStd
1. tGravityAccMagMean
1. tGravityAccMagStd
1. tBodyAccJerkMagMean
1. tBodyAccJerkMagStd
1. tBodyGyroMagMean
1. tBodyGyroMagStd
1. tBodyGyroJerkMagMean
1. tBodyGyroJerkMagStd
1. fBodyAccMeanX
1. fBodyAccMeanY
1. fBodyAccMeanZ
1. fBodyAccStdX
1. fBodyAccStdY
1. fBodyAccStdZ
1. fBodyAccJerkMeanX
1. fBodyAccJerkMeanY
1. fBodyAccJerkMeanZ
1. fBodyAccJerkStdX
1. fBodyAccJerkStdY
1. fBodyAccJerkStdZ
1. fBodyGyroMeanX
1. fBodyGyroMeanY
1. fBodyGyroMeanZ
1. fBodyGyroStdX
1. fBodyGyroStdY
1. fBodyGyroStdZ
1. fBodyAccMagMean
1. fBodyAccMagStd
1. fBodyBodyAccJerkMagMean
1. fBodyBodyAccJerkMagStd
1. fBodyBodyGyroMagMean
1. fBodyBodyGyroMagStd
1. fBodyBodyGyroJerkMagMean
1. fBodyBodyGyroJerkMagStd

For a descripton of the specific features please refer to the `feature_info.txt` in the original data set.