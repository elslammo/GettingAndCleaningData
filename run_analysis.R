# Coursera class Getting & Cleaning Data (https://class.coursera.org/getdata-008)
# Final course project R script.
# Please refer to README.md and CodeBook.md for details.
# Author:  Lisa Salmon
# Date:    October 26, 2014

if (file.exists("./data")) {

    dataDir <- "./data/"
    
    # gather separate test and training data elements
    testSubjects <- read.table(paste(dataDir, 'test/subject_test.txt', sep=''))
    testFeatures <- read.table(paste(dataDir, 'test/X_test.txt', sep=''))
    testLabels <- read.table(paste(dataDir, 'test/y_test.txt', sep=''))

    trainSubjects <- read.table(paste(dataDir, 'train/subject_train.txt', sep=''))
    trainFeatures <- read.table(paste(dataDir, 'train/X_train.txt', sep=''))
    trainLabels <- read.table(paste(dataDir, 'train/y_train.txt', sep=''))

    # combine each set
    allSubjects <- rbind(testSubjects, trainSubjects)
    allFeatures <- rbind(testFeatures, trainFeatures)
    allLabels <- rbind(testLabels, trainLabels)
    
    # subset the features we're interested in
    featureNames <- read.table(paste(dataDir, 'features.txt', sep=''))
    featureNameVector <- featureNames[,"V2"]
    featureCols <- (grepl("mean()",featureNameVector, fixed=TRUE) | grepl("std()",featureNameVector, fixed=TRUE))
    subsetFeatures <- allFeatures[, featureCols]
    subsetFeatureNames <- featureNames[featureCols, 2]
    
    # clean up feature column names to be more human readable
    cleanColName <- function(colName) {
        # replace initial 't' and 'f' with 'Time' & 'Freq'
        repl <- ""
        if (substring(colName,1,1) == "t") {
            repl <- "Time_"
        } else if (substring(colName,1,1) == "f") {
            repl <- "Freq_"
        }
        if (nchar(repl) > 0) {
            colName <- paste(repl, substring(colName, 2, nchar(colName)), sep="")
        }
        
        # replace '-std()' and '-mean()'
        colName <- sub("-std()", "_StdDeviation", colName, fixed = TRUE)
        colName <- sub("-mean()", "_MeanValue", colName, fixed = TRUE)
        
        # replace 'BodyBody' with just 'Body'
        colName <- sub("BodyBody", "Body", colName, fixed = TRUE)
    }
    cleanNames <- character(length(subsetFeatureNames))
    for (i in 1:length(subsetFeatureNames)) {
        cleanNames[i] <- cleanColName(as.character(subsetFeatureNames[i]))
    }
    
    # change dataset column names to cleaned feature names
    colnames(subsetFeatures) <- cleanNames
    
    # translate vector of numeric activity labels to a matching vector of human-readable activity names
    activityNames <- read.table(paste(dataDir, 'activity_labels.txt', sep=''))
    activityNameVector <- activityNames[,"V2"]
    labelNumberVector <- allLabels[,"V1"]
    labelNameVector <- character(length(labelNumberVector))
    for (i in 1:length(labelNumberVector)) {
        labelNameVector[i] <- as.character(activityNameVector[labelNumberVector[i]])
    }
    
    # create new final data set with subsetted features
    # plus activity names as a new column
    subsetData <- cbind(labelNameVector, subsetFeatures)
    names(subsetData)[1] <- "ActivityName"
    
    # add the subject numbers as a new column in the final data set
    subsetData <- cbind(allSubjects[,1], subsetData)
    names(subsetData)[1] <- "Subject"
    
    # aggregate the data, calculating the mean for each subject-activitiy combination
    library(plyr)
    averages <- ddply(subsetData, c("Subject", "ActivityName"), numcolwise(mean))
    averages
    
} else {
    print("Data directory is missing.")
    print("Data must first be downloaded from:")
    print("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    print("It must then be unzipped, and saved to a folder called 'data' in the current working directory.")
}



