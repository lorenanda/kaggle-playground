library(dplyr) 
library(tidyverse)
library(readr)
library(skimr)
library(DataExplorer)
library(ggcorrplot)
library(corrplot)

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

train_cont_corr <- cor(train_cont)
corrplot(train_cont_corr)
heatmap(x = train_cont_corr, symm = TRUE)

##
y_train <- train %>% pull(target)
