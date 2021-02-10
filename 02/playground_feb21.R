library(dplyr) 
library(data.table)

train <- fread("02/data/train.csv", data.table = F) 
head(train)

test <- fread("02/data/test.csv", data.table = F) 
head(test)

skim(train)

M_train <- cor(train %>% select(!id))
corrplot(M_train, method = "circle", order = "hclust", addrect = 3)
