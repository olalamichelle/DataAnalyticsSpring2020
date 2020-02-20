# Decison Tree: 
# split data into subsets s.t. each subset belongs to one particular class
#        
# library(rpart)

dim(iris)
# creating a sample form the irsi dataset
s_iris <- sample(150, 100)
s_iris 

# creat testing and training stes
iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,]
dim(iris_test)
dim(iris_train)

# generate the decision tree model
decisionTreeModel <-rpart( Species~., iris_train, method = "class" )
decisionTreeModel

# plot the decision tree
rpart.plot(decisionTreeModel)

