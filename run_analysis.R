
dela <- function(dataSourceDir="data", dataFileName="CourProjData.txt", meanFileName="CourProjGroupByData.txt")
{

  # FEATURES AND ACTIVITY LABELS
  # reading features data and activity labels
  fdata<-read.table(sprintf("%s/features.txt",dataSourceDir))
  adata<-read.table(sprintf("%s/activity_labels.txt",dataSourceDir))
    
 
  # cv - filter for reading only std and mean data
  # fdata$V2 - vector for labeling data
  fdata2<-subset(fdata, grepl("std[()]|mean[()]", fdata$V2))
  cv<-sapply(fdata$V2,function(x) { 
      y<-"numeric"
      n<-"NULL" 
      ifelse(grepl("std[()]|mean[()]",x),y,n) } )
  
  # TEST DATA
  # reading test data
  txdata<-read.table(sprintf("%s/test/x_test.txt",dataSourceDir), colClasses=cv,col.names=fdata$V2)
  txsub<-read.table(sprintf("%s/test/subject_test.txt",dataSourceDir),col.names=c("Subject"))
  txact<-read.table(sprintf("%s/test/y_test.txt",dataSourceDir),col.names=c("ActivityCode"))
  
  # doubling ActivityCode and changing name to ActivityName
  txactn<-txact
  names(txactn)<-c("ActivityName")
  
  # binding all test tables together
  tx_bind<-cbind(txsub,txact,txactn,txdata)
  
  # changing test ActivityCode to ActivityName
  tx_bind$ActivityName<-adata$V2[tx_bind$ActivityCode]
  
  # TRAINING DATA
  # reading training data
  ttdata<-read.table(sprintf("%s/train/x_train.txt",dataSourceDir),colClasses=cv,col.names=fdata$V2)
  ttsub<-read.table(sprintf("%s/train/subject_train.txt",dataSourceDir),col.names=c("Subject"))
  ttact<-read.table(sprintf("%s/train/y_train.txt",dataSourceDir),col.names=c("ActivityCode"))
  
  # doubling ActivityCode and changing name to ActivityName
  ttactn<-ttact
  names(ttactn)<-c("ActivityName")
  
  # binding all training tables together
  tt_bind<-cbind(ttsub,ttact,ttactn,ttdata)
  
  # changing training ActivityCode to ActivityName
  tt_bind$ActivityName<-adata$V2[tt_bind$ActivityCode]
  
  # ALL DATA
  # binding test and training data
  txt_bind<-rbind(tt_bind,tx_bind)
  
  # Second data set with the average of each variable for each activity and each subject
  ts<-aggregate(. ~ Subject + ActivityCode,data=txt_bind,mean)
  
  # changing training ActivityCode to ActivityName - again because of aggregate function
  ts$ActivityName<-adata$V2[ts$ActivityCode]
  
  # Writing tables to files
  write.table(txt_bind,sprintf("%s/%s",dataSourceDir,dataFileName),row.names=FALSE)
  write.table(ts,sprintf("%s/%s",dataSourceDir,meanFileName),row.names=FALSE) 
  txt<-sprintf("Written files: %s and %s", sprintf("%s/%s",dataSourceDir,dataFileName),sprintf("%s/%s",dataSourceDir,meanFileName))
  print(txt)
}


