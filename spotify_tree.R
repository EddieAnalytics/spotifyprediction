#The first part of the code till ocnfusion matrix plots the decision tree and then computes the variable importance and confusion matrix. 
spotify.df <- read.csv("spotify_decade.csv", stringsAsFactors = TRUE)

set.seed(100)

#select the relevant columns
selected.var <-c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
selected.df <- spotify.df[, selected.var]

#setting the variables and training, validation data
train.index <- sample(1:nrow(selected.df), nrow(selected.df)*0.7)
train.df <- selected.df[train.index, ]
valid.df <- selected.df[-train.index, ]

library(rpart)
library(rpart.plot)

default.ct <- rpart(target ~., data = train.df,  method = "class")
valid.ct <- rpart(target ~., data = train.df,  method = "class")

#plotting for overall, and each decade
rpart.plot(default.ct, extra = 1)

default.ct$variable.importance

#see how the data performs in the validation set
#full tree
default.ct.point.pred <- predict(default.ct, valid.df, type = "class")

full.ct <- rpart(target ~ ., data = train.df, method = "class", control = rpart.control(cp = -1, minsplit = 1))

library(caret)
confusionMatrix(default.ct.point.pred, factor(valid.df$target))

