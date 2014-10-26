Coursera class 'Getting and Cleaning Data' / Final Course Project - README
===========================================================================
Author: Lisa Salmon  //  Date: October 26, 2014

The purpose of the final course project for Coursera class "Getting and Cleaning Data" (https://class.coursera.org/getdata-008/) is to take a given set of multiple data files, and create a single tidy data set that is ready for further analysis. 

The final submission includes the following:

* __run_analysis.R__  
    The actual R script used to convert the original set of multiple data files into a single tidy data set. Available from GitHub: https://github.com/elslammo/GettingAndCleaningData/blob/master/run_analysis.R 

* __CodeBook.md__  
    Describes the original data set, the new tidy data set, and the process followed in **run_analysis.R** to create the tidy data from the original data. Available from GitHub: https://github.com/elslammo/GettingAndCleaningData/blob/master/CodeBook.md

* __README.md__  
    Describes the project and the submission files. Available from GitHub: https://github.com/elslammo/GettingAndCleaningData/blob/master/README.md

* __tidy\_data\_set.txt__  
    The final tidy data set created from running the **run_analysis.R** script. Available from the Coursera course Peer Assessment screen.
    

Notes on the Files
-------------------
* Before running the **run_analysis.R** script, the original data files must be downloaded and extracted. Full details are included in the **CodeBook.md** file.

* The submitted tidy data set can be most easily viewed by first downloading the **tidy\_data\_set.txt** file  and running the following command in R:

    data <- read.table(<path-to-file>, header = TRUE)
    View(data)

<path-to-file> must be replaced by the full path to the file on your local computer.
