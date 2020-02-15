
## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Assignment - 3

rm(list=ls())

breastcancer<- read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/breast-cancer-wisconsin.data.csv",na.string = "?")
df<-data.frame()


?kknn()

missing<-na.omit(breastcancer)
View(missing)

missing$Class<-factor(missing$Class, labels = c("begin","malignant"))
View(missing$Class)




idx<-sort(sample(nrow(missing),as.integer(.70*nrow(missing))))

training<-missing[idx,]

test<-missing[-idx,]

summary(test)
summary(training)
library(kknn)
library(class) 


predict_k3 <- kknn(formula=Class~., training, test, k=3,kernel ="rectangular")
predict_k5 <- kknn(formula=Class~., training, test, k=5,kernel ="rectangular")
predict_k10 <- kknn(formula=Class~., training, test, k=10,kernel ="rectangular")


fit3 <- fitted(predict_k3)
table(test$Class,fit3)

fit5 <- fitted(predict_k5)
table(test$Class,fit5)

fit10 <- fitted(predict_k10)
table(test$Class,fit10)




