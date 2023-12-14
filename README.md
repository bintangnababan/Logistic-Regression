# Logistic Regression Analysis for Diabetes Prediction

## Overview

This R script performs logistic regression analysis on a dataset related to diabetes. The primary goal is to predict the likelihood of diabetes occurrence based on various medical parameters. The script includes data preprocessing, correlation analysis, model training, and evaluation.

## Libraries Used

- **ggplot2**: For creating plots and visualizations.
- **corrplot**: For displaying the correlation heatmap.
- **caret**: For dataset splitting and model evaluation.
- **readr**: For reading and handling CSV data.

## Data Input

The dataset is loaded from the CSV file, and key information about the dataset, including its structure and tail, is displayed.

## Data Preprocessing

1. **Creating New Variables:**
   - `Gender_No`: Binary variable indicating gender (0 for Male, 1 for Female).
   - `Class_No`: Binary variable representing diabetes class (0 for 'N', 1 for 'Y', and 0.5 for other).

2. **Removing Columns:**
   - 'Gender' and 'CLASS' columns are removed from the dataset.

## Exploratory Data Analysis (EDA)

- A correlation heatmap is generated to visualize the relationships between variables.

## Model Training and Evaluation

1. **Dataset Splitting:**
   - The dataset is split into independent variables (`x`) and the dependent variable (`y`).
   - Further division into training and test sets is performed.

2. **Logistic Regression Model:**
   - A logistic regression model is fitted using the training data.

3. **Prediction and Evaluation:**
   - The model is used to predict outcomes on the test set.
   - Confusion matrix metrics are calculated for model evaluation.

## Visualization

- The logistic regression line is plotted against the 'AGE' variable, highlighting the predicted diabetes classes.

This script provides a comprehensive analysis of diabetes prediction using logistic regression, with visualizations to aid in understanding the model's performance.
