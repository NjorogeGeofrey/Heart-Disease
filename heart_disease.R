library(class)
library(skimr)
library(tidyverse)
library(ggplot2)
library(gmodels)

glimpse(Heart_Disease_Prediction)
skim(Heart_Disease_Prediction)
table(Heart_Disease_Prediction$Heart.Disease)
ggplot(Heart_Disease_Prediction, aes(x = Heart.Disease, color = Sex)) +
  geom_bar()
Heart_Disease_Prediction$Sex <- as.numeric(Heart_Disease_Prediction$Sex)
summary(Heart_Disease_Prediction[3:6])
Heart_Disease_Prediction %>% 
  group_by(Sex, Heart.Disease) %>% 
  summarize(sum = sum(S))
table(Heart_Disease_Prediction%Sex, Heart_Disease_Prediction$Heart.Disease)
Heart_Disease_Prediction$Heart.Disease <- as.factor(Heart_Disease_Prediction$Heart.Disease)
levels(Heart_Disease_Prediction$Heart.Disease)
normalize <- function(x){
  (((x) - min(x))/(max(x) - min(x)))
}
summary(normalize(c(1, 2, 3)))

glimpse(Heart_dises)

H.DIS <- as.data.frame(lapply(Heart_Disease_Prediction[1:13], normalize)
)
H.DIS_train<- H.DIS[1:219,]
H.DIS_test <- H.DIS[220:270,]
H.DIS_train_labels <- Heart_Disease_Prediction[1:219,14]
H.DIS_test_labels <- Heart_Disease_Prediction[220:270,14]
pred_H.DIS <- knn(train = H.DIS_train, test = H.DIS_test, cl = H.DIS_train_labels,
                   k =30)

CrossTable(x = H.DIS_test_labels, y = pred_H.DIS, prop.chisq = FALSE)





