Coursera class 'Getting and Cleaning Data' - Final Course Project CodeBook
===========================================================================
Author: Lisa Salmon  //  Date: October 26, 2014

This file describes the process followed for generating the requested tidy data set from an original set of data files. It includes the following sections below:

* __Original Data Set__ - information about the original data set and where to get it

* __New Tidy Data Set__ - the variables contained within the resulting tidy data set

* __Process Followed__ - the steps taken to convert the original data set to the new tidy data set

Original Data Set
-----------------
The original raw data is the "[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)" available from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html). As stated in the abstract, it is a "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors."

The original data set used in this process can be downloaded [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The original data set inclues multiple files and folders, with test data separated from training data. Each of these data sets includes a separate file for activity measurements, activity labels, and the subject (person) performing the activity. 

The downloaded data extracts into the following folders and files:

* activity\_labels.txt  
* features\_info.txt  
* features.txt  
* README.txt  
* test/subject_test.txt  
* test/X\_test.txt  
* test/y\_test.txt  
* train/Inertial Signals/\* (multiple files, not used)  
* train/subject\_train.txt  
* train/X\_train.txt  
* train/y\_train.txt  
* train/Inertial Signals/\* (multiple files, not used)  

#### Data Dimensions ####
The original feature set includes 10,299 observations of 561 separate measurements, each associated with one of 30 subjects and one of 6 activities.


New Tidy Data Set
-----------------
#### Data Dimensions ####
The new tidy data set includes a subset of just 66 feature measurements from the original -- only the Standard Deviation, and the Mean Value measurements, as requested in the assignment specification. After reading the original data description, this was interpreted to mean any measurement that included the exact character string "mean()" or "std()" in the name. 

The final tidy data set includes the overall average for each of the 66 feature measurements grouped by    subject AND activity. This results in a table with 68 columns (subject + activity + 66 feature averages) and 180 rows (30 subjects X 6 activities).

Subjects are indicated by number, in the range 1 - 30. 

Activities are indicated by one of six character strings:  

* WALKING  
* WALKING\_UPSTAIRS  
* WALKING\_DOWNSTAIRS  
* SITTING  
* STANDING  
* LAYING  

#### Features ####
According to the information that came with the original data set, the feature measurements come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz and the names are prefixed in our tidy data set with the string **Time\_**. 

Accelerometer readings are indicated in the tidy data set name by **Acc** and gyroscope readings are indicated by **Gyro**. The 3-axial signals contain a suffix of either **-X**, **-Y** or **-Z** indicating which direction the measurement is for.

In the original data the acceleration signal was then separated into body and gravity acceleration signals, indicated in the tidy data set by **Body** and **Gravity** in the feature names. The body linear acceleration and angular velocity were also derived in time to obtain Jerk signals (indicated by **Jerk** in the feature name). The magnitude of these three-dimensional signals were calculated using the Euclidean norm (indicated by **Mag** in the feature name). 

Finally, again in the original data, a Fast Fourier Transform (FFT) was applied to some of the signals. In our tidy data set, these measurement names are preceded by **Freq\_** to indicate that the value is in the frequency domain.

The full resulting set of column names in the tidy data set is:

Subject  
ActivityName  
Time\_BodyAcc\_MeanValue-X  
Time\_BodyAcc\_MeanValue-Y  
Time\_BodyAcc\_MeanValue-Z  
Time\_BodyAcc\_StdDeviation-X  
Time\_BodyAcc\_StdDeviation-Y  
Time\_BodyAcc\_StdDeviation-Z  
Time\_GravityAcc\_MeanValue-X  
Time\_GravityAcc\_MeanValue-Y  
Time\_GravityAcc\_MeanValue-Z  
Time\_GravityAcc\_StdDeviation-X  
Time\_GravityAcc\_StdDeviation-Y  
Time\_GravityAcc\_StdDeviation-Z  
Time\_BodyAccJerk\_MeanValue-X  
Time\_BodyAccJerk\_MeanValue-Y  
Time\_BodyAccJerk\_MeanValue-Z  
Time\_BodyAccJerk\_StdDeviation-X  
Time\_BodyAccJerk\_StdDeviation-Y  
Time\_BodyAccJerk\_StdDeviation-Z  
Time\_BodyGyro\_MeanValue-X  
Time\_BodyGyro\_MeanValue-Y  
Time\_BodyGyro\_MeanValue-Z  
Time\_BodyGyro\_StdDeviation-X  
Time\_BodyGyro\_StdDeviation-Y  
Time\_BodyGyro\_StdDeviation-Z  
Time\_BodyGyroJerk\_MeanValue-X  
Time\_BodyGyroJerk\_MeanValue-Y  
Time\_BodyGyroJerk\_MeanValue-Z  
Time\_BodyGyroJerk\_StdDeviation-X  
Time\_BodyGyroJerk\_StdDeviation-Y  
Time\_BodyGyroJerk\_StdDeviation-Z  
Time\_BodyAccMag\_MeanValue  
Time\_BodyAccMag\_StdDeviation  
Time\_GravityAccMag\_MeanValue  
Time\_GravityAccMag\_StdDeviation  
Time\_BodyAccJerkMag\_MeanValue  
Time\_BodyAccJerkMag\_StdDeviation  
Time\_BodyGyroMag\_MeanValue  
Time\_BodyGyroMag\_StdDeviation  
Time\_BodyGyroJerkMag\_MeanValue  
Time\_BodyGyroJerkMag\_StdDeviation  
Freq\_BodyAcc\_MeanValue-X  
Freq\_BodyAcc\_MeanValue-Y  
Freq\_BodyAcc\_MeanValue-Z  
Freq\_BodyAcc\_StdDeviation-X  
Freq\_BodyAcc\_StdDeviation-Y  
Freq\_BodyAcc\_StdDeviation-Z  
Freq\_BodyAccJerk\_MeanValue-X  
Freq\_BodyAccJerk\_MeanValue-Y  
Freq\_BodyAccJerk\_MeanValue-Z  
Freq\_BodyAccJerk\_StdDeviation-X  
Freq\_BodyAccJerk\_StdDeviation-Y  
Freq\_BodyAccJerk\_StdDeviation-Z  
Freq\_BodyGyro\_MeanValue-X  
Freq\_BodyGyro\_MeanValue-Y  
Freq\_BodyGyro\_MeanValue-Z  
Freq\_BodyGyro\_StdDeviation-X  
Freq\_BodyGyro\_StdDeviation-Y  
Freq\_BodyGyro\_StdDeviation-Z  
Freq\_BodyAccMag\_MeanValue  
Freq\_BodyAccMag\_StdDeviation  
Freq\_BodyAccJerkMag\_MeanValue  
Freq\_BodyAccJerkMag\_StdDeviation  
Freq\_BodyGyroMag\_MeanValue  
Freq\_BodyGyroMag\_StdDeviation  
Freq\_BodyGyroJerkMag\_MeanValue  
Freq\_BodyGyroJerkMag\_StdDeviation  


