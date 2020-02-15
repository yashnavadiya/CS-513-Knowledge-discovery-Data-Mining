##Name- yash navadiya
##CWID - 10455328
##Midterm
##subject - Knowledge discovery and data mining
##Class- CS513-B
##Question-5

rm(list=ls())

#loading file
income <- read.csv("D:/yash/Stevens/SEM 1/KDDM/midterm/adult_income_knn.csv",na.strings = " ?")
View(income)
summary(income)

#removing rows having missing values
removeddata<-na.omit(income)
View(removeddata)
summary(removeddata)

idx <- seq(1,nrow(removeddata),by=5)

#dividing test and training data sets 
testdataset<-removeddata[idx,]
summary(testdataset)
trainingdataset <-removeddata[-idx,]
summary(trainingdataset)

# loading libraries
library(kknn)
library(class)

#knn algorithm
a<-kknn(formula = Income~., trainingdataset, testdataset, k=1, kernel = "rectangular")
fit<-fitted(a)
table(testdataset$Income,fit)
error<-sum(fit!=testdataset$Income)
e1<-error/length(fit)
e1

b<-kknn(formula = Income~., trainingdataset, testdataset, k=3, kernel = "rectangular")
fit<-fitted(b)
table(testdataset$Income,fit)
error<-sum(fit!=testdataset$Income)
e3<-error/length(fit)
e3

c<-kknn(formula = Income~., trainingdataset, testdataset, k=5, kernel = "rectangular")
fit<-fitted(c)
table(testdataset$Income,fit)
error<-sum(fit!=testdataset$Income)
e5<-error/length(fit)
e5