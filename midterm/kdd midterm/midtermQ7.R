##Name- yash navadiya
##CWID - 10455328
##Midterm
##subject - Knowledge discovery and data mining
##Class- CS513-B
##Question-7


rm(list=ls()) 
#install.packages("rpart")
#install.packages("RColorBrewer")
#install.packages("rattle")
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)

income <- read.csv("D:/yash/Stevens/SEM 1/KDDM/midterm/adult_income_Dtree.csv",na.strings = " ?")
summary(income)
View(income)

##remove rows having missing  values
removeddata<-na.omit(income)
View(removeddata)
summary(removeddata)

idx <- seq(1,nrow(removeddata),by=5)

##divding test and training data sets
testdataset<-removeddata[idx,]
summary(testdataset)
trainingdataset <-removeddata[-idx,]
summary(trainingdataset)


cartincome<- rpart( Income~., data =trainingdataset )


summary(cartincome)

##graph plotting
rpart.plot(cartincome)

##measuring score
cartprediction<-predict( cartincome ,testdataset, type="class" )

##for forming the frequency table
table(Actual=testdataset$Income,CART=cartprediction)
cartprediction2<-predict(cartincome,testdataset)
str(cartprediction2)

table(Actual=testdataset$Income,CART=cartpredictioncat)

##measuring accuracy 
a<-(testdataset$Income==cartprediction)*100
acc<-sum(a)/length(a)
acc

##measuring error rate
error<- sum(testdataset$Income!=cartprediction)
rate<-error/length(testdataset$Income)
rate


library(rpart.plot)
prp(cartincome)
fancyRpartPlot(cartincome)




