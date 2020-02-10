# I used the EPI/EPI_data.csv under https://aquarius.tw.rpi.edu/html/DA/EPI/

library(tidyverse)
library(dplyr) # sample_n(), sample_frac(), arrang(), summerise(), %>% (pipe) (ref: https://datacarpentry.org/R-genomics/04-dplyr.html)
attach(data)

# 2a - Measures of Central Tendency/Histograms/ Data Manipulation:
data <- read_csv("EPI_data.csv")
data %>% glimpse()

# (0) summary ==> shows the mean, median, and quantiles for numeric variables in a data frame
summary(EPI)
summary(DALY)

# (1) sample_n() ==> pick random number of rows that we wish to choose:
sample_n(EPI, 5) # random 5 rows
sample_n(DALY, 5) # random 5 rows

# (2) sample_frac() ==> pick a percentage of rows
sample_frac(EPI, 0.1) # sample with a 10% of rows from the total number of rows 
sample_frac(DALY, 0.1) ) # sample with a 10% of rows from the total number of rows

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



