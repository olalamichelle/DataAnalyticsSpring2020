# Notes from learning R

# 1.Workspace
getwd() # obtain current working space, samce as pwd in C++
setwd() # go to another directory/folder and set that folder as working space
ls() # list the objects in the current workspace

# 2.Global options -- view and set options for the session
help(options) # learn about available options
options() # view current option settings
options(digits=3) # number of digits to print on output

# 3. Historical Commands (get/save/restore)
# 3.1 get your command history
history() # last 25 options
history(max.show=Inf) #  all previous commands

# 3.2 save your command history
savehistory(file="myfile") # default is ".Rhistory"

# 3.3 recall your command history
loadhistory(file="myfile") # default is ".Rhistory"


data("Auto")
head(Auto, 10) # If the second para is missing, this will defaultlt tives your the fist 7 row
tail(Auto, 10) # this will give the last 10 row
names(Auto)
summry(Auto)
sumary(Auto$mpd)
fivenum(Auto$mpg)
boxplot(Auto$mpg)
mean(Auto$mpg)
median(Auto$mpg)

help("read.csv")
data1 <- read_csv(file.choose(), header = T)
data1
names(data1)
is.na(data1)
hist(Auto$mpg)
attach(Auto)