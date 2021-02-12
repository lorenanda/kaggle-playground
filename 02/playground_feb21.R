library(dplyr) 
library(tidyverse)
library(readr)
library(skimr)
library(DataExplorer)
library(ggcorrplot)
library(corrplot)
library(xgboost)


train <- read_csv("Documents/kaggle-playground/02/data/train.csv") 
head(train)
dim(train)

test <- read_csv("Documents/kaggle-playground/02/data/test.csv")
View(test)
dim(test)

train_cat <- train %>% select(2:11)
View(train_cat)

train_cont <- train %>% select(12:25)
View(train_cont)

## EDA
# distribution of the train features
skim(train)

train_cont_corr <- cor(train_cont)
corrplot(train_cont_corr)
heatmap(x = train_cont_corr, symm = TRUE)

## Models
y_train <- train %>% pull(target)

y_train_matrix <- as.matrix(sapply(y_train, as.numeric))  
train_matrix <- as.matrix(sapply(train_cont, as.numeric))  

bstSparse <- xgboost(
  data = train_matrix, 
  label = y_train_matrix, 
  max.depth = 2, 
  eta = 1, 
  nthread = 2, 
  nrounds = 2, 
  objective = "binary:logistic")
