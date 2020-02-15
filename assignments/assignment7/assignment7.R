## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Assignment - 7

rm(list=ls())

#load the library
library(randomForest)

breastcancer<-read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/breast-cancer-wisconsin.data.csv",na.strings = '?')
View(breastcancer)

#factoring
breastcancer$Class <- factor(breastcancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
breastcancer<-na.omit(breastcancer)

#dividing test and training data
index<-sort(sample(nrow(breastcancer),as.integer(.70*nrow(breastcancer))))
trainingdataset<-breastcancer[index,]
testdataset<-breastcancer[-index,]

dev.off()
fit <- randomForest( Class~., data=trainingdataset, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
prediction<- predict(fit, testdataset)
table(actual=testdataset$Class,prediction)

#find the error rate
wrongdata<- (testdataset$Class!=prediction)
error<-sum(wrongdata)/length(wrongdata)
error 
