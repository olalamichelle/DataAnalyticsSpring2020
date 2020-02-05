# creating a dataframe
# a data frame is used for storing data tables. It is a list for vector
# of equal length.

days <- c( "Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun" )
temp <- c( 28, 30.5, 32, 31.2, 29.3, 27.9, 26.4 )
snowed <- c( 'T','T','F','T','T','T','T' )
help( "data.frame" )
RPI_Weather_Week <- data.frame(days, temp, snowed )

RPI_Weather_Week
head(RPI_Weather_Week) # Note: it shows only the first 6 rows
str(RPI_Weather_Week) # we can take a look at the structure of the dataframe using the str() function
summary(RPI_Weather_Week) # summary of the dataframe

# you can also choose with the column names
RPI_Weather_Week[1,] # shows the 1st row and all cols
RPI_Weather_Week[,1] # shows the 1st col and all rows

RPI_Weather_Week[, "snowed"]
RPI_Weather_Week[,"days"]
RPI_Weather_Week[, 'temp']
RPI_Weather_Week[1:5, c("dats", "temp")]
RPI_Weather_Week$temp
subset(RPI_Weather_Week, subset = snowed == TRUE)
sorted.snowed <- order(RPI_Weather_Week[ "snowed"] )
sorted.snowed
RPI_Weather_Week[ sorted.snowed ]
# RPI_Weather_Week[descending_snowed,]
dec.snow <- order( -RPI_Weather_Week$temp )
dec.snow 

# creating EMPTY dataframes
empty.DataFrame <- data.frame()
v1 <- 1:10
v1
letters
v2 <- letters[1:10]
df <- data.frame(col.name.1 = v1, col.name.2 = v2 )
df 

# importing data and exporting dta
# wirting to a CSV file:
write.csv( df.file = "saved_df1.csv" )
df2 <- read.csv( "saved_df1.csv" )
df2

# http://lib.stat.cmu.edu/R/CRAN/ - load this first
# http://cran.r-project.org/doc/manuals/ 
# http://cran.r-project.org/doc/manuals/R-lang.html 
# R Studio – (see R-intro.html too) https://www.rstudio.com/products/rstudio/ (desktop version)
# Manuals - Libraries – at the command line – library(), or select the packages tab, and check/ uncheck as needed


# Exercises:
# read in csv
df <- read.csv("./GPW3_GRUMP_SummaryInformation_2010.csv", header = TRUE )

# plot some variable 
plot(df$CountryEnglish)
plot(df$ContinentName)

#some build-in datasets
data()
help(data)

EPI_data <- read.csv( "./2010EPI_data.csv")

#or EPI_data <- read.xlsx( <path>/2010EPI_data.xlsx")
# Note: replace default data frame name cannot start with numbers!
View(EPI_data)
require(utils)
attach(EPI_data) 	# sets the default object 

# fix(EPI_data) 	# launches a simple data editor

h
EPI 			# prints out values EPI_data$EPI
detach("EPI_data")

tf <- is.na(EPI_data$EPI) # records True values if the value is NA
E <- EPI_data$EPI[!tf] # filters out NA values, new array

# exlporing the distribution
summary(EPI_data$EPI)
fivenum( EPI_data$EPI, na.rm = TRUE )
stem(EPI_data$EPI)
hist(EPI_data$EPI)
hist(EPI_data$EPI, seq(30., 95., 1.0), prob = TRUE )
lines(density(EPI_data$EPI,na.rm=TRUE, bw=1.)) # or try bw=“SJ”



#other data
# # Note: replace default data frame name – cannot start with numbers! Munging has begun
GRUMP_data <- read.csv( "./GPW3_GRUMP_SummaryInformation_2010.csv" )
