Introduction
------------

The data and code in this repo is a result of a project assignment as per the requirements of the course "Getting and Cleaning Data" provided graciously by Stanford University under coursera.org
The original data was a result of experiments carried out on 30 volunteers performing 6 activities (walking,walking upstairs, walking downstairs, sitting, standing and lying) while wearing a samsung mobile on the waist. 
The sensor signals from the internal accelorometer and gyroscope were recorded and processed to generate 561 different measurements. 
The collected data was partitioned into 2 separate datasets (a test set and a training set)   

The original data and a complete description can be downloaded and viewed at the following link :
 <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones/>

It was required to process the raw data and produce a tidy data set which contains the average of each variable for each activity and each subject.

Methodology
-----------

According to the required assignment , I performed the following 
activities on the original set of data using a script written in 
R language "run_analysis.R"

>1- Merged the training and test data for each of the 3 files constituting the experiment( subjects, activities and measurements)  

>2- Extracted the measurement of the variables representing the mean and standard deviation ( with a total of 66 measurement) from a set of the original 561 measurements
**Note:** I interpreted the mean and standard deviation as all the variables that ended with a "mean()" or "std()" and in some cases with an additional sufffix  "-x or -y or -z" . I treated variables such as "fBodyAcc-meanFreq()-X"  -order 294- as an original variable and not as a mean of a measurement since there was no standard deviation associated with it. 

>3- Using the "features.txt" file, I associated every reading to one of the variables to give them a meaningful name  (eg. 1st column representing first measurement was mapped to tBodyAcc-mean()-X .. etc) 
I also used the "activity_labels.txt" to rename activity Id's to give them meaningful names (eg. Activity #1 was changed to "WALKING" .. etc)

>4- I also gave each dataset a meaningful name as described in detail in the script

>5- Finally, I created a new tidy data set grouped by the following:
a- each of the persons who volunteered for the experiment (30 persons)
b- each activity performed by each person (6 activities) .
For each one of these 180 case data set (30x6) , the mean of each of the measurements was provided

>6- The new tidy data set was written to a file "tidy_data.txt" that will reside in the same folder in case further processing is needed.
Note that the new tidy data set contains header rows , so in case you need to read the data set, it is required to use "header=TRUE" in read.table command

A code book "CodeBook.md" contains a complete list of the variables, the input and output files and the script used to perform the above. 

Instructions to run the script "run_analysis.R"
-----------------------------------------------

**Note: **  you should have the R language and the library package "dplyr" installed on your computer to run the script

>1- Download the script file "run_analysis.R" from the github repo from the following link "https://github.com/zimooh/GetData_Assignment"

>2- Download the original data files from the following link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and place the required input files - as described in detail in the "CodeBook.md" - into the same folder where you downloaded the script file on your computer

>3- Start R and at the command prompt set the working directory to be at the location of the downloaded files by using the R command setwd(dir), 
for example :  setwd("d:/working/R/Repos/CourseraProject")

>4- Load the script file "run_analysis.R" by using the R command source("run_analysis.R")

>5- run the script from the R command line run_analysis()
Note: the run could take some time depending on your computer since it involves reading ~100Mb data files

>6- The tidy data set will be written to a file "tidy_data.txt that will reside in the same folder. Every run of the script will delete the older version of the "tidy_data.txt" file 

Acknowledgments
---------------

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
    Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
    using a Multiclass Hardware-Friendly Support Vector Machine. 
    International Workshop of Ambient Assisted Living (IWAAL 2012). 
    Vitoria-Gasteiz, Spain. Dec 2012