# lab1 - part2
EPI = read.csv("EPI_data.csv", header = TRUE )
plot(ecdf(EPI), do.points = FALSE, verticals = TRUE )
# Quantile-Quantile 
help("qqnorm")
qqplot(qt(ppoint(250), df = 5, x, xlab = "QQ plot for tdsn"))

# https://www.rdocumentation.org/packages/EnvStats/versions/2.3.1/topics/qqPlot

# creating plots
# ch 2 -- R Graphics Cookbook
plot(mtcars$wt, mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt, mtcasrs$mpg)
qplot(wt, mpg, data = mtcars)
ggplot(mtcars, aes(x-wt, y = mpg)) + geom_point()
plot(pressure$temperature, pressure$pressure, type = "l")
points(presure$temperature, presure$pressue)

lines(pressure$temperature, pressure$temperature/2, col = "red")
points(pressure$temperature, pressure$pressure/2, col = "blue")
library(ggplot2)

qplot(pressure$temperature, pressure$pressurem, geom = "line")
qplot(pressure$temperature, pressure$pressurem, geom = "line")
qplot(pressure, aes(x = temperature, y = pressure) + geom_line() + geom_point() )
qplot(pressure, aes(x = temperature, y = pressure) + geom_line() + geom_point() )

# creting bar graphs
barpot*BOD$demand, names.arg = BOD$Time0
table(mtcars$cyl)
barplot(table(mtcars$cyl)) #generate a table of counts
qplot(mtcars$cyl)
qplot(factor(mtcars$cyl)) # treat cyl as discrete

# bar graph of counts
qplot(factor(cyl), data = mtcars)
ggplot(mtcars, aex(x = factor(cyl))) + geom_bar()

# create histogram
# view the dirtibution of one =-dimentional data with a histogram
hist(mtcars$mpg)
hist(mtcars$mpg, break = 10)
hist(mtcars$mpg, break = 5)
hist(mtcars$mpg, break = 12)
qplot(mgp, data = mtcars, binwidth = 4)
ggplot(mtcars, aes(x = mgp)) + geom_histogrram(binwidth = 4)
ggplot(mtcars, aes(x = mgp)) + geom_histogrram(binwidth = 5)


# creating box-plot

# pass it a factor of x values and a vector of y values
plot(ToothGrowth$supp, ToothGrowth$len) 

#formula syntax
# if the two 
boxplot(len ~ supp, data = ToothGrowth)





      
      
      
      
      
      )