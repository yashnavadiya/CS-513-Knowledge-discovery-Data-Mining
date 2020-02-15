## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Assignment - 8

rm(list=ls())

#load the library
library(neuralnet)

breastcancer<-read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/wisc_bc_ContinuousVar.csv",na.strings = '?')
View(breastcancer)

table(breastcancer$diagnosis)

breastcancer$Class <- factor(cancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
breastcancer<-data.frame(lapply(na.omit(breastcancer),as.numeric))

#splitting data
index<-sort(sample(nrow(breastcancer),as.integer(.70*nrow(breastcancer))))
trainingdataset<-breastcancer[index,]
testdataset<-breastcancer[-index,]
dev.off()
?neuralnet()
model<- neuralnet(diagnosis~.,trainingdataset[-1], hidden=5, threshold=0.01)

#Plotting neural network
plot(model)


ann <-compute(model,testdataset)
ann$net.result

anncat<-ifelse(ann$net.result <1.5,1,2)
length(anncat)
length(testdataset$diagnosis)
table(anncat,testdataset$diagnosis)

#finding error rate
wrong<- (testdataset$diagnosis!=anncat)
error_rate<-sum(wrong)/length(wrong)
error_rate

