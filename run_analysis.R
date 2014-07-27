library(plyr)

## Reading data from the datasets provided in the UCI datastore.
## please edit the directory location as per your settings ..

xtraindata <- read.table("F:/coursera/Getting And Cleaning/week4/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")
xtestdata <- read.table("F:/coursera/Getting And Cleaning/week4/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")

## Name of the features 
featuredata <- read.table("F:/coursera/Getting And Cleaning Data/week4/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt",header=FALSE,sep="")

## Adding the data from test and training data sets into one dataset "joindata"..
 joindata <- rbind(xtraindata,xtestdata)



##Allocating "joindata" to "jd" for further operations

jd <- joindata

colnum <- ncol(jd)

##This loop activity replaces the column names with new names .
##This portion of code may not run properly, but this is the approach that has been used 
## so it is being included in the source code for the submission.
for(i in 1:colnum){
  if (grep("mean()",featuredata$V2[i])>0){
    featuredata$V2[i]<- gsub("t","",featuredata$V2[i])
    featuredata$V2[i]<- gsub("-","",featuredata$V2[i])
  }
  else if("std()",featuredata$V2[i])>0){
    featuredata$V2[i]<- gsub("t","",featuredata$V2[i])
    featuredata$V2[i]<- gsub("-","",featuredata$V2[i])
  }
  else
  {
    print("Not a mean or standard deviation")
  }
}


## Assigning column names to the "jd" data.



for (i in 1:colnum){
  colnames(joindata[i])<- featuredata$V2[i]
}

##This part of code is to change the dataset composition based on the column names 
## of the mean and standard deviation .
 for(i in 1:colnum){
    if (grep("mean",colnames(joindata[i]))){
        tidydata<-joindata[i]
    }
    else if (grep("std",colnames(joindata[i]))){
      tidydata<- joindata[i]
    }
    else {
      print("Not for tidy data")
    }
 }



