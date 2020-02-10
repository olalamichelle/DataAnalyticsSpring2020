# setwd("~/Documents/GitHub/DataAnalyticsSpring2020/lab2")
# reference: https://support.rstudio.com/hc/en-us/articles/200711843-Working-Directories-and-Workspaces

# Part1. MultiLinear Regression
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

# 2. kNN
abalone <- read_csv( "abalone.csv" )
is.factor(abalone$Sex)

library( knitr )
kable( abalone[1:10,], digits = 4, format = "markdown" )
ggpairs(abalone, aes(colour = Sex, alpha = 0.8), title="Pairs plot for abalone dataset") + 
  theme_grey(base_size = 8)
# 3. Kmeans