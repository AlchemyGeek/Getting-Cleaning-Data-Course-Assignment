##
## Coursera Cleaning Data Course Project
##
## https://www.coursera.org/learn/data-cleaning/
## Perform a set of operations on
## Human Activity Recognition Using Smartphones Dataset
##
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for 
##   each measurement.
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names.
## 5.From the data set in step 4, creates a second, independent tidy 
##   data set with the average of each variable for each activity and each subject.

library(dplyr)

## Merge 2 CSV files and write to another CSV file
mergeFile <- function(src_dir, trg_dir, src_flnm1, src_flnm2, trg_flnm)
{
    print(paste("Merging:",src_flnm1,"and",src_flnm2,"to",trg_flnm))

    # Load train and trest data
    src_path <- paste0(src_dir,"/test/",src_flnm1)
    data1 <- read.csv(src_path,header=FALSE,sep="")
    src_path <- paste0(src_dir,"/train/",src_flnm2)
    data2 <- read.csv(src_path,header=FALSE,sep="")
    
    # Merge data
    merged_data <- rbind(data1,data2)
    
    # Write to merged file
    trg_path <- paste0(trg_dir,"/",trg_flnm)    
    write.table(merged_data,trg_path,col.names = FALSE,row.names = FALSE)    
}

## Merges the training and the test sets to create one data set.
## src_dir - Directory of original data
## trg_dir - Directory for the merged data, create dir if doesn't exist
mergeData <- function(src_dir, trg_dir)
{
    ## Create target directory if it doesn't exist
    if( !dir.exists(trg_dir) )
        dir.create(trg_dir)
 
    ## Create trg_dir/Inertial Signals
    if( !dir.exists(paste0(trg_dir,"/Inertial Signals")) )
        dir.create(paste0(trg_dir,"/Inertial Signals"))
    
    ## Copy helper files with activity and feature descriptions
    file.copy(paste0(src_dir,"/features.txt"),paste0(trg_dir,"/features.txt"))
    file.copy(paste0(src_dir,"/activity_labels.txt"),
              paste0(trg_dir,"/activity_labels.txt"))
    
    ## Find all the .txt files in the test directory
    testtxtfiles <- dir(paste0(src_dir,"/test/"),
        pattern = "*.txt", recursive=TRUE)
    
    ## For each test textfile
    for( testtxtfile in testtxtfiles)
    {
        traintxtfile <- sub("test","train",testtxtfile)
        mergedtxtfile <- sub("test","merged",testtxtfile)
        
        mergeFile(src_dir,trg_dir,testtxtfile,traintxtfile,mergedtxtfile)
    }
 
}

## mergeData2 - Wrapper to meet assignment submition assignment requirements.
## Assume thet setwd is in the 'UCI HAR Dataset 2' directory
mergeData2 <- function()
{
    mergeData(".","Merged")
}

#####################################################################

## Return mean and std features collumns
##
## - Extracts only the measurements on the mean and standard deviation for 
##   each measurement.
## - Uses descriptive activity names to name the activities in the data set
## - Appropriately labels the data set with descriptive variable names.
##
## dataDir - Directory created by mergeData()
##
meanstdFeatures <- function(dataDir)
{
    ## Read feature collumn names from feature.txt
    featureVars <- read.csv(paste0(dataDir,"/features.txt"),sep="",header=FALSE)
    
    ## Read X feature values
    xFeatures <- read.csv(paste0(dataDir,"/X_merged.txt"), sep="", header=FALSE)
    
    ## Delete columns that are not std or mean
    ## Add column label
    curCol <- 1
    for( i in 1:length(featureVars$V2) ) {
        ## The collumn is not mean & std
        if( length(grep("-mean\\(\\)",featureVars$V2[i])) == 0 && 
            length(grep("-std\\(\\)",featureVars$V2[i])) == 0 )
            ## Remove collumn
            xFeatures[curCol] = NULL
        else {
            colName <- as.character(featureVars$V2[i])
            
            ## Improve collumn label by removing (-,())
            colName = sub("\\-mean\\(\\)","Mean",colName)
            colName = sub("\\-std\\(\\)","Std",colName)
            colName = gsub("\\-","",colName)

            ## Add column label
            colnames(xFeatures)[curCol]<-colName

            curCol <- curCol + 1
        }
    }
    
    ## Read activity labels
    actlabels <- read.csv(paste0(dataDir,"/activity_labels.txt"),
                          sep="",header=FALSE)

    ## Read activity data and replace activity code with description 
    actlabelsData <- read.csv(paste0(dataDir,"/y_merged.txt"),header = FALSE)
    actlabelsData <- mutate(actlabelsData,V1 = actlabels$V2[V1])
    colnames(actlabelsData)<-c("Activity")    
    
    ## Load subject data
    subjectData <- read.csv(paste0(dataDir,"/subject_merged.txt"), header=FALSE)
    colnames(subjectData)<-c("Subject")
    
    ## Merge 3 tables
    cbind(subjectData,actlabelsData,xFeatures)
}

#####################################################################

##
## Return a data frame with mean of feature variables grouped by activity and subject
##
## - From the data set in step 4, creates a second, independent tidy 
##   data set with the average of each variable for each activity and each subject.
##
## meanstdData - Data frame created by meanstdFeatures()
##
meanActivitySubject <- function(meanstdData)
{
    meanstdData %>%
        group_by(Subject,Activity) %>%
        summarize_each(funs(mean))
}

## 
## meanActivitySubject2 - Wrapper for function to meet assignment submittion requirements
## - Create MeanGbActivitySubjectData.txt file with data
## - Create MeanGBActivitySubjectHeader.txt file with column labels
##
## Assume thet setwd is in the 'UCI HAR Dataset 2' directory after mergeData2 function ran
##
meanActivitySubject2 <- function()
{
    gbData <- meanActivitySubject(meanstdFeatures("Merged"))
    
    write.table(gbData,file="MeanGbActivitySubjectData.txt",row.names = FALSE)
    write.table(names(gbData),file="MeanGbActivitySubjectHeader.txt", row.names = FALSE)
}
