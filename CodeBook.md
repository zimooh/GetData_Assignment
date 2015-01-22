
The repo includes the following files:
--------------------------------------
[README.md] A general description of the repo , the methodology used in deriving the final data set , and the instruction for running the R script.

[CodeBook.md] This file which covers the description of the files, data and the variables used in the final data set.

[run_analysis.R]  The script file written in R3.1.2 The source was commented as much as possible to describe the steps used to read and process data  

Input files required for the script to run 
------------------------------------------
[features.txt]     list of 561 variable names used for body measurements

The following files contain the observations for each experiment :

[subject_test.txt] The ID of persons who was chosen to perform the testing data set. One record for each experiment

[subject_train.txt]  The ID of persons of the training set

[X_test.txt] The 561 measurement for each experiment of the test data set

[X_train.txt] The 561 measurement for each experiment of the training data set

[y_test.txt] The ID of the activity performed for the testing set

[y_train.txt] The ID of the activity performed for the training set

Output files (Tidy data set)  
---------------------------
[tidy_data.txt]  This file contains the average of each measurement for each subject who performed the experiment and for each avtivity performed by the subject	
		

Tidy Data set variable names
----------------------------
A header row for the variable names is provided at the first line 
of the tidy data set file.

The variable names are as follows :

1  SubjectID  (integer )  numbers from 1 .. 30 representing subject IDs who performed the experiment

2  ActivityID (factor with 6 levels)  "WALKING" , "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" and "LAYING" representing the 6 activities performed by the subjects

The following variables (from 3 to 68 ) are numeric data types which 
was selected from the original data set which in turn came from the 
accelerometer and gyroscope  3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
These time domain signals (prefix 't' to denote time) were captured at 
a constant rate of 50 Hz. . Then they were filtered using a median 
filter and a 3rd order low pass Butterworth filter with a corner 
frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were 
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag,tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these 
signals producing fBodyAcc-XYZ,fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag,fBodyGyroMag, fBodyGyroJerkMag.
(Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector 
for each pattern: '-XYZ' is used to denote 3-axial signals in the 
X, Y and Z directions.

   3    tBodyAcc.mean...X

   4    tBodyAcc.mean...Y

   5    tBodyAcc.mean…Z

   6    tGravityAcc.mean...X

   7    tGravityAcc.mean...Y

   8    tGravityAcc.mean...Z

   9    tBodyAccJerk.mean...X

   10   tBodyAccJerk.mean...Y

   11   tBodyAccJerk.mean...Z

   12   tBodyGyro.mean...X

   13   tBodyGyro.mean...Y

   14   tBodyGyro.mean...Z

   15   tBodyGyroJerk.mean...X

   16   tBodyGyroJerk.mean...Y

   17   tBodyGyroJerk.mean...Z

   18   tBodyAccMag.mean..

   19   tGravityAccMag.mean..

   20   tBodyAccJerkMag.mean..

   21   tBodyGyroMag.mean..

   22   tBodyGyroJerkMag.mean..

   23   fBodyAcc.mean...X

   24   fBodyAcc.mean...Y

   25   fBodyAcc.mean...Z

   26   fBodyAccJerk.mean...X

   27   fBodyAccJerk.mean...Y

   28   fBodyAccJerk.mean...Z

   29   fBodyGyro.mean...X

   30   fBodyGyro.mean...Y

   31   fBodyGyro.mean...Z

   32   fBodyAccMag.mean..

   33   fBodyBodyAccJerkMag.mean..

   34   fBodyBodyGyroMag.mean..

   35   fBodyBodyGyroJerkMag.mean..

   36   tBodyAcc.std...X

   37   tBodyAcc.std...Y

   38   tBodyAcc.std...Z

   39   tGravityAcc.std...X

   40   tGravityAcc.std...Y

   41   tGravityAcc.std...Z

   42   tBodyAccJerk.std...X

   43   tBodyAccJerk.std...Y

   44   tBodyAccJerk.std...Z

   45   tBodyGyro.std...X

   46   tBodyGyro.std...Y

   47   tBodyGyro.std...Z

   48   tBodyGyroJerk.std...X

   49   tBodyGyroJerk.std...Y

   50   tBodyGyroJerk.std...Z

   51   tBodyAccMag.std..

   52   tGravityAccMag.std..

   53   tBodyAccJerkMag.std..

   54   tBodyGyroMag.std..

   55   tBodyGyroJerkMag.std..

   56   fBodyAcc.std...X

   57   fBodyAcc.std...Y

   58   fBodyAcc.std...Z

   59   fBodyAccJerk.std...X

   60   fBodyAccJerk.std...Y

   61   fBodyAccJerk.std...Z

   62   fBodyGyro.std...X

   63   fBodyGyro.std...Y

   64   fBodyGyro.std...Z

   65   fBodyAccMag.std..

   66   fBodyBodyAccJerkMag.std..

   67   fBodyBodyGyroMag.std..

   68   fBodyBodyGyroJerkMag.std..