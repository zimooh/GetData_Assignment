
run_analysis <- function  () {

  library(dplyr)
  
  # start the timer to record total time of run
  ptm <- proc.time()
  
  ## --------------------------
  ##  subjects file processing
  ## --------------------------
  
  # Read contents of subject file into a dataset called dsSubject
  # by reading and then combining the test and train results together 
  # the merged file contains the IDs of the subjects who volunteered 
  # for the experiment ...
  message(".. processing 'Subject' file")
  filetest_Subject="subject_test.txt"
  filetrain_Subject="subject_train.txt"
  test_Subject<- read.table(filetest_Subject,header=FALSE)
  train_Subject<- read.table(filetrain_Subject,header=FALSE)
  dsSubject<-rbind(train_Subject,test_Subject)    # bind the training and test data to one file     
  rm(test_Subject) ; rm(train_Subject)            # remove unused vars
  
  ## add a new column "obsID" to the subject data set by using the row number
  ## to serve as a unique identifier for each observation  
  obsID<- c(1:as.integer(count(dsSubject)))
  dsSubject<-mutate(dsSubject,obsID)     
  names(dsSubject)[1]<- "SubjectID"              # rename the first column to reflect a meaningful name 
  
  ## -----------------------------
  ##  Activitities file processing
  ## -----------------------------
  
  ## apply the same procedure for the Activity file which contains the activities done by the subjects
  message(".. processing 'Activity' file")
  filetest_Activity="y_test.txt"
  filetrain_Activity="y_train.txt"   
  test_Activity<- read.table(filetest_Activity,header=FALSE)
  train_Activity<- read.table(filetrain_Activity,header=FALSE)
  dsActivity<-rbind(train_Activity,test_Activity)
  rm(test_Activity) ; rm(train_Activity) 
  obsID<- c(1:as.integer(count(dsActivity)))
  dsActivity<-mutate(dsActivity,obsID)
  names(dsActivity)[1]<- "ActivityID"
  #rename activity values according to the criteria given in the "activity_label.txt" file 
  dsActivity$ActivityID[dsActivity$ActivityID==1]<-"WALKING"
  dsActivity$ActivityID[dsActivity$ActivityID==2]<-"WALKING_UPSTAIRS"
  dsActivity$ActivityID[dsActivity$ActivityID==3]<-"WALKING_DOWNSTAIRS"
  dsActivity$ActivityID[dsActivity$ActivityID==4]<-"SITTING"
  dsActivity$ActivityID[dsActivity$ActivityID==5]<-"STANDING"
  dsActivity$ActivityID[dsActivity$ActivityID==6]<-"LAYING"
  
  ## -----------------------------
  ##  Measurments file processing
  ## -----------------------------
  
  
  # apply the same procedure of binding the test and train files which contain
  # measurment of the body movements
  message(".. processing 'Measurement' file")
  filetest_Measure="X_test.txt"
  filetrain_Measure="X_train.txt"
  test_Measure<- read.table(filetest_Measure,header=FALSE)
  train_Measure<- read.table(filetrain_Measure,header=FALSE)
  dsMeasure<-rbind(train_Measure,test_Measure)
  rm(test_Measure) ; rm(train_Measure)   
  
  # read the features file that contains the body measurment variables names 
  filefeatures="features.txt"
  features<- read.table(filefeatures,header=FALSE) 
  
  # to give the "dsMeasure" data set meaningful column names,  
  # use the variable names of the features data set   
  # then use the make function to change the column names into unique values   
  colnames(dsMeasure) <- as.character(features[,2])
  names(dsMeasure)<-make.names(names(dsMeasure),unique=TRUE)
  rm(features)                
    
  # select all variables that ends with a "mean" or  "std" relying on
  # the fact that all those variables were originally followed by a "()" which
  # was converted in the renaming function previously used into ".." 
  dsMeasure<- select(dsMeasure,contains("mean.."),contains("std.."))
  # excludes an unwanted observation that was selected by the previous selection
  dsMeasure<- select(dsMeasure,-starts_with("angle"))  
  
  # add a new column representing a unique observation ID 
  obsID<- c(1:as.integer(count(dsMeasure)))
  dsMeasure<-mutate(dsMeasure,obsID)
 
  ## ----------------------
  ## Creating tidy data set
  ## ----------------------
  
  # merge the 3 data sets (two at a time) into a new set called combined 
  dscombined<-merge(dsSubject,dsActivity,by.x="obsID")
  dscombined<-merge(dscombined,dsMeasure,by.x="obsID")
  
  # group the dscombined dataset for each SubjectID (30 subject) 
  # and for each ActivityID (60 activity) 
  # then applying the "mean" function on each of the measurments of the resulting 180 rows
  # to get the final data set
  # The observation ID - which was previously added - has been excluded from the final data set
  tidyset <-  dscombined %>%  
              group_by(SubjectID,ActivityID) %>%
              summarise_each(funs(mean),(-obsID))
  
  # write the tidy data set into a file called "tidy_data.txt"
  message(".. writing 'tidy data' file")
  fileTidyData="tidy_data.txt"
  if (file.exists(fileTidyData)) {
     file.remove(fileTidyData)
  }
  write.table(tidyset,file=fileTidyData,row.names=FALSE)
  
  # Stop the clock
  elapsedtime<-proc.time() - ptm
  message(".. Processing time " , round(as.numeric(elapsedtime[3]),digits=2) , " sec")
}

