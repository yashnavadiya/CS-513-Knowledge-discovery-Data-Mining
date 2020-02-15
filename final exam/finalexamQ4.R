## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Final Exam:  Q4

library(randomForest)

#load file
ibm <- read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/IBM_Attrition_v3.csv",na.strings = " ?")
summary(ibm)

#view the file
View(ibm)

#factoring
deleteddata<-na.omit(ibm)
summary(deleteddata)
idx<-seq(1,nrow(deleteddata),by=3)
testdataset<-deleteddata[idx,]
trainingdataset<-deleteddata[-idx,]
dev.off()

#implementation and plotting
m<- randomForest( Attrition~., data=trainingdataset, importance=TRUE, ntree=1000)
importance(m)
varImpPlot(m)

#Prediction
predict <- predict(model, testdataset)

#create confusion matrix
table(actual=testdataset$Attrition,predict)

#find error rate
wrong<- (testdataset$Attrition!=predict )
error<-sum(wrong)/length(wrong)
print(paste("Error rate :" , error))