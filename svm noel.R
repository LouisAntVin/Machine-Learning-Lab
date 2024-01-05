install.packages("e1071")
# Load the required libraries
library(e1071)

# Load the Soybean dataset

dataset <- Soybean
dataset

sum(is.na(dataset))
soybean <- na.omit(dataset)

# Split the dataset into training and testing sets
set.seed(123)
indices <- sample(1:nrow(soybean), 0.8 * nrow(soybean))
train_data <- soybean[indices, -5]  # Excluding the target variable
train_labels <- soybean$Class[indices]
test_data <- soybean[-indices, -5]  # Excluding the target variable
test_labels <- soybean$Class[-indices]

# Train an SVM classifier
svm_model <- svm(train_data, train_labels, kernel = "radial")

# Make predictions on the test data
svm_predictions <- predict(svm_model, test_data)

# Evaluate the model's performance
confusion_matrix <- table(Actual = test_labels, Predicted = svm_predictions)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(confusion_matrix)
cat("Accuracy: ", accuracy)
