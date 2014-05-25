#Getting and Cleaning Data - Course Project - README
========================================================
##The purpose of this project...
is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can 
be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script 
for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work 
that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your 
scripts. This repo explains how all of the scripts work and how they are connected.  

##One of the most exciting areas in all of data science right now is wearable computing...
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##You should create... 
one R script called run_analysis.R that does the following. 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Assumptions and Prequisites...
The run_analysis.R script makes the following operational assumptions
    1. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded to
    the local machine.
    2. Said file has been upacked without manipulation to the default structure
    3. "UCI HAR Dataset" is the working directory at the time of script execution
    4. plyr package has been installed and loaded (script will check for proper installation)
    5. reshape 2 package has been installed and loaded (script will check for proper installation)

The unpacked directory "UCI HAR Dataset" should contain the following:
    activity_labels.txt*    -   indexed labels for the activities observed while wearing the; 6 rows, 2 vars
    features.txt*           -   indexed variable names for the features of the Samsung Galaxy S II; 561 rows; 2 vars
    features_info.txt       -   the information describing the variables observed 
    README.txt              -   the information describing the Activity Recognition project overall         
    test                    -   a subdirectory containing the test data
    train                   -   a subdirectory containing the training data

The subdirectory "test" should contain
    subject_test.txt*       -   the observed subjects corresponding to the test data set; 2947 rows; 1 var
    X_test.txt*             -   test data measured for each feature of the Samsung Galaxy S II; 2947 rows; 561 vars
    y_test.txt*             -   the activity index for test data set matching the activity labels; 2947 rows; 1 var
    Inertial Signals        -   NOT USED

The subdirectory "train" should contain
    subject_train.txt*      -   the observed subjects corresponding to the training data set; 2947 rows; 1 var
    X_train.txt*            -   training data measured for each feature of the Samsung Galaxy S II; 2947 rows; 561 vars
    y_train.txt*            -   the activity index for traning data setmatching the activity labels; 2947 rows; 1 var
    Inertial Signals        -   NOT USED

    * indicates a file used in the script analysis

The R script run_analysis.R can be saved in the "UCI HAR Dataset" directory.  When it is executed with "UCI HAR Dataset" set as the working directory, it will perform the following:

    0.  Checks to verify that the necessary packages plyr and rshape2 have been installed
    1.  Reads all relevant data files necessary into data frames used to construct the tidy data set
    2.  Uses rbind() to combine the test and training data into a single data sets for X, y, and subject
    3.  Sets meaning full names for the "subject"" and "activity" variables
    4.  Uses grep() to isolate the variable names in features that are desired by this project
    5.  Uses gsub() to transform the isolated variable names in features into more descriptive ones
    6.  Uses the isolated variables and their names from features to subset desired variables from the single X data set
    7.  Uses join() to match the activity labels to the single y data set
    8.  Uses cbind() to clip the singel y data set and single subject data set to the subsetted X data set
    9.  Uses melt() to melt the desired variables on "subject" and "activity"
    10. Uses dcast() to cast the mean of desired variables aggregated for "subject" and "activity" into a TIDY DATA SET