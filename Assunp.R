library(ggplot2)
library(dslabs)
library(dplyr)
library(tidyverse)
library(GGally)
library(MASS)
naval_vessel <- read.csv("C:/Users/Buddha Dev/Downloads/naval_vessel.csv", header=FALSE)
View(naval_vessel)
colnames(naval_vessel)[colnames(naval_vessel)=="V18"] <-"tdecay"
colnames(naval_vessel)[colnames(naval_vessel)=="V17"] <-"cdecay"

#1
kde=density(naval_vessel$cdecay)
plot(kde)

#2
pairs(naval_vessel[,1:18])

#3
mms <- (naval_vessel - min(naval_vessel)) / (max(naval_vessel) - min(naval_vessel))
head(mms)
#install.packages("scales")
#library("scales")
#mmsd <- rescale(naval_vessel) (0/1)or rescale(naval_vessel, to =c(0,n))
#head(mmsd)

#4
mmec <- summary(naval_vessel$cdecay)
mmec
mmet <- summary(naval_vessel$tdecay)
mmet

#6
titanic=data.frame(Titanic)
View(titanic)
titanic%>%count(Sex=="Male" & Age=="Child" & Survived=="Yes")
titanic%>%count(Class=="1st")

