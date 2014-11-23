##Installing required packages if missing
checkpackages <- function(package) {
  suppressWarnings({
    if (!require(package,character.only=TRUE)) {
      installPackage <- readline(paste("Package",package,"not found. Install? (y for yes, otherwise for no): "))
      if (installPackage == "y") {
        install.packages(package)
      }
      require(package,character.only=TRUE)  
    }})
}
checkpackages("plyr")
checkpackages("reshape2")

##Creating Path to file locations 
datalocation<-"UCI HAR Dataset" 
fileloc<-function(file) {
    paste(datalocation,"/",file,sep="")
  }

sstestfile<-fileloc("test/X_test.txt")
sstestlabel<-fileloc("test/y_test.txt") 
sstrainingfile<-fileloc("train/X_train.txt")
sstraininglabel<-fileloc("train/y_train.txt")
ssfeatures<-fileloc("features.txt")
ssactivity<-fileloc("activity_labels.txt")
sstrainsubjects<-fileloc("train/subject_train.txt")
sstestsubjects<-fileloc("test/subject_test.txt")

## Reading in the data
testset<-read.table(sstestfile)
testlabel<-read.table(sstestlabel)
trainingset<-read.table(sstrainingfile)
traininglabel<-read.table(sstraininglabel)
features<-read.table(ssfeatures)
activitylabel<-read.table(ssactivity)
subjtrain<-read.table(sstrainsubjects)
subjtest<-read.table(sstestsubjects)


## Merging Training and Test data sets
mergedset<-rbind(trainingset,testset)

##labels the data set with descriptive variable names
colnames(mergedset)=features$V2

##Extracts only the measurements on the mean and standard deviation for each measurement
### including mean and std variables while excluding meanFreq which is a diff stat.
filter1<-grep("mean|std",features$V2)
exclude<-grep("meanFreq",features$V2)
filterfinal<-setdiff(filter1,exclude)
mergedsubset<-mergedset[,filterfinal]

##Merge training and test activity data set
mergedactds<-rbind(traininglabel,testlabel)
colnames(mergedactds)<-"activity_type"

##Use descriptive activity names to name the activities in the data set
mergedactds$activity_type<-factor(mergedactds$activity_type,labels=activitylabel$V2)

##Merging the activity dataset to mergedsubset to form final tidydataset1
tidydata1<-cbind(mergedsubset,mergedactds)

##Adding subject data for tidy data set 2
subjdata<-rbind(subjtrain,subjtest)
colnames(subjdata)<-"subject"
tidy1wsubj<-cbind(tidydata1,subjdata)

##Creating tidydata2 with average of each variable for each activity 
##and each subject.
tidy1wsubjlong<-melt(tidy1wsubj,id.vars=c("subject","activity_type"))
tidydata2<-dcast(tidy1wsubjlong,subject+activity_type~variable,mean)

##Writing final files as txt
write.table(tidydata1,"tidydata1.txt")
write.table(tidydata2,"tidydata2.txt")
