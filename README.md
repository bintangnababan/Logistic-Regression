# Logistic Regression Analysis for Diabetes Dataset

## Load Required Libraries
```R
library(ggplot2)      # For data visualization
library(corrplot)     # For correlation matrix visualization
library(caret)        # For data partitioning and model evaluation
library(readr)        # For reading CSV files
```

## Input Data
```R
data <- read_csv("C:/Users/Binta/OneDrive/Documents/CV Publikasi/Logistic Regression/Dataset of Diabetes .csv")
```
- Reads the diabetes dataset from a CSV file.

## Data Exploration
```R
str(data)   # Display structure of the dataset
tail(data)  # Display the last few rows of the dataset
```
- Provides information about the dataset structure and displays the last few rows.

## Feature Engineering
```R
data$Gender_No <- ifelse(data$Gender == "M", 0, 1)   # Creates a binary variable 'Gender_No'
data$Class_No <- ifelse(data$CLASS == "N", 0, ifelse(data$CLASS == "Y", 1, 0.5))   # Creates a binary variable 'Class_No'
names(data)   # Displays column names
data <- subset(data, select = -c(Gender, CLASS))   # Removes 'Gender' and 'CLASS' columns
head(data)   # Display the modified dataset
str(data)    # Display updated structure of the dataset
```
- Generates new binary variables 'Gender_No' and 'Class_No' based on existing columns.
- Removes unnecessary columns ('Gender' and 'CLASS').

## Correlation Analysis
```R
correlation_matrix <- cor(data[, c('AGE', 'Urea', 'Cr', 'HbA1c', 'Chol', 'TG', 'HDL', 'LDL', 'VLDL', 'BMI', 'Class_No', 'Gender_No')])
corrplot(correlation_matrix, method = 'color', type = 'upper', order = 'hclust', tl.col = 'black')   # Displays a correlation heatmap
```
- Computes the correlation matrix for selected variables.
- Visualizes the correlation matrix using a heatmap.

## Data Splitting
```R
x <- data[, 3:9]   # Independent variables (features)
y <- data$Class_No   # Dependent variable
set.seed(0)
split <- createDataPartition(y, p = 0.8, list = FALSE)   # Splits the dataset into training and test sets
train_data <- data[split, ]
test_data <- data[-split, ]
```
- Divides the dataset into independent variables (`x`) and the dependent variable (`y`).
- Splits the dataset into training and test sets using 80-20 partition.

## Logistic Regression Modeling
```R
logreg <- glm(Class_No ~ AGE + Urea + Cr + HbA1c + Chol + TG + HDL + LDL + VLDL + BMI, data = train_data, family = binomial)   # Fits the logistic regression model
```

## Model Evaluation
```R
y_pred <- predict(logreg, newdata = test_data, type = 'response')   # Predicts the test set results
y_tpred <- ifelse(y_pred > 0.5, 1, 0)   # Converts probabilities to binary predictions
conf_matrix <- confusionMatrix(data = as.factor(y_tpred), reference = as.factor(test_data$Class_No))   # Evaluates the model using a confusion matrix
conf_matrix   # Displays the confusion matrix
```
- Uses logistic regression to model the relationship between variables and diabetes classification.
- Evaluates the model's performance using a confusion matrix.

## Visualization
```R
plot(data$AGE, y, col = ifelse(y == 1, "red", "blue"), pch = 19)   # Plots the logistic regression line
abline(h = 0.5, col = "green", lty = 2)   # Adds a threshold line to the plot
```
![image](https://github.com/itsbintg/Logistic-Regression/assets/140331853/e36b871c-8d81-477e-b892-abd2dffbfae3)

- Visualizes the logistic regression line on a scatter plot of age and diabetes classification.
