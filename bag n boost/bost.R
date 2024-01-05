install.packages("gbm")
library(gbm)

data(iris)
set.seed(123)
iris$Species<-as.numeric(factor(iris$Species))

boosted_model<-gbm(Species~.,data=iris, distribution = "multinomial",interaction.depth = 3, n.trees = 100, shrinkage = 0.1)

predictions <- predict(boosted_model, newdata =iris, n.trees = 100,type = "response")

predicted_labels<-apply(predictions,1,which.max)
table(predicted_labels,iris$Species)

max(predictions[150,1:3,])
