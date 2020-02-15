##Name- yash navadiya
##CWID - 10455328
##Assignment-2
##subject - Knowledge discovery and data mining
##Class- CS513-B

rm(list=ls())

breastcancer <- read.csv("D:/yash/SEM 1/KDDM/rawdata/breast-cancer-wisconsin.data.csv",na.string = "?")
View(breastcancer)

## question1.1 
summary(breastcancer)


## question1.2
dframe<-data.frame(breastcancer)
a<-is.na(dframe)
View(a)


#question1.3
for(i in 1:ncol(dframe)){
  dframe[is.na(dframe[,i]), i] <- mean(dframe[,i], na.rm = TRUE)
}
View(dframe)


#question1.4
dframe[,c(11,7)]


#question1.5
pairs(dframe[,2:7])


#question1.6
boxplot(dframe[8:10])
hist(dframe$F7)
hist(dframe$F8)
hist(dframe$F9)


#question 2

rm(list = ls())
breastcancer <- read.csv("D:/yash/SEM 1/KDDM/rawdata/breast-cancer-wisconsin.data.csv",na.string = "?")
View(breastcancer)
dframe<-data.frame(breastcancer)
na.omit(dframe)
