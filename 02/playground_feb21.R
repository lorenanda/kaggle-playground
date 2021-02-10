library(dplyr) 
library(tidyverse)
library(readr)
library(skimr)
library(DataExplorer)
library(ggcorrplot)

train <- read_csv("Documents/kaggle-playground/02/data/train.csv") 
head(train)

test <- read_csv("Documents/kaggle-playground/02/data/test.csv")
View(test)

train_cat <- train

## EDA
skim(train)

ggcorrplot(test)

cor(train)

M_train <- cor(train %>% select(!id))
corrplot(M_train, method = "circle", order = "hclust", addrect = 3)
