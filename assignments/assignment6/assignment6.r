## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Assignment - 5


rm(list = ls())
breastcancer <- read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/breast-cancer-wisconsin.data.csv")
View(breastcancer)

#random index creation
idx<-sort(sample(nrow(breastcancer),as.integer((.70*nrow(breastcancer)))))
training_data<-breastcancer[idx,]
testing_data<-breastcancer[-idx,]

#install.packages("C50")
library(C50)
c50class<-C5.0(factor(Class)~.,data=training_data)
summary(c50class)
plot(c50class)


prediction<-predict(c50class,testing_data,type="class")

#creates frequency table
table(actual=testing_data[,11],prediction)

#percentage accuracy
match<-(testing_data[,11]==prediction)*100
acc<-sum(match)/length(match)
acc

#error-rate
error<-(testing_data[,11]!=prediction)
error_rate<-sum(error)/length(error)
error_rate



