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

train_cat <- train %>% select(2:11)
View(train_cat)

train_cont <- train %>% select(12:25)
View(train_cont)

## EDA
# distribution of the train features
skim(train)

ggcorrplot(train_cont)

cor(train)

M_train <- cor(train %>% select(!id))
corrplot(M_train, method = "circle", order = "hclust", addrect = 3)

##
y_train <- train %>% pull(target)
