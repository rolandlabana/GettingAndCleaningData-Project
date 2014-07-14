README for Coursera Getting and Cleaning Data - Course Project
========================================================

**Submitted by Roland Labana** July 2014  
  
**NOTE:** To run the 'run_Analysis.R' script, the script should be located anywhere and the working
directory should be set to a folder containing the 'test' and 'train' data as well as the file 'features.txt.'
If there is any problem, try just placing the script in the 'UCI HAR Datset' folder and set your working directory
to this.  All the files are already in the folder and in the expected structure.

The assignment for this project is to create one R script called run_analysis.R that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The original data set is taken from here:
- Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data are split into a Training set and a Test set.
The relevant files are:

- Training/subject_test.txt  : The set of subject IDs contained in the training set (random select from the 30 total subjects)

- Training/X_test.txt  : The Sensor data itself

- Training/Y_test.txt  : The Activity for the row entry in X_test.txt (1-6)

- Test/subject_test.txt  : The set of subject IDs contained in the training set (random select from the 30 total subjects)

- Test/X_test.txt  : The Sensor data itself

- Test/Y_test.txt  : The Activity for the row entry in X_test.txt (1-6)

In addition, the following files contain information that the script uses to label columns and determine which columns should be incliuded in the final Tiday Data file (any column that has "mean" or "std" in the title), and to define the activity names.

- features.txt : the column names for all of the sensor data captured in the X_test.txt or Y_test.txt files.
- activity_labels.txt : a mapping of 1-6 to the activity name (i.e. Standing)

**NOTE:** Please refer to the CodeBook.md file for details on the data meanings and arrangement.

Here is how the scripts operates when it is sourced:
- calls the function main()
- prints information about setting the working directory and where the script and data should be stored
- calls the function readData to read the Test data
  * calls the function GetColumns() which reads the file features.txt and greps on the features that contains "mean" or "std".  A vector with the column numbers to read is returned. 
  * The data is then read from X_test.txt and Y_test.txt to a table.
  * The tidy column headings are applied to the table
  * The activities are read in and applied as factors so the activity titles can be mapped to the activty numeric coding in the file.
  
- calls the function readData to read the Training data
  * calls the function GetColumns() which reads the file features.txt and greps on the features that contains "mean" or "std".  A vector with the column numbers to read is returned. 
  * The data is then read from X_training.txt and Y_training.txt to a table.
  * The tidy column headings are applied to the table
  * The activities are read in and applied as factors so the activity titles can be mapped to the activty numeric coding in the file.
- merges the two data sets by rows (rbind) to create one clean data set
- performs a melt and dcast on the table to summarize the means for all runs for a Subject ID
- writes the resulting data set to the file TidySensorData.txt

Sample running of the script:

```{r}
> source("run_analysis.R")
[1] "Coursera: Getting and Cleaning Data"
[1] "Course project by Roland Labana"
[1] "Make sure the 'run_analysis.R' script is in the 'UCI HAR Datset' folder to run."
[1] "Also make sure that the working directory is set to the same."
[1] "Reading the data from training and test sets and combining into one table..."
[1] "     Data is being read from the files containing Subject IDs, Activity and the Sensor Values"
[1] "     and being combined into one table."
[1] "     Then the averages for each Subject are summarized by Activity."
[1] "     This take a little while, please wait..."
[1] "Tidying the data..."
[1] "Write tidy file...TidySensorData.txt"
```
