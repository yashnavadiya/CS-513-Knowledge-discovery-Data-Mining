##Name- yash navadiya
##CWID - 10455328
##Midterm
##subject - Knowledge discovery and data mining
##Class- CS513-B
##Question-8

rm(list=ls())
##install.packages("C50")
library(C50)

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

Cartincome<- C5.0( Income~., data =trainingdataset )
summary(Cartincome)

#graph plot
plot(Cartincome)


#measure scoring
Cartprediction<-predict( Cartincome ,testdataset , type="class" )

#for forming frequency table
table(Actual=testdataset$Income,Cartprediction)

#measure accuracy
a<- (testdataset$Income==Cartprediction)*100
acc<-sum(a)/length(a)
print(paste("accuracy :" , acc))

#measure error
err<- sum(testdataset$Income!=Cartprediction)
error<-err/length(testdataset$Income)
print(paste("error rate:" , error))
