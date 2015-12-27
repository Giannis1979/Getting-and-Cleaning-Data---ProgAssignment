#setwd("C:/Users/John/Documents/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/")

# read field names
activity_lables<-read.table("activity_labels.txt") #activity lables (1 WALKING, 2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING, 5 STANDING,6 LAYING)
features<-read.table("features.txt") # 561 features to be used as colnames for x_train and x_test 

# using gsub to rename features fieldnames
tmp<-gsub("tBody","TimeBody",features[,2])
tmp<-gsub("tGravity","TimeGravity",tmp)
tmp<-gsub("fBody","FrequencyBody",tmp)
tmp<-gsub("Acc","Acceleration",tmp)
feature_names<-as.vector(tmp)


# read train data
y_train<-read.table("train/y_train.txt")
x_train<-read.table("train/x_train.txt")
subject_train<-read.table("train/subject_train.txt")

# read test data
y_test<-read.table("test/y_test.txt")
x_test<-read.table("test/x_test.txt")
subject_test<-read.table("test/subject_test.txt")

# merge all test and train data 
test<-cbind(y_test,subject_test,as.data.frame(x_test))#combines activity number, subject number with the 561 vectors
train<-cbind(y_train,subject_train,as.data.frame(x_train))#combines activity number, subject number with the 561 vectors
test_and_train_data<-rbind(test,train) # combine train and test data

# merge activity lables 
df<-merge(as.data.frame(activity_lables),as.data.frame(test_and_train_data),by.x=1,by.y=1)
colnames(df)<-c("activity_Number","activity_lable","subject",feature_names)

#find column numbers where filed names are mean and standard deviation
m<-grep("mean",features[1:561,2])+3  # find column numbers of mean
s<-grep("std",features[1:561,2])+3  # find column numbers of standard deviation
mean_and_std<-c(m,s)  # combine column numbers of mean and standard deviation

data<-df[c(2,3,mean_and_std)]  # filter dataset for only activity lables,subject and means and standard deviations

# use dplyr library to group and summarize data
library(dplyr)
group_by_subject<-group_by(data,activity_lable,subject)
tidy_average_by_activity_and_subject<-as.data.frame(summarise_each(group_by_subject,funs(mean)))
tidy_average_by_activity_and_subject

write.table(tidy_average_by_activity_and_subject,"tidy_average_by_activity_and_subject.txt",row.name=FALSE)

