##Name- yash navadiya
##CWID - 10455328
##Midterm
##subject - Knowledge discovery and data mining
##Class- CS513-B
##Question-6

rm(list=ls())
#load file
income <- read.csv("D:/yash/Stevens/SEM 1/KDDM/midterm/adult_income_Bayes.csv",na.strings = " ?")
summary(income)
View(income)

#remove rows having missing  values
removeddata<-na.omit(income)
View(removeddata)
summary(removeddata)

idx <- seq(1,nrow(removeddata),by=5)

#divding test and training data sets
testdataset<-removeddata[idx,]
summary(testdataset)
trainingdataset <-removeddata[-idx,]
summary(trainingdataset)

#loading libraries
library(e1071)
library(class)

#naive bayes algorithm
naive<- naiveBayes(Income ~ ., data = trainingdataset)
predictnaive <- predict(naive, testdataset)
table(naive=predictnaive,class=testdataset$Income)

prop.table(table(naivealgo=predictnaive,class=testdataset$Income))

wrongprediction<-sum(predictnaive!=testdataset$Income)

#finding error rate
errorrate<-wrongprediction/length(predictnaive)

print(paste("total number of bad predictions:" , wrongprediction))
print(paste("error rate :" , errorrate))
print(paste("accuracy :" , 100-(errorrate*100)))