setwd("~/Documents/GitHub/DataAnalyticsSpring2020/lab2") # reference: https://support.rstudio.com/hc/en-us/articles/200711843-Working-Directories-and-Workspaces

# install.packages("readr")
# install.packages("car")
# install.packages("lmtest")
# install.packages("ggplot2")
# install.packages("GGally")
# install.packages("gridExtra")
# install.packages("MASS")
# install.packages("leaps")
# install.packages("glmnet")
# install.packages("caret")
# install.packages("gbm")

# Note: I used the EPI/EPI_data.csv under https://aquarius.tw.rpi.edu/html/DA/EPI/
library(readr)
library(car)
library(lmtest)
library(ggplot2)
library(GGally)
library(gridExtra)
library(MASS)
library(leaps)
library(glmnet)
library(caret)
library(gbm)
library(tidyverse)
library(dplyr) # sample_n(), sample_frac(), arrang(), summerise(), %>% (pipe) (ref: https://datacarpentry.org/R-genomics/04-dplyr.html)

# 2a - Measures of Central Tendency/Histograms/ Data Manipulation:
data <- read_csv("EPI_data.csv")
data %>% glimpse()
attach(data)
# (0) summary ==> shows the mean, median, and quantiles for numeric variables in a data frame
summary(EPI)
summary(DALY)

df_EPI = data.frame(EPI)
# (1) sample_n() ==> pick random number of rows that we wish to choose:
# random 5 rows
sample_n(EPI, 5) 
sample_n(DALY, 5) 

# (2) sample_frac() ==> pick a percentage of rows
# sample with a 10% of rows from the total number of rows 
sample_frac(EPI, 0.1) 
sample_frac(DALY, 0.1) ) 

# (3) arrange() ==> arrange values in the descending order and assign them to a new variables
?arrange
arrange( EPI, desc(EPI) )
arrange( desc(DALY) )

# (4)  arrange() and desc() ==> arrange values in the descending order in the EPI and DALY  
new_decs_EPI  <- arrange( data, desc(EPI) )
new_decs_DALY <- arrange( data, desc(DALY) )
new_decs_EPI 
new_decs_DALY 

# or you can sort the rows using the pipe operator:
# data %>% arrange( desc(EPI) ) %>% head
# data %>% arrange( desc(DALY) ) %>% head

# (5) mutate() ==> create new columns (ref: https://www.sharpsightlabs.com/blog/add-a-column-to-a-dataframe-in-r/)
# (ref: https://cengel.github.io/R-data-wrangling/dplyr.html)

# in additing to selecting sets of existing columns in the dataframe, sometimes 
# we need to add new columns that are functions of existing columns in the dataframe.
# we can use the mutate() function to do that.
data %>% mutate(double_EPI = EPI * 2) %>% head() %>% glimpse()
# If you only want to see the new column instead of calling the mutate, you can 
# use the transmute() fuction.
# The difference between the mutate() and transmute() is that mutate() function returns
# the entire dataframe along with the new column and the transmute() shows only the new column.
data %>% transmute(double_DALY = DALY * 2) %>% glimpse()

#(optional) -- drop a column if you accidentally add a wrong column(ref: https://stackoverflow.com/questions/6286313/remove-an-entire-column-from-a-data-frame-in-r)
# data$`double_EPI <- EPI * 2`  <- NULL

# (6) summaries() and mean ==> summarize the data frame into a single row using another aggrigate function like sum or mean
data %>% summarise(mean_EPI = mean(EPI, na.rm = TRUE), mean_DALY = mean(DALY, na.rm = TRUE)) %>% glimpse()

# (7) draw boxplot and qqplot
boxplot(ENVHEALTH,ECOSYSTEM)
qqplot(ENVHEALTH,ECOSYSTEM)

# 2b - using EPI dataset to find the single most important factor that increases EPI in a given region
# (1) create a multilinear regression model
lmENVH <- lm(ENVHEALTH~DALY+AIR_H+WATER_H)

# (2) display the mode
lmENVH

# Call:
# lm(formula = ENVHEALTH ~ DALY + AIR_H + WATER_H)
# 
# Coefficients:
# (Intercept)         DALY        AIR_H      WATER_H  
#  -2.673e-05    5.000e-01    2.500e-01    2.500e-01  

# Comments: 
# 1) sinece DALY has the largest coefficient, which could mean that DALY has the largest effect on  increaseing EPI in a given region
# 2) all three factors are significant based on their p-values
summary( lmENVH )
cENVH<-coef(lmENVH)

# Predict
DALYNEW <- c( seq(5, 95, 5) )
AIR_HNEW <- c( seq(5, 95, 5) )
WATHER_HNEW <- c( seq(5, 95, 5) )

NEW <- dataframe( DALYNEW, AIR_HNEW, WATHER_HNEW )
pENV <- predict( lmENVH, NEW, interval = "prediction" )
cENV <- predict( lmENVH, NEW, interval = "confidence" )

# ====================== Lab 2 (Part 2）=======================
# (1) MultiLinear Regression
df = read_csv( "dataset_multipleRegression.csv" )

# attach data frame
df

# create a linear model using lm(FORMULA, DATAVAR)
# predict the fall enrollment (ROLL) using the unemployment rate (UNEM) and number of spring high school graduates (HGRAD)
twoPredictorModel <- lm( ROLL ~ UNEM + HGRAD, df )
# display model
twoPredictorModel

# the expected fall enrollment (ROLL) given this year's unemployment rate 
# (UNEM) of 7% and spring high school graduating class (HGRAD) of 90,000 is:
ans1 <- -8255.7511 + 698.2681 * 7 + 0.9423 * 90000

# Repeat and add per capita income (INC) to the model. Predict ROLL if INC=$25,000
# Summarize and compare the two models.
# Comment on significance
threePredictorModel <- lm( ROLL ~ UNEM + HGRAD + INC, df )
# display model
threePredictorModel
# the expected fall enrollment (ROLL) given this year's unemployment rate (UNEM) of 9%, spring high school graduating class (HGRAD) of 100,000, and a per capita income (INC) of $30,000
ans2 <- -9153.2545 + 450.1245 * 9 + 0.4065 * 100000 + 4.2749 * 30000

# generate model summaries
summary(twoPredictorModel)
summary(threePredictorModel)

# (2) kNN
abalone <- read.csv( "abalone.csv" )
is.factor(abalone$Sex)

library( knitr )
kable( abalone[1:10,], digits = 4, format = "markdown" )

ggpairs(abalone, aes(colour = Sex, alpha = 0.8), title="Pairs plot for abalone dataset") + theme_grey(base_size = 8)

abalone['Infant'] <- ifelse(abalone$Sex == 'I','I','NI')
abalone$Infant <- as.factor(abalone$Infant)
abalone$Sex <- as.factor(abalone$Sex)

kable(abalone[abalone$Height == 0,], digits = 4,format = 'markdown')
# ggpairs(abalone, aes(colour = Sex, alpha = 0.8), title="Pairs plot for abalone dataset") + theme_grey(base_size = 8)

set.seed(42)
#Splitting dataset in train and test using 70/30 method
indexes <- sample(1:nrow(abalone), size = 0.3 * nrow(abalone))
abalone_train <- abalone[-indexes,]
abalone_test <- abalone[indexes,]

abalone_add <- lm(Rings ~ Sex+Length+Diameter+Height+ Whole_weight
                  +Shucked_weight+Viscera_weight
                  +Shell_weight,data = abalone_train)
summary(abalone_add)
# Kmeans
data("iris")

