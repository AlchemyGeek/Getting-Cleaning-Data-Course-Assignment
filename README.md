#Coursera: Getting and Cleaning Data Course Assignment

The repo includes the submited code, data, and documentation for the "Getting and Clearing Data Course" assignment. More details about the course can be found [here](https://www.coursera.org/learn/data-cleaning/home/welcome) and for the assignment [here](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project). 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and a link to the data are available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## Assignment 

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

* `run_analysis.R`: Includes all the function to complete the assignment
* `README.md` - This file
* `CodeBook.md` - Information about the data provided in MeanGbActivitySubjectData.txt
* `MeanGbActivitySubjectData.txt `- Includes the data produced in step 5 
* `MeanGbActivitySubjectHeader.txt` - The list of column headers

## Running the Scripts

setwd to the directory you have unzipped the source human activity data.

`setwd("UCI HAR Dataset 2")`

Call function to merge test and train data (step 1).

`mergeData2()`

The directory `Merged` is created with all the .txt files that were merged.

Call function that will perform the steps 2-5 above.

`meanActivitySubject2()`

Two files are created at the working directory `MeanGbActivitySubjectData.txt` and `MeanGbActivitySubjectHeader.txt`.
