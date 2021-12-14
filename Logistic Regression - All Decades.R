spotify.df <- read.csv("spotify_decade.csv", stringsAsFactors = TRUE)
str(spotify.df)

#factor categorical variables and relevel as needed
spotify.df$mode <- factor(spotify.df$mode)
levels(spotify.df$mode)

levels(spotify.df$mode) <- c("Minor", "Major") #renaming vector

spotify.df$key <- factor(spotify.df$key)
levels(spotify.df$key)

spotify.df$time_signature <- factor(spotify.df$time_signature)
levels(spotify.df$time_signature)
spotify.df$time_signature <- relevel(spotify.df$time_signature, ref = "4") 


spotify.df$Decade <- factor(spotify.df$Decade)
levels(spotify.df$Decade)

spotify.df$Decade <- relevel(spotify.df$Decade, ref = "2010") 


#drop text columns and variable for key 
selected.index <- c(4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
selected.df <- spotify.df[,selected.index]
selected.df
set.seed(100)
train.index <- sample (1:nrow(selected.df), nrow(selected.df) *.7)
train.df <- selected.df[train.index, ]
valid.df <- selected.df[-train.index,]

logit.reg <- glm(target ~., data = train.df, family = "binomial")
summary(logit.reg)

#fit on validation
logit.reg.pred <- predict(logit.reg, valid.df, type = "response")
logit.reg.pred

library(pROC)

#create and plot roc curve
r <- roc(valid.df$target, logit.reg.pred)

plot.roc(r)

#find the best threshold to use for cutoff

coords(r, x= "best")

#input best cutoff value
pred <- ifelse(logit.reg.pred > 0.5035485  , 1, 0)

library(caret)
confusionMatrix (factor(pred), factor(valid.df$target), positive = "1")