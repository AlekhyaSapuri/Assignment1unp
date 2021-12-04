#Loading Libraries
library(ggplot2)
library(dslabs)
library(dplyr)
library(tidyverse)
library(GGally)
library(MASS)

#Importing data and renaming the columns
naval_vessel <- read.csv("C:/Users/Buddha Dev/Downloads/naval_vessel.csv", header=FALSE)
View(naval_vessel)
colnames(naval_vessel)[colnames(naval_vessel)=="V18"] <-"tdecay"
colnames(naval_vessel)[colnames(naval_vessel)=="V17"] <-"cdecay"

#1 On naval dataset plot a Kernel density of Compressor Decay State Coefficient, and then answer the following question
#What kind of distribution does Compressor Decay State Coefficient have?

kde=density(naval_vessel$cdecay)
plot(kde,main = "Kernel Density plot")

# Answer: In density plot the curve is symmetric so it follows normal distribution

#2 Draw a scatterplot matrix on the naval dataset and watching the diagram name any two features which are linearly related to most of the other features.
pairs(naval_vessel[,1:18])

#3 Apply Min-Max scaling on the naval dataset.
mms <- (naval_vessel - min(naval_vessel)) / (max(naval_vessel) - min(naval_vessel))
head(mms)
#or
#install.packages("scales")
#library("scales")
#mmsd <- rescale(naval_vessel) (0/1) or rescale(naval_vessel, to =c(0,n))
#head(mmsd)

#4 From the naval dataset find out mean and median of both the outputs
mmec <- summary(naval_vessel$cdecay)
mmec
mmet <- summary(naval_vessel$tdecay)
mmet

#5 From R- MASS library use the Boston dataset and then answer the following questions. Who has the lowest salary?.Who does work in HR? 

boston=Boston
View(boston)

#6 Load the Titanic dataset (inbuilt to R), then find out how many male child survived? and How many first class passengers were there?
titanic=data.frame(Titanic)
View(titanic)
titanic%>%count(Sex=="Male" & Age=="Child" & Survived=="Yes")
titanic%>%count(Class=="1st")

