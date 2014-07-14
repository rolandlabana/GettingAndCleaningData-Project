Code Book for Coursera Getting and Cleaning Data - Course Project
========================================================

**Submitted by Roland Labana** July 2014

See the README file for this project for information on running the script
and a description of how it works.

This file decribes the data stored in the tiday-SensorData.txt file.

**NOTE:** Because the data labels are fairly long, I did not use
all lower case and instead used CamelCase as was suggested
by course discussion leaders here ->
https://class.coursera.org/getdata-005/forum/thread?thread_id=103  
I think this choice makes the labels easier to read.

All "illegal" R charsacters were removed in the labels to make them
easy to use in R functions (i.e."/, - ()")

All columns containing "mean" or "std" were subsetting out of the 
orignal data to include in the final Tidy data set.
This was done in the script by the GetColumns () function.
For reference, here are the columns that were included in the
final Tidy data set and the code that produced the set:

```{r}
dat <- read.csv("features.txt", sep = " ", header = FALSE)
r1 <- grep ("mean+", dat$"V2")
r2 <- grep ("std+", dat$"V2")
r3 <- c(r1, r2)
sort(r3)
[1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86 121 122 123 124 125 126 161 162 163 164 165 166
[31] 201 202 214 215 227 228 240 241 253 254 266 267 268 269 270 271 294 295 296 345 346 347 348 349 350 373 374 375 424 425
[61] 426 427 428 429 452 453 454 503 504 513 516 517 526 529 530 539 542 543 552
```

Here are the column labels and descriptions and how they were translated from the original file
column order and original names to the new column order and descriptive names in the Tiday data file:

