setwd("C:/Users/nzhong/Documents/rstudio/CourseraDataScienceTrack/getCleanDataProject/")

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./HumanActivityRecognitionUsingSmartPhone.zip")
unzip("./HumanActivityRecognitionUsingSmartPhone.zip")
