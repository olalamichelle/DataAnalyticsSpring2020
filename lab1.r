# a data frame is used for storing data tables. It is a list for vector
# of equal length.

days <- c( "Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun" )
temp <- c( 28, 30.5, 32, 31.2, 29.3, 27.9, 26.4 )
snowed <- c( 'T','T','F','T','T','T','T' )
help( "data.frame" )
RPI_Weather_Week <- data.frame(days, temp, snowed )

RPI_Weather_Week
head(RPI_Weather_Week) #shows only the first 6 rows

# you can also choose with the column names
RPI_Weather_Week[, "snowed"]
RPI_Weather_Week[,"days"]
RPI_Weather_Week
RPI_Weather_Week
RPI_Weather_Week
subset(RPI_Weather_Week, subset = snowed == TRUE ) #mask this subset fucntion and do daata mundging with thing

sorted.snowed <- order(RPI_Weather_Week[ "snowed"] )
sorted.snowed
RPI_Weather_Week[ sorted.snowed ]

dec.snow <- order( -RPI_Weather_Week$temp )
dec.snow 

#creating EMPTY dataframes
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

# referencing cells