New col index | Orig col index  | Orig label           | Descriptive label
------------- | -------------- | ----------           | -----------------
1             |1                | tBodyAcc-mean()-X  | TimeBodyAccelerometerMeanX
2             |2   | tBodyAcc-mean()-Y	| TimeBodyAccelerometerMeanY
3   |  3 |  tBodyAcc-mean()-Z	| TimeBodyAccelerometerMeanZ
4   |  4 |  tBodyAcc-std()-X	| TimeBodyAccelerometerStdDevX
5   |  5 |  tBodyAcc-std()-Y	| TimeBodyAccelerometerStdDevY
6 |    6  | tBodyAcc-std()-Z  | TimeBodyAccelerometerStdDevZ
7  |   41 | tGravityAcc-mean()-X |   TimeGravityAccelerometerMeanX
8   |  42 | tGravityAcc-mean()-Y	| TimeGravityAccelerometerMeanY
9   |  43 | tGravityAcc-mean()-Z	| TimeGravityAccelerometerMeanZ
10  |  44 | tGravityAcc-std()-X  | TimeGravityAccelerometerStdDevX
11  |  45  |tGravityAcc-std()-Y |  TimeGravityAccelerometerStdDevY
12  |  46 | tGravityAcc-std()-Z  | TimeGravityAccelerometerStdDevZ
13  |  81 | tBodyAccJerk-mean()-X |  TimeBodyAccelerometerJerkMeanX
14 | 82 | tBodyAccJerk-mean()-Y	| TimeBodyAccelerometerJerkMeanY
15|83 | tBodyAccJerk-mean()-Z	| TimeBodyAccelerometerJerkMeanZ
16|84 | tBodyAccJerk-std()-X	| TimeBodyAccelerometerJerkStdDevX
17|85 | tBodyAccJerk-std()-Y	| TimeBodyAccelerometerJerkStdDevY
18|86 | tBodyAccJerk-std()-Z  | TimeBodyAccelerometerJerkStdDevZ
19|121 |tBodyGyro-mean()-X  | TimeBodyGyroMeanX
20|122| tBodyGyro-mean()-Y	| TimeBodyGyroMeanY
21|123 |tBodyGyro-mean()-Z	| TimeBodyGyroMeanZ
22|124 |tBodyGyro-std()-X	 | TimeBodyGyroStdDevX
23|125 |tBodyGyro-std()-Y	| TimeBodyGyroStdDevY
24|126| tBodyGyro-std()-Z  | TimeBodyGyroStdDevZ
25|161 |tBodyGyroJerk-mean()-X  | TimeBodyGyroJerkMeanX
26|162 |tBodyGyroJerk-mean()-Y	| TimeBodyGyroJerkMeanY
27|163 |tBodyGyroJerk-mean()-Z	| TimeBodyGyroJerkMeanZ
28|164 |tBodyGyroJerk-std()-X	| TimeBodyGyroJerkStdDevX
29|165| tBodyGyroJerk-std()-Y	| TimeBodyGyroJerkStdDevY
30|166 |tBodyGyroJerk-std()-Z |  TimeBodyGyroJerkStdDevZ
31|201 |tBodyAccMag-mean()  | TimeBodyAccelerometerMagStdMean
32|202 |tBodyAccMag-std()  | TimeBodyAccelerometerMagStdMean
33|214| tGravityAccMag-mean()  |   TimeGravityAccelerometerMagMean
34|215| tGravityAccMag-std()  | TimeGravityAccelerometerMagStdDev
35|227 |tBodyAccJerkMag-mean()  |  TimeBodyAccelerometerJerkMagMean
36|228 |tBodyAccJerkMag-std()  | TimeBodyAccelerometerJerkMagStdDev
37|240 |tBodyGyroMag-mean()   | TimeBodyGryoMagMean
38|241 |tBodyGyroMag-std()  | TimeBodyGryoMagStedDev
39|253 |tBodyGyroJerkMag-mean()  | TimeBodyGyroJerkMagMean
40|254 |tBodyGyroJerkMag-std()  | TimeBodyGyroJerkStdDev
41|266 |fBodyAcc-mean()-X  | FreqBodyAccelerometerMeanX
42|267| fBodyAcc-mean()-Y	| FreqBodyAccelerometerMeanY
43|268 |fBodyAcc-mean()-Z	| FreqBodyAccelerometerMeanZ
44|269 |fBodyAcc-std()-X	| FreqBodyAccelerometerStdDevX
45|270 |fBodyAcc-std()-Y	| FreqBodyAccelerometerStdDevY
46|271 |fBodyAcc-std()-Z  | FreqBodyAccelerometerStdDevZ
47|294 |fBodyAcc-meanFreq()-X  | FreqBodyAccelerometerMeanFreqX
48|295 |fBodyAcc-meanFreq()-Y	| FreqBodyAccelerometerMeanFreqY
49|296 |fBodyAcc-meanFreq()-Z  | FreqBodyAccelerometerMeanFreqZ
50|345 |fBodyAccJerk-mean()-X  | FreqBodyAccelerometerJerkMeanX
51|346 |fBodyAccJerk-mean()-Y	| FreqBodyAccelerometerJerkMeanY
52|347 |fBodyAccJerk-mean()-Z	| FreqBodyAccelerometerJerkMeanZ
53|348 |fBodyAccJerk-std()-X	| FreqBodyAccelerometerJerkStdDevX
54|349 |fBodyAccJerk-std()-Y	| FreqBodyAccelerometerJerkStdDevY
55|350 |fBodyAccJerk-std()-Z  | FreqBodyAccelerometerJerkStdDevZ
56|373 |fBodyAccJerk-meanFreq()-X  | FreqBodyAccelerometerJerkMeanFreqX
57|374 |fBodyAccJerk-meanFreq()-Y	| FreqBodyAccelerometerJerkMeanFreqY
58|375 |fBodyAccJerk-meanFreq()-Z  | FreqBodyAccelerometerJerkMeanFreqZ
59|424 |fBodyGyro-mean()-X  | FreqBodyGyroMeanX
60|425 |fBodyGyro-mean()-Y	| FreqBodyGyroMeanY
61|426 |fBodyGyro-mean()-Z	| FreqBodyGyroMeanZ
62|427 |fBodyGyro-std()-X	| FreqBodyGyroStdDevX
63|428 |fBodyGyro-std()-Y	| FreqBodyGyroStdDevY
64|429| fBodyGyro-std()-Z  | FreqBodyGyroStdDevZ
65|452| fBodyGyro-meanFreq()-X  | FreqBodyGyroMeanFreqX
66|453| fBodyGyro-meanFreq()-Y	| FreqBodyGyroMeanFreqY
67|454 |fBodyGyro-meanFreq()-Z  | FreqBodyGyroMeanFreqZ
68|503 |fBodyAccMag-mean()  | FreqBodyAccelerometerMagMean
69|504 |fBodyAccMag-std()  | FreqBodyAccelerometerStdDev
70|513| fBodyAccMag-meanFreq()  | FreqBodyAccelerometerMagMeanFreq
71|516 |fBodyBodyAccJerkMag-mean() |    FreqBodyBodyAccelerometerJerkMagMean
72|517 |fBodyBodyAccJerkMag-std()  | FreqBodyBodyAccelerometerJerkMagStdDev
73|526 |fBodyBodyAccJerkMag-meanFreq()  | FreqBodyBodyAccelerometerJerkMagMeanFreq
74|529 |fBodyBodyGyroMag-mean()  | FreqBodyBodyGyroMagMean
75|530 |fBodyBodyGyroMag-std()  | FreqBodyBodyGyroMagStdDev
76|539 |fBodyBodyGyroMag-meanFreq()  | FreqBodyBodyGyroMagMeanFreq
77|542 |fBodyBodyGyroJerkMag-mean()  | FreqBodyBodyGyroJerkMagMean
78|543 |fBodyBodyGyroJerkMag-std()  | FreqBodyBodyGyroJerkMagStdDev
79|552 |fBodyBodyGyroJerkMag-meanFreq()  | FreqBodyBodyGyroJerkMagMeanFreq
```

Here is a description of hte data using the original notation. See above table to map the original notation to the descriptive notation that is included in the Tidy data file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

NOTE: The rest of the measurements in the original file are NOT used in the Tidy data set.  
Only the ones related to "mean" and "std" are included in the Tidy data set (as per assignment).