setwd("~/Documents/GitHub/DataAnalyticsSpring2020/lab3") 

library(ggplot2)
library(rpart) # recursive partitioning and regression tress
library(rpart.plot)
library(C50)
library(dplyr)
?rpart

data("msleep")
?data
msleep %>% glimpse() #this is the same as 
??glimpse
str(msleep) # which gives the structure of 'msleep' dataset

str(msleep) 
msleep %>% glimpse() #this is the same as 

?msleep # docs for the msleep dataset (mammal sleep)


# create a new datafram with the following columns included
