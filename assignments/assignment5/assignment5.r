## CS513
## First Name:  Yash
## Last Name:   Navadiya
## CWID:        10455328 
## Assignment - 5

rm(list=ls()) 
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)

breastcancer <- read.csv("D:/yash/Stevens/SEM 1/KDDM/rawdata/breast-cancer-wisconsin.data.csv")
View(breastcancer)
breastcancer$Class <- factor(breastcancer$Class, levels = c(2,4), labels = c("Benign", "Malignant")) 
set.seed(111)

#random index creation
idx<-sort(sample(nrow(breastcancer),as.integer((.30*nrow(breastcancer)))))
training_data <- breastcancer[-idx,]
test_data =breastcancer[idx,]

#tree creation
dev.off()
Cartclass<- rpart( Class~., data =training_data )
summary(Cartclass)

#plotting graph
rpart.plot(Cartclass)


predictcart<-predict( Cartclass ,test_data , type="class" )

#creates frequency table
table(Actual=test_data[,11],CART=predictcart)
predictcart2<-predict(Cartclass,test_data)
str(predictcart2)
predictcart_cat<-ifelse(predictcart2[,1]<=.5,'Malignant','Benign')
table(Actual=test_data[,11],CART=predictcart_cat)

#percentage accuracy
match<- (test_data[,11]==predictcart)*100
acc<-sum(match)/length(match)
acc

#error rate
error<- sum(test_data[,11]!=predictcart)
errorrate<-error/length(test_data[,11])
errorrate

library(rpart.plot)
prp(Cartclass)

#fanciergraph
fancyRpartPlot(Cartclass) 