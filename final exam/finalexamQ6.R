## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Final Exam:  Q6

rm(list=ls())

#load file
ibm <- read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/IBM_Attrition_v3.csv",na.strings = " ?")
summary(ibm)

#view the file
View(ibm)

#factoring
IBM<-na.omit(ibm)
summary(IBM)
ibm1<-IBM[-3]
ibm1<-ibm1[-5]
kmeans2<- kmeans(ibm1,2,nstart = 10)
kmeans2$cluster

#Create confusion matrix
table(kmeans2$cluster,IBM[,6])