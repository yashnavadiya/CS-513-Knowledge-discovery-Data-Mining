## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Assignment - 9

rm(list=ls())

#load the file
breastcancer<-read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/wisc_bc_ContinuousVar.csv",na.strings = '?')
View(breastcancer)
summary(breastcancer)
table(breastcancer$diagnosis)
#factoring
breastcancer<-na.omit(breastcancer)
breastcancer<-breastcancer[-1]
cancerdist<-dist(breastcancer[,-1])
hclustresult<-hclust(cancerdist)
plot(hclustresult)
hclust2<-cutree(hclustresult,2)
table(hclust2,breastcancer[,1])


rm(list=ls())
#load the file
breastcancer<-read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/wisc_bc_ContinuousVar.csv",na.strings = '?')
View(breastcancer)
summary(breastcancer)
table(breastcancer$diagnosis)
#To factor the data set
breastcancer<-na.omit(breastcancer)
breastcancer<-breastcancer[-1]
kmeans2<- kmeans(breastcancer[,-1],2,nstart = 10)
kmeans2$cluster
table(kmeans2$cluster,breastcancer[,1])





