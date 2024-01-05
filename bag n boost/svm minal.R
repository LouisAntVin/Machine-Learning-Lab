library(e1071)
library(caret)
library(caTools)

Soybean <- read_csv("C:/Users/hp/Downloads/Soybean.csv")
Soybean<-as.data.frame(Soybean)
Soybean$Class<-as.factor(Soybean$Class)
Soybean<-na.omit(Soybean)
str(Soybean)

#partition
set.seed(123)
split <- sample.split(Soybean$Class,SplitRatio = 0.7)
train_set <- subset(Soybean,split==TRUE)
test_set <- subset(Soybean,split==FALSE)
train_scale <- scale(train_set[,-1])
test_scale <- scale(test_set[,-1])

classifier <- svm(Class~. ,data = train_set,kernel ="radial")
pred <- predict(classifier,newdata = test_set)

cm <- table(test_set$Class,pred)
confusionMatrix(cm)