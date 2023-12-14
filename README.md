# Clustering Analysis using R

This script performs clustering analysis on online sports wagering data using Euclidean and Manhattan distances.

Data source from: https://www.kaggle.com/datasets/mattop/online-sport-wagering-data-2021-2023

## Installation and Prerequisites

To run this script, make sure you have installed the following R packages:
```
# Loading Required Libraries
library(dendextend)
library(readr)
```
Importing necessary libraries, including dendextend for dendrogram manipulation and readr for reading data.
```
# Input Data
data1 <- read_csv("C:/Users/Binta/OneDrive/Documents/CV Publikasi/Clustering/Selected_Online_Sport_Wagering_Data.csv")
data <- data.frame(data1[, 4:14])
```
Reading the CSV file and creating a data frame (data) containing columns from the 4th to the 14th.
```
# EUCLID
# Calculating Euclidean Distance Matrix
euclidean_distance <- dist(data, method = "euclidean")
```
Calculating the Euclidean distance matrix using the dist function.
```
# Creating a Dendrogram
dend_euclidean <- hclust(euclidean_distance, method = "single")
dend1_euclidean <- hclust(euclidean_distance, method = "average")
dend2_euclidean <- hclust(euclidean_distance, method = "complete")
dend3_euclidean <- hclust(euclidean_distance, method = "ward.D2")
```
Building dendrograms using hierarchical clustering (hclust) with different linkage methods: single, average, complete, and ward.D2.
```
# Show Dendrogram
plot(dend_euclidean, main = "Dendrogram Euclidean")
plot(dend1_euclidean, main = "Dendrogram Euclidean")
plot(dend2_euclidean, main = "Dendrogram Euclidean")
plot(dend3_euclidean, main = "Dendrogram Euclidean")
```
Displaying dendrograms for each linkage method using the plot function.

### Plot Euclidean Single Linkage
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/a7cc419e-4f36-47fb-8fba-59f089c757a9)

### Plot Euclidean Average Linkage
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/09b347f5-e124-4ec1-a9bb-f036ad1dbe7a)

### Plot Euclidean Complete Linkage
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/e131c394-4eca-4f3e-bf6a-c321e6ee2d8d)

### Plot Euclidean Ward's Method
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/312d4144-571d-4b54-8d19-409d4f2600b4)

```
# MANHATTAN
# Calculating Manhattan Distance Matrix
manhattan_distance <- dist(data, method = "manhattan")
```
Calculating the Manhattan distance matrix using the dist function.
```
# Creating a Dendrogram
dend_manhattan <- hclust(manhattan_distance, method = "single")
dend1_manhattan <- hclust(manhattan_distance, method = "average")
dend2_manhattan <- hclust(manhattan_distance, method = "complete")
dend3_manhattan <- hclust(manhattan_distance, method = "ward.D2")
```
Building dendrograms using hierarchical clustering (hclust) with different linkage methods: single, average, complete, and ward.D2.
```
# Show Dendrogram
plot(dend_manhattan)
plot(dend1_manhattan)
plot(dend2_manhattan)
plot(dend3_manhattan)
```
Displaying dendrograms for each linkage method using the plot function.
### Plot Manhattan Single Linkage
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/d4b55a19-cfcd-469e-af46-f8397fecfc86)

### Plot Manhattan Average Linkage
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/40bf3601-5885-4c9f-9258-d9a346b93fff)

### Plot Manhattan Complete Linkage
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/4e84e5ad-d2f9-43d4-bcee-78a818be1cc8)

### Plot Manhattan Ward's Method
![image](https://github.com/itsbintg/Cluster-Data-Analysis/assets/140331853/fc03279c-d185-4156-8423-61551cc6465b)
