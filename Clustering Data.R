# Loading Required Libraries
library(dendextend)
library(readr)

# Input Data
data1 <- read_csv("C:/Users/Binta/OneDrive/Documents/CV Publikasi/Clustering/Selected_Online_Sport_Wagering_Data.csv")
data <- data.frame(data1[, 4:14])

# EUCLID
# Calculating Euclidean Distance Matrix
euclidean_distance <- dist(data, method = "euclidean")

# Creating a Dendrogram
dend_euclidean <- hclust(euclidean_distance, method = "single")
dend1_euclidean <- hclust(euclidean_distance, method = "average")
dend2_euclidean <- hclust(euclidean_distance, method = "complete")
dend3_euclidean <- hclust(euclidean_distance, method = "ward.D2")

# Show Dendrogram
plot(dend_euclidean, main = "Dendrogram Euclidean")
plot(dend1_euclidean, main = "Dendrogram Euclidean")
plot(dend2_euclidean, main = "Dendrogram Euclidean")
plot(dend3_euclidean, main = "Dendrogram Euclidean")

# MANHATTAN
# Calculating Manhattan Distance Matrix
manhattan_distance <- dist(data, method = "manhattan")

# Creating a Dendrogram
dend_manhattan <- hclust(manhattan_distance, method = "single")
dend1_manhattan <- hclust(manhattan_distance, method = "average")
dend2_manhattan <- hclust(manhattan_distance, method = "complete")
dend3_manhattan <- hclust(manhattan_distance, method = "ward.D2")

# Show Dendrogram
plot(dend_manhattan)
plot(dend1_manhattan)
plot(dend2_manhattan)
plot(dend3_manhattan)
