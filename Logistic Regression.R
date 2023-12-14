# Load required libraries
library(ggplot2)
library(corrplot)
library(caret)
library(readr)

# Input Data
data <- read_csv("C:/Users/Binta/OneDrive/Documents/CV Publikasi/Logistic Regression/Dataset of Diabetes .csv")

# Display information and tail of the dataset
str(data)
tail(data)

# Create a new variable 'Gender_No'
data$Gender_No <- ifelse(data$Gender == "M", 0, 1)

# Create a new variable 'Class_No'
data$Class_No <- ifelse(data$CLASS == "N", 0, ifelse(data$CLASS == "Y", 1, 0.5))

# Remove 'Gender' and 'CLASS' columns
names(data)
data <- subset(data, select = -c(Gender, CLASS))

# Display head and information of the modified dataset
head(data)
str(data)

# Display correlation heatmap
correlation_matrix <- cor(data[, c('AGE', 'Urea', 'Cr', 'HbA1c', 'Chol', 'TG', 'HDL', 'LDL', 'VLDL', 'BMI', 'Class_No', 'Gender_No')])
corrplot(correlation_matrix, method = 'color', type = 'upper', order = 'hclust', tl.col = 'black')

# Split the dataset into independent variables (x) and the dependent variable (y)
x <- data[, 3:9]
y <- data$Class_No

# Split the dataset into training and test sets
set.seed(0)
split <- createDataPartition(y, p = 0.8, list = FALSE)
train_data <- data[split, ]
test_data <- data[-split, ]

# Fitting the logistic regression model
logreg <- glm(Class_No ~ AGE + Urea + Cr + HbA1c + Chol + TG + HDL + LDL + VLDL + BMI, data = train_data, family = binomial)

# Predict the test set results
y_pred <- predict(logreg, newdata = test_data, type = 'response')
y_tpred <- ifelse(y_pred > 0.5, 1, 0)

# Model evaluation metrics
conf_matrix <- confusionMatrix(data = as.factor(y_tpred), reference = as.factor(test_data$Class_No))
conf_matrix

# Plot the logistic regression line
plot(data$AGE, y, col = ifelse(y == 1, "red", "blue"), pch = 19)
abline(h = 0.5, col = "green", lty = 2)
