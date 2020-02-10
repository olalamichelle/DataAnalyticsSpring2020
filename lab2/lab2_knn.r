# read data in
nyt1<-read.csv(".csv")
# eliminate zeros
nyt1<-nyt1[which(nyt1$Impressions>0 & nyt1$Clicks>0 & nyt1$Age>0),]
## or could just have this: nyt1<-nyt1[which(nyt1$Impressions>0 & nyt1$Age>0),]
nnyt1<-dim(nyt1)[1]
#90% to train
sampling.rate=0.9
#remainder to test
num.test.set.labels=nnyt1*(1.-sampling.rate)
#construct a random set of training indices (training)
training <-sample(1:nnyt1,sampling.rate*nnyt1, replace=FALSE)
#build the training set (train)
train<-subset(nyt1[training,],select=c(Age,Impressions))
#construct the remaining test indices (testing)
testing<-setdiff(1:nnyt1,training)
#define the test set
test<-subset(nyt1[testing,],select=c(Age,Impressions))
#construct labels for another variable (Gender) in the training set
cg<-nyt1$Gender[training]
#construct true labels the other variable in the test set
true.labels<-nyt1$Gender[testing]
#run the classifier, can change k
classif<-knn(train,test,cg,k=5)
#view the classifier
classif
#looks at attriburtes
attributes(.Last.value)
# -------------lab2-knn2


require(kknn)
data(ionosphere)
ionosphere.learn <- ionosphere[1:200,]
ionosphere.valid <- ionosphere[-c(1:200),]
fit.kknn <- kknn(class ~ ., ionosphere.learn, ionosphere.valid)
table(ionosphere.valid$class, fit.kknn$fit)
(fit.train1 <- train.kknn(class ~ ., ionosphere.learn, kmax = 15, 
                          kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1))
table(predict(fit.train1, ionosphere.valid), ionosphere.valid$class)
(fit.train2 <- train.kknn(class ~ ., ionosphere.learn, kmax = 15, 
                          kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 2))
table(predict(fit.train2, ionosphere.valid), ionosphere.valid$class)


data(iris)
m <- dim(iris)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE, 
              prob = rep(1/m, m)) 
iris.learn <- iris[-val,]
iris.valid <- iris[val,]
iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1,
                  kernel = "triangular")
summary(iris.kknn)
fit <- fitted(iris.kknn)
table(iris.valid$Species, fit)
pcol <- as.character(as.numeric(iris.valid$Species))
pairs(iris.valid[1:4], pch = pcol, col = c("green3", "red")
      [(iris.valid$Species != fit)+1])