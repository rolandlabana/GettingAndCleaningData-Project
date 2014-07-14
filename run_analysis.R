
# Coursera: Getting and Cleaning Data
# © 2014 Roland Labana
# Course Project
# Reading sensor data and summarizing it to a tidy data file.
# Please see the README.md for details and the CodeBook.md
# for desciption of the data.

library(reshape2)
activitiesIDs <- c(1, 2, 3, 4, 5, 6)
activityNames <- c("Walking", "Walking-Upstairs", "Walking-Downstairs", "Sitting", "Standing", "Laying")
tidyColumnNames <- c("TimeBodyAccelerometerMeanX","TimeBodyAccelerometerMeanY","TimeBodyAccelerometerMeanZ","TimeBodyAccelerometerStdDevX","TimeBodyAccelerometerStdDevY","TimeBodyAccelerometerStdDevZ","TimeGravityAccelerometerMeanX","TimeGravityAccelerometerMeanY","TimeGravityAccelerometerMeanZ","TimeGravityAccelerometerStdDevX","TimeGravityAccelerometerStdDevY","TimeGravityAccelerometerStdDevZ","TimeBodyAccelerometerJerkMeanX", "TimeBodyAccelerometerJerkMeanY", "TimeBodyAccelerometerJerkMeanZ", "TimeBodyAccelerometerJerkStdDevX", "TimeBodyAccelerometerJerkStdDevY", "TimeBodyAccelerometerJerkStdDevZ", "TimeBodyGyroMeanX", "TimeBodyGyroMeanY", "TimeBodyGyroMeanZ", "TimeBodyGyroStdDevX", "TimeBodyGyroStdDevY", "TimeBodyGyroStdDevZ", "TimeBodyGyroJerkMeanX", "TimeBodyGyroJerkMeanY", "TimeBodyGyroJerkMeanZ", "TimeBodyGyroJerkStdDevX", "TimeBodyGyroJerkStdDevY", "TimeBodyGyroJerkStdDevZ", "TimeBodyAccelerometerMagStdMean", "TimeBodyAccelerometerMagStdMean", "TimeGravityAccelerometerMagMean", "TimeGravityAccelerometerMagStdDev", "TimeBodyAccelerometerJerkMagMean", "TimeBodyAccelerometerJerkMagStdDev", "TimeBodyGryoMagMean", "TimeBodyGryoMagStedDev", "TimeBodyGyroJerkMagMean", "TimeBodyGyroJerkStdDev", "FreqBodyAccelerometerMeanX", "FreqBodyAccelerometerMeanY", "FreqBodyAccelerometerMeanZ", "FreqBodyAccelerometerStdDevX", "FreqBodyAccelerometerStdDevY", "FreqBodyAccelerometerStdDevZ)", "FreqBodyAccelerometerMeanFreqX", "FreqBodyAccelerometerMeanFreqY", "FreqBodyAccelerometerMeanFreqZ", "FreqBodyAccelerometerJerkMeanX", "FreqBodyAccelerometerJerkMeanY", "FreqBodyAccelerometerJerkMeanZ", "FreqBodyAccelerometerJerkStdDevX)", "FreqBodyAccelerometerJerkStdDevY", "FreqBodyAccelerometerJerkStdDevZ", "FreqBodyAccelerometerJerkMeanFreqX", "FreqBodyAccelerometerJerkMeanFreqY", "FreqBodyAccelerometerJerkMeanFreqZ", "FreqBodyGyroMeanX", "FreqBodyGyroMeanY", "FreqBodyGyroMeanZ", "FreqBodyGyroStdDevX", "FreqBodyGyroStdDevY", "FreqBodyGyroStdDevZ", "FreqBodyGyroMeanFreqX", "FreqBodyGyroMeanFreqY", "FreqBodyGyroMeanFreqZ", "FreqBodyAccelerometerMagMean", "FreqBodyAccelerometerStdDev", "FreqBodyAccelerometerMagMeanFreq", "FreqBodyBodyAccelerometerJerkMagMean", "FreqBodyBodyAccelerometerJerkMagStdDev", "FreqBodyBodyAccelerometerJerkMagMeanFreq", "FreqBodyBodyGyroMagMean", "FreqBodyBodyGyroMagStdDev", "FreqBodyBodyGyroMagMeanFreq", "FreqBodyBodyGyroJerkMagMean", "FreqBodyBodyGyroJerkMagStdDev", "FreqBodyBodyGyroJerkMagMeanFreq")

# This funciton will read the features.txt file to get a list of all features in the
# data set. Then grep for all columns that are means or std
# these will be the only columns we want in the tidy data set
getColumns <- function() {
  dat <- read.csv("features.txt", sep = " ", header = FALSE)
  r1 <- grep ("mean+", dat$"V2")
  r2 <- grep ("std+", dat$"V2")
  r3 <- c(r1, r2)
  sort(r3)
  return(r3)  # return the list of columns indices we want for our tidy data set
}


# This function reads in either the training data set or the test data set
# and all three files associated with it (Sensor Data values, Subj ID, Activites)
# and combines them into one table which is returned.
readData <- function(dir, name) {

  #set file names and path for either the test or the training files to be read
  theDir <- file.path(dir, name)
  valuesFName <- file.path(theDir, paste("X_", name, ".txt", sep = ""))
  activitiesFName <- file.path(theDir, paste("Y_", name, ".txt", sep = ""))
  subjectsFName <- file.path(theDir,   paste("subject_", name, ".txt", sep = ""))

  # Read the values table.
  theCols <- getColumns() 
  theValues <- read.table(valuesFName)[theCols]
  names(theValues) <- tidyColumnNames
  theData <- theValues

  # Read the activities list.
  activities <- read.table(activitiesFName)
  names(activities) <- c("activity")
  activities$activity <- factor(activities$activity, levels = activitiesIDs, labels = activityNames)
  theData <- cbind(theData, activity = activities$activity)

  # Read the subjects list.
  subjects <- read.table(subjectsFName)
  names(subjects) <- c("subject")
  theData <- cbind(theData, subject = subjects$subject)

  # Return the merged data
  return(theData)
}

showIntroMsg <- function () {
  
  print("Coursera: Getting and Cleaning Data")
  print("Course project by Roland Labana")
  print("Easiest way to run script is to make sure the 'run_analysis.R' script is in the 'UCI HAR Datset.")
  print("Also make sure that the working directory is set to the same.")
  
  print("Reading the data from training and test sets and combining into one table...")
  print("     Data is being read from the files containing Subject IDs, Activity and the Sensor Values")
  print("     and being combined into one table.")
  print("     Then the averages for each Subject are summarized by Activity.")
  print("     This take a little while, please wait...")
  
}

# This is the main control function to process the data files and write the new TidySensorData.txt file
main <- function() {

  showIntroMsg()   # print some intro information about running the script
  
  # Read both the training and test data sets and
  # then join them into one table
  dir <- "."  # assume script in one dir up from test and train data
  testData <- readData(dir, "test")
  trainingData <- readData(dir, "train")
  mergedData <- rbind(testData, trainingData)  
 
  # Now we have both training and test data sets combined and row and columns labeled
  # Now create the tidy data set with only the averages
  print("Tidying the data...")
  dataLong <- melt(mergedData, id = c("subject", "activity"))
  dataWide <- dcast(dataLong, subject + activity ~ variable, mean)

  # Save the tiday data file
  print("Write tidy file...TidySensorData.txt")
  tidyFilename <- file.path(dir, "TidySensorData.txt")
  write.table(dataWide, tidyFilename, row.names = FALSE, quote = FALSE)
}


# call the main function
main()