##Name- yash navadiya
##CWID - 10455328
##Midterm
##subject - Knowledge discovery and data mining
##Class- CS513-B
##Question-4

rm(list=ls())

# installing necessary packages
install.packages("plyr")
install.packages("dplyr")

#loading libraries
library(plyr)
library(dplyr)

#loading file
income <- read.csv("D:/yash/Stevens/SEM 1/KDDM/midterm/adult_income_EDA.csv",na.strings = " ?")
View(income)

S<-select_if(income,is.numeric)
summary(S)

#calculate standard deviation
colwise(sd)(S)

#creating a dataframe
dataframe<-data.frame(S)
sum(is.na(dataframe))
colSums(is.na(dataframe))

#replacing values by median
for(i in 1:ncol(dataframe)){
  dataframe[is.na(dataframe[,i]), i] <- median(dataframe[,i], na.rm = TRUE)
}

#for drawing boxplot 
boxplot(S)