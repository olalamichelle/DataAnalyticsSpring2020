install.packages("MASS") # installing the MASS package
library(MASS) # load the library MASS
attach(Boston) # attaching the dataset
?Boston # help function with "?"
head(Boston) # show the head of the dataset
dim(Boston) # dimensions of the dataset
names(Boston) # column names 
str(Boston) # str function shows the structure of the dataset
nrow(Boston) # function shows the number of rows 
ncol(Boston) # function shows the number of columns 
summary(Boston) # summary() function shows the summary statistics
summary(Boston$crim) # summary of the "crime" column in the Boston dataset
