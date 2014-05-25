## Getting and Cleaning Data - Course Project - run_analysis

## 0. Check to verify that the necessary packages plyr and rshape2 have been installed
#### Package 1: plyr
if (require("plyr")) {
    print("plyr is correctly loaded")
    } else {
        print("Please wait...trying to install plyr")
        install.packages("plyr")
        if (require(plyr)) {
            print("plyr is now correctly loaded")
            } else {
                stop("Sorry...plyr cannot be installed")
    }
}

#### Package 2: reshape2
if (require("reshape2")) {
    print("reshape2 is correctly loaded")
} else {
    print("Please wait...trying to install reshape2")
    install.packages("reshape2")
    if (require(reshape2)) {
        print("reshape2 is now correctly loaded")
    } else {
        stop("Sorry...reshape2 cannot be installed")
    }
}

## 1. Read all relevant data files necessary into data frames used to construct the tidy data set
#### Read the file containing activity labels for each action observed into a data frame
activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

#### Read the file containing the features, variables that have been measured into a data frame
features <- read.table("features.txt", stringsAsFactors=FALSE)

setwd("test")

#### Read the subject test data from the Samsung Galaxy S II smartphone into data frames
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

prevdir <- getwd()                 
prevdir <-gsub("test","",prevdir)   
setwd(prevdir)

setwd("train")

#### Read the subject train data from the Samsung Galaxy S II smartphone into data frames
X_test <- read.table("X_test.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

prevdir <- getwd()                 
prevdir <-gsub("train","",prevdir)   
setwd(prevdir)

## 2. Use rbind() to combine the test and training data into a single data sets for X, y, and subject
#### Bind the test and train data by rows into single data frames
tidy_X <- rbind(X_test, X_train)
tidy_y <- rbind(y_test, y_train)
tidy_subject <- rbind (subject_test, subject_train)

## 3. Set meaning full names for the "subject"" and "activity" variables
#### Rename the columns of the data sets for use later in the script
names(activity_labels) <- c("activityIndex", "activity")
names(tidy_y) <- "activityIndex"
names(tidy_subject) <- "subject"

## 4. Use grep() to isolate the variable names in features that are desired by this project
tidy_features <- data.frame(index = integer(0), featurename = character(0))

#### Match "-mean\\(" and "-std\\(" to find the variables that observed those functions 
interested_features <- grep("-std", features[,2])
interested_features <- sort(append(interested_features, grep("-mean\\(", features[,2])))

#### Build a data frame containing an index and names of the columns to be included in the tiny data set
for (counter in 1:length(interested_features)) {
    tidy_features <- rbind(tidy_features, features[interested_features[counter],])
    }

## 5. Use gsub() to transform the isolated variable names in features into more descriptive ones
for (counter in 1:nrow(tidy_features)) {
    if (substr(tidy_features[counter,2], 1, 1) =='t') 
        tidy_features[counter,2] <- sub("t", "time", tidy_features[counter,2])
    else tidy_features[counter,2] <- sub("f", "fourier", tidy_features[counter,2])
}


tidy_features[,2] <- gsub("-", "", tidy_features[,2])
tidy_features[,2] <- gsub("\\(\\)", "", tidy_features[,2])
tidy_features[,2] <- gsub("std", "StandardDeviation", tidy_features[,2])
tidy_features[,2] <- gsub("mean", "Mean", tidy_features[,2])
tidy_features[,2] <- gsub("Acc", "Accelerometer", tidy_features[,2])
tidy_features[,2] <- gsub("Gyro", "Gyroscope", tidy_features[,2])
tidy_features[,2] <- gsub("Mag", "Magnitude", tidy_features[,2])


## 6. Use the isolated variables and their names from features to subset desired variables from the single X data set
tidy_X <- tidy_X[,tidy_features[,1]]

#### Rename the columns of the tidy data set being constructed with the clean column names 
names(tidy_X) <- tidy_features[,2]

## 7. Use join() to match the activity labels to the single y data set
tidy_activity <- join(tidy_y, activity_labels, type = "inner")

## 8. Use cbind() to clip the singel y data set and single subject data set to the subsetted X data set
tidy_data <- cbind(tidy_subject, "activity" = tidy_activity[,2], tidy_X)

## 9. Use melt() to melt the desired variables on "subject" and "activity"
tidy_melt <- melt(tidy_data, id=c("activity", "subject"), value.name = "subjectActivityValue")

## 10. Use dcast() to cast the mean of desired variables aggregated for "subject" and "activity" into a TIDY DATA SET
tidy_mean <- dcast(tidy_melt, subject + activity ~ variable,fun.aggregate=mean)
