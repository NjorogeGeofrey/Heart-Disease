Heart Disease Prediction
Overview:
This project focuses on predicting heart disease using the k-Nearest Neighbors (kNN) algorithm. The dataset used for this analysis is named Heart_Disease_Prediction.

Libraries Used:
class
skimr
tidyverse
ggplot2
gmodels
Instructions:
Loading Libraries:
Make sure to install and load the required libraries:

library(class)
library(skimr)
library(tidyverse)
library(ggplot2)
library(gmodels)
Loading and Exploring Data:
Load the dataset Heart_Disease_Prediction:

glimpse(Heart_Disease_Prediction)
skim(Heart_Disease_Prediction)
Data Visualization:
Visualize the distribution of heart disease cases based on gender:

table(Heart_Disease_Prediction$Heart.Disease)
ggplot(Heart_Disease_Prediction, aes(x = Heart.Disease, color = Sex)) +
  geom_bar()
Data Preprocessing:
Convert the Sex variable to numeric and normalize selected columns:

Heart_Disease_Prediction$Sex <- as.numeric(Heart_Disease_Prediction$Sex)
summary(Heart_Disease_Prediction[3:6])
Heart_Disease_Prediction$Heart.Disease <- as.factor(Heart_Disease_Prediction$Heart.Disease)
levels(Heart_Disease_Prediction$Heart.Disease)
normalize <- function(x){
  (((x) - min(x))/(max(x) - min(x)))
}
Data Splitting:
Split the normalized data into training and testing sets:

H.DIS_train <- H.DIS[1:219,]
H.DIS_test <- H.DIS[220:270,]
H.DIS_train_labels <- Heart_Disease_Prediction[1:219,14]
H.DIS_test_labels <- Heart_Disease_Prediction[220:270,14]
Model Training and Prediction:

pred_H.DIS <- knn(train = H.DIS_train, test = H.DIS_test, cl = H.DIS_train_labels, k = 30)
Model Evaluation:
Evaluate the model's performance using a confusion matrix:

CrossTable(x = H.DIS_test_labels, y = pred_H.DIS, prop.chisq = FALSE)
Note:
Feel free to explore and modify the code as needed for your analysis.
Adjust parameters such as k in the kNN algorithm based on your specific requirements.
