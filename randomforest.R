library(ggplot2)
library(cowplot)
library(randomForest)

data<-read.csv("spotify_decade.csv")
str(data)
data.ready<-data[,-c(1,2,3)]
str(data.ready)
#data$key<-as.factor(data$key)
#data$target<-as.factor(data$target)
#data$mode<-as.factor(data$mode)
#data$Decade<-as.factor(data$Decade)
#data$time_signature<-as.factor(data$time_signature)
factor_cols<-c("key","target","mode","Decade","time_signature")
data.ready[factor_cols]<-lapply(data.ready[factor_cols],as.factor)


set.seed(100)
predictors<-data.ready[,-16]
str(predictors)
target<-data.ready$target

model<-randomForest(predictors,target,importance=TRUE)
model
#wanting to try a specific song?
New<-data.frame(danceability=.417,energy=.62,as.factor(key="5"),loudness=-7.73,
                mode="1",speechiness=0.0403,acousticness=0.49,instrumentalness=0,
                liveness=0.0779,valence=0.845,tempo=186,duration_ms=173533,
                time_signature="3",chorus_hit=32.9,sections=9,Decade="1960")
str(New)
factor_cols<-c("key","mode","Decade","time_signature")
New[factor_cols]<-lapply(New[factor_cols],as.factor)
New$duration_ms<-as.integer(New$duration_ms)
New$sections<-as.integer(New$sections)
predict(model,new)
#if having the different type problem bind and then delete
test<-rbind(predictors[1,], New)
test<-test[-1,]
test
predict(model,test)
#--------------------- HERE WE GO ------------------
library(ggplot2)
library(cowplot)
library(randomForest)

data<-read.csv("spotify_decade.csv")
str(data)
data.ready<-data[,-c(1,2,3)]
str(data.ready)
factor_cols<-c("key","target","mode","Decade","time_signature")
data.ready[factor_cols]<-lapply(data.ready[factor_cols],as.factor)
predictors<-data.ready[,-16]
str(predictors)
target<-data.ready$target
set.seed(100)
model<-randomForest(predictorsf,target.900010,ntree = 1000)
model
#Lets look for the optimal number of trees looking at the sequence of Out-of-Bag errors
oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Flop", "Hit"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"0"], 
          model$err.rate[,"1"]))

ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))
#RESULT-Lets consider 500 trees
#Lets look for the optimal number of variables to consider at each split
oob.values <- vector(length=10)

for(i in 1:10) {
  set.seed(100)
  temp.model <- randomForest(predictorsf,target.900010, mtry=i, ntree=500,importance=TRUE)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values
#since 4 is the one that has the less OOB error we will consider mtry to be =7
set.seed(100)
model<-randomForest(predictorsf,target.900010,ntree = 500,mtry=2)
model
#lets check what happens only with latest data
predictors.00<-predictors[predictors$Decade==2000,]
predictors.10<-predictors[predictors$Decade==2010,]
predictors.90<-predictors[predictors$Decade==1990,]
predictors.8901<-predictors[predictors$Decade==1980|predictors$Decade==1990|
                              predictors$Decade==2000|predictors$Decade==2010,]
predictors.900010<-predictors[predictors$Decade==1990|
                              predictors$Decade==2000|predictors$Decade==2010,]

target.00<-data.ready[data.ready$Decade==2000,]$target
target.10<-data.ready[data.ready$Decade==2010,]$target
target.90<-data.ready[data.ready$Decade==1990,]$target
target.8901<-data.ready[data.ready$Decade==1980|data.ready$Decade==1990|
                          data.ready$Decade==2000|data.ready$Decade==2010,]$target
  

target.900010<-data.ready[data.ready$Decade==1990|
                            data.ready$Decade==2000|data.ready$Decade==2010,]$target
predictors.0010<-rbind(predictors.00,predictors.10)
predictors.900010<-rbind(predictors.90,predictors.00,predictors.10)

#lets play with diferent data. From the latest adding past ones
#only 2010
set.seed(100)
model<-randomForest(predictors.10,target.10,ntree = 500, mtry=4)
model
#2010&2000
set.seed(100)
model<-randomForest(predictors.0010,target.0010,ntree = 500, mtry=4)
model
#1990&2000&2010
set.seed(100)
model<-randomForest(predictors.900010,target.900010,ntree = 500, mtry=4)
model
#1980&1990&2000&2010
set.seed(100)
model<-randomForest(predictors.8901,target.8901,ntree = 500, mtry=4)
model
##----Exploring with chosen dataset
set.seed(100)
model<-randomForest(predictors.900010,target.900010,ntree = 1000, mtry=4)
model
oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Flop", "Hit"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"0"], 
          model$err.rate[,"1"]))

ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))
oob.values <- vector(length=10)

for(i in 1:10) {
  set.seed(100)
  temp.model <- randomForest(predictors.900010,target.900010, mtry=i, ntree=500)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values
a<-data.frame(oob.values)
colnames(a)<-"OOB errors"
a
#This suggests to use 4 variables which was by default but we prove to be the optimal
set.seed(100)
model <- randomForest(predictorsf,target.900010, mtry=3, ntree=500, importance = TRUE)
model

varImpPlot(model,type=1,main='Permutation Predictors Importance')
#Errasing Decade column and running everything again
predictorsf<-predictors.900010[,-16]
str(predictorsf)
predictors.10<-predictors.10[,-16]
predictors.0010<-predictors.0010[,-16]
predictors.8901<-predictors.8901[,-16]
predictors<-predictors[,-16]
