## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Final Exam:  Q5

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
ibmdist<-dist(ibm1)

#Implementation
results<-hclust(ibmdist)

#Plotting cluster
plot(results)
hclust2<-cutree(results,2)

#create confusion matrix
table(hclust2,IBM[,6])
