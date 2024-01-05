install.packages("caret")
install.packages("e1071")
install.packages("caTools")

library(caret)
dataset <- Soybean
dataset


sum(is.na(dataset))
soybean <- na.omit(dataset)
preproc <- preProcess(soybean[, -1], method = c("center", "scale"))
soybean[, -1] <- predict(preproc, soybean[, -1])
set.seed(123)  # For reproducibility
splitIndex <- createDataPartition(soybean$Class, p = 0.8, list = FALSE)
training_data <- soybean[splitIndex, ]
testing_data <- soybean[-splitIndex, ]

library(e1071)

# Fitting Naive Bayes Model 
# to training dataset
set.seed(120) # Setting Seed
classifier_cl <- naiveBayes(Class ~ ., data = training_data)
classifier_cl

# Predicting on test data'
y_pred <- predict(classifier_cl, newdata = testing_data)

# Confusion Matrix
cm <- table(testing_data$Class, y_pred)
cm

# Model Evaluation
confusionMatrix(cm)
