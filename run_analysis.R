setwd("C:/Users/nzhong/Documents/rstudio/CourseraDataScienceTrack/getCleanDataProject/UCI HAR Dataset/")
library(data.table)
## read x, y and subject data froming testing directory
y_test<-read.table("./test/y_test.txt")
x_test<-read.table("./test/X_test.txt")
subject_test<-read.table("./test/subject_test.txt")
## column bind in the sequence of subject,feature vector, activity label
test_ds<-cbind(subject_test,x_test,y_test)

## do the same for training directory
y_train<-read.table("./train/y_train.txt")
x_train<-read.table("./train/X_train.txt")
subject_train<-read.table("./train/subject_train.txt")
train_ds<-cbind(subject_train,x_train,y_train)

#### Merges the training and the test sets to create one data set 
ds<-rbind(train_ds,test_ds)

## read descriptive feature names and activity labels
features<-read.table("features.txt",colClasses=c("integer","character"))
activity<-read.table("activity_labels.txt",colClasses=c("integer","character"))
setnames(activity,c("activity_label","activity_description"))

#### Appropriately labels the data set with descriptive variable names
setnames(ds,c("subject",features$V2,"activity_label"))


#### Extracts only the measurements on the mean and standard deviation for each measurement
temp<-do.call(rbind,strsplit(features$V2,'[-(]'))[,2]
indMeanStd<-(temp=="mean" | temp == "std")
sel_ds<-ds[,c(TRUE,indMeanStd,TRUE)]

#### Uses descriptive activity names to name the activities in the data set
sel_ds_desc<-merge(sel_ds,activity,by="activity_label",all.x=TRUE)

#### creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_ds<-aggregate(sel_ds_desc[,3:(length(sel_ds_desc)-1)],by=list(sel_ds_desc$activity_description,sel_ds_desc$subject),FUN = mean)
new_names<-c("activity","subject",paste("avg",names(tidy_ds)[3:length(tidy_ds)],sep="-"))
setnames(tidy_ds,new_names)

## output the tidy dataset as txt file
write.table(tidy_ds,file = "tidy_dataSet.txt",row.names = FALSE)

