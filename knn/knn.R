library(class)
library(caret)

dataset <- iris

sum(is.na(dataset))
data <- na.omit(dataset)
preproc <- preProcess(data[, -1], method = c("center", "scale"))
data[, -1] <- predict(preproc, data[, -1])
set.seed(30)  # For reproducibility
splitIndex <- createDataPartition(data$Species, p = 0.7, list = FALSE)
training_data <- data[splitIndex, ]
testing_data <- data[-splitIndex, ]


testing_data$Species<-as.factor(testing_data$Species)

# Fitting KNN Model  
# to training dataset 
classifier_knn <- knn(train = training_data[, 1:4], 
                      test = testing_data[, 1:4], 
                      cl = training_data$Species, 
                      k = 9) 
classifier_knn 

# Confusiin Matrix 
cm <- table(testing_data$Species, classifier_knn) 
cm 

# Model Evaluation - Choosing K 
# Calculate out of Sample error 
misClassError <- mean(classifier_knn != testing_data$Species) 
print(paste('Accuracy =', 1-misClassError))

