spotify.df <- read.csv("spotify_decade.csv", stringsAsFactors = TRUE)
names(spotify.df)

#########################################################################

#Scatterplots
#Energy vs Loudness
library(ggplot2)
hits.spotify.df <- spotify.df[spotify.df$target == 1 ,c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)]
spotify.df$target <- factor(spotify.df$target)
levels(spotify.df$target) <- c("Flop", "Hit")
ggplot(data = spotify.df,aes(x = loudness, y = energy, color=target)) +
  geom_point(alpha = 0.4 ) +
  ggtitle(" Energy vs Loudness")

#Acousticness vs Speechiness
hits.spotify.df <- spotify.df[spotify.df$target == 1 ,c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)]
spotify.df$target <- factor(spotify.df$target)
levels(spotify.df$target) <- c("Flop", "Hit")
ggplot(data = spotify.df,aes(x = acousticness, y = speechiness, color=target)) +
  geom_point(alpha = 0.4 ) +
  ggtitle(" Acousticness vs Speechiness")

#Danceability vs Valence
hits.spotify.df <- spotify.df[spotify.df$target == 1 ,c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)]
spotify.df$target <- factor(spotify.df$target)
levels(spotify.df$target) <- c("Flop", "Hit")
ggplot(data = spotify.df,aes(x = valence, y = danceability, color=target)) +
  geom_point(alpha = 0.4 ) +
  ggtitle(" Danceability vs Valence")

#########################################################################

#separate data into decades
sixties.df <- spotify.df[spotify.df$Decade == 1960,]
seventies.df <- spotify.df[spotify.df$Decade == 1970,]
eighties.df <- spotify.df[spotify.df$Decade == 1980,]
nineties.df <- spotify.df[spotify.df$Decade == 1990,]
twothousand.df <- spotify.df[spotify.df$Decade == 2000,]
twentyten.df <- spotify.df[spotify.df$Decade == 2010,]

## compute averages for each decade
hits.sixties.df <- sixties.df[sixties.df$target == 1, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]
str(hits.sixties.df)
average.sixties <- data.frame(mean(hits.sixties.df$danceability), mean(hits.sixties.df$energy), mean(hits.sixties.df$key),
                              mean(hits.sixties.df$loudness), mean(hits.sixties.df$mode), mean(hits.sixties.df$speechiness), mean(hits.sixties.df$acousticness), 
                              mean(hits.sixties.df$instrumentalness), mean(hits.sixties.df$liveness), mean(hits.sixties.df$valence), mean(hits.sixties.df$tempo),
                              mean(hits.sixties.df$duration_ms), mean(hits.sixties.df$time_signature), mean(hits.sixties.df$chorus_hit), mean(hits.sixties.df$sections), mean(hits.sixties.df$Decade),mean(hits.sixties.df$target))
colnames(average.sixties) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                               "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")

View(average.sixties)
#flop##
flops.sixties.df <- sixties.df[sixties.df$target == 0, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]
str(flops.sixties.df)
average.sixties.flop <- data.frame(mean(flops.sixties.df$danceability), mean(flops.sixties.df$energy), mean(flops.sixties.df$key),
                              mean(flops.sixties.df$loudness), mean(flops.sixties.df$mode), mean(flops.sixties.df$speechiness), mean(flops.sixties.df$acousticness), 
                              mean(flops.sixties.df$instrumentalness), mean(flops.sixties.df$liveness), mean(flops.sixties.df$valence), mean(flops.sixties.df$tempo),
                              mean(flops.sixties.df$duration_ms), mean(flops.sixties.df$time_signature), mean(flops.sixties.df$chorus_hit), mean(flops.sixties.df$sections), mean(flops.sixties.df$Decade),mean(flops.sixties.df$target))
colnames(average.sixties.flop) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                               "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")


###

hits.seventies.df <- seventies.df[seventies.df$target == 1, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18, 19,20) ]

average.seventies <- data.frame(mean(hits.seventies.df$danceability), mean(hits.seventies.df$energy), mean(hits.seventies.df$key), 
                                mean(hits.seventies.df$loudness), mean(hits.seventies.df$mode), mean(hits.seventies.df$speechiness), mean(hits.seventies.df$acousticness), 
                                mean(hits.seventies.df$instrumentalness), mean(hits.seventies.df$liveness), mean(hits.seventies.df$valence), mean(hits.seventies.df$tempo),
                                mean(hits.seventies.df$duration_ms), mean(hits.seventies.df$time_signature), mean(hits.seventies.df$chorus_hit), mean(hits.seventies.df$sections), mean(hits.seventies.df$Decade), mean(hits.seventies.df$target))
colnames(average.seventies) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                 "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")

#flops 70s#
flops.seventies.df <- seventies.df[seventies.df$target == 0, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18, 19,20) ]

average.seventies.flop <- data.frame(mean(flops.seventies.df$danceability), mean(flops.seventies.df$energy), mean(flops.seventies.df$key), 
                                mean(flops.seventies.df$loudness), mean(flops.seventies.df$mode), mean(flops.seventies.df$speechiness), mean(flops.seventies.df$acousticness), 
                                mean(flops.seventies.df$instrumentalness), mean(flops.seventies.df$liveness), mean(flops.seventies.df$valence), mean(flops.seventies.df$tempo),
                                mean(flops.seventies.df$duration_ms), mean(flops.seventies.df$time_signature), mean(flops.seventies.df$chorus_hit), mean(flops.seventies.df$sections), mean(flops.seventies.df$Decade),mean(flops.seventies.df$target))
colnames(average.seventies.flop) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                 "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")

###
hits.eighties.df <- eighties.df[eighties.df$target == 1, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.eighties <- data.frame(mean(hits.eighties.df$danceability), mean(hits.eighties.df$energy), mean(hits.eighties.df$key),
                               mean(hits.eighties.df$loudness), mean(hits.eighties.df$mode), mean(hits.eighties.df$speechiness), mean(hits.eighties.df$acousticness), 
                               mean(hits.eighties.df$instrumentalness), mean(hits.eighties.df$liveness), mean(hits.eighties.df$valence), mean(hits.eighties.df$tempo),
                               mean(hits.eighties.df$duration_ms), mean(hits.eighties.df$time_signature), mean(hits.eighties.df$chorus_hit), mean(hits.eighties.df$sections), mean(hits.eighties.df$Decade),mean(hits.eighties.df$target))

colnames(average.eighties) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")

#flops 80s#
flops.eighties.df <- eighties.df[eighties.df$target == 0, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.eighties.flop <- data.frame(mean(flops.eighties.df$danceability), mean(flops.eighties.df$energy), mean(flops.eighties.df$key),
                               mean(flops.eighties.df$loudness), mean(flops.eighties.df$mode), mean(flops.eighties.df$speechiness), mean(flops.eighties.df$acousticness), 
                               mean(flops.eighties.df$instrumentalness), mean(flops.eighties.df$liveness), mean(flops.eighties.df$valence), mean(flops.eighties.df$tempo),
                               mean(flops.eighties.df$duration_ms), mean(flops.eighties.df$time_signature), mean(flops.eighties.df$chorus_hit), mean(flops.eighties.df$sections), mean(flops.eighties.df$Decade),mean(flops.eighties.df$target))

colnames(average.eighties.flop) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")


###
hits.nineties.df <- nineties.df[nineties.df$target == 1, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.nineties <- data.frame(mean(hits.nineties.df$danceability), mean(hits.nineties.df$energy), mean(hits.nineties.df$key),
                               mean(hits.nineties.df$loudness), mean(hits.nineties.df$mode), mean(hits.nineties.df$speechiness), mean(hits.nineties.df$acousticness), 
                               mean(hits.nineties.df$instrumentalness), mean(hits.nineties.df$liveness), mean(hits.nineties.df$valence), mean(hits.nineties.df$tempo),
                               mean(hits.nineties.df$duration_ms), mean(hits.nineties.df$time_signature), mean(hits.nineties.df$chorus_hit), mean(hits.nineties.df$sections), mean(hits.nineties.df$Decade),mean(hits.nineties.df$target))
colnames(average.nineties) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")

#flops 90s#
flops.nineties.df <- nineties.df[nineties.df$target == 0, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.nineties.flop <- data.frame(mean(flops.nineties.df$danceability), mean(flops.nineties.df$energy), mean(flops.nineties.df$key),
                               mean(flops.nineties.df$loudness), mean(flops.nineties.df$mode), mean(flops.nineties.df$speechiness), mean(flops.nineties.df$acousticness), 
                               mean(flops.nineties.df$instrumentalness), mean(flops.nineties.df$liveness), mean(flops.nineties.df$valence), mean(flops.nineties.df$tempo),
                               mean(flops.nineties.df$duration_ms), mean(flops.nineties.df$time_signature), mean(flops.nineties.df$chorus_hit), mean(flops.nineties.df$sections), mean(flops.nineties.df$Decade),mean(flops.nineties.df$target))
colnames(average.nineties.flop) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")


###
hits.twothousand.df <- twothousand.df[twothousand.df$target == 1, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.twothousand <- data.frame(mean(hits.twothousand.df$danceability), mean(hits.twothousand.df$energy), mean(hits.twothousand.df$key),
                                  mean(hits.twothousand.df$loudness), mean(hits.twothousand.df$mode), mean(hits.twothousand.df$speechiness), mean(hits.twothousand.df$acousticness), 
                                  mean(hits.twothousand.df$instrumentalness), mean(hits.twothousand.df$liveness), mean(hits.twothousand.df$valence), mean(hits.twothousand.df$tempo),
                                  mean(hits.twothousand.df$duration_ms), mean(hits.twothousand.df$time_signature), mean(hits.twothousand.df$chorus_hit), mean(hits.twothousand.df$sections), mean(hits.twothousand.df$Decade), mean(hits.twothousand.df$target))
colnames(average.twothousand) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                   "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")

#flops 2000s#
flops.twothousand.df <- twothousand.df[twothousand.df$target == 0, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.twothousand.flop <- data.frame(mean(flops.twothousand.df$danceability), mean(flops.twothousand.df$energy), mean(flops.twothousand.df$key),
                                  mean(flops.twothousand.df$loudness), mean(flops.twothousand.df$mode), mean(flops.twothousand.df$speechiness), mean(flops.twothousand.df$acousticness), 
                                  mean(flops.twothousand.df$instrumentalness), mean(flops.twothousand.df$liveness), mean(flops.twothousand.df$valence), mean(flops.twothousand.df$tempo),
                                  mean(flops.twothousand.df$duration_ms), mean(flops.twothousand.df$time_signature), mean(flops.twothousand.df$chorus_hit), mean(flops.twothousand.df$sections), mean(flops.twothousand.df$Decade), mean(flops.twothousand.df$target))
colnames(average.twothousand.flop) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                   "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")


###
hits.twentyten.df <- twentyten.df[twentyten.df$target == 1, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.twentyten <- data.frame(mean(hits.twentyten.df$danceability), mean(hits.twentyten.df$energy), mean(hits.twentyten.df$key),
                                mean(hits.twentyten.df$loudness), mean(hits.twentyten.df$mode), mean(hits.twentyten.df$speechiness), mean(hits.twentyten.df$acousticness), 
                                mean(hits.twentyten.df$instrumentalness), mean(hits.twentyten.df$liveness), mean(hits.twentyten.df$valence), mean(hits.twentyten.df$tempo),
                                mean(hits.twentyten.df$duration_ms), mean(hits.twentyten.df$time_signature), mean(hits.twentyten.df$chorus_hit), mean(hits.twentyten.df$sections), mean(hits.twentyten.df$Decade),mean(hits.twentyten.df$target))

colnames(average.twentyten) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                 "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")
#flops 2010s#
flops.twentyten.df <- twentyten.df[twentyten.df$target == 0, c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) ]

average.twentyten.flop <- data.frame(mean(flops.twentyten.df$danceability), mean(flops.twentyten.df$energy), mean(flops.twentyten.df$key),
                                mean(flops.twentyten.df$loudness), mean(flops.twentyten.df$mode), mean(flops.twentyten.df$speechiness), mean(flops.twentyten.df$acousticness), 
                                mean(flops.twentyten.df$instrumentalness), mean(flops.twentyten.df$liveness), mean(flops.twentyten.df$valence), mean(flops.twentyten.df$tempo),
                                mean(flops.twentyten.df$duration_ms), mean(flops.twentyten.df$time_signature), mean(flops.twentyten.df$chorus_hit), mean(flops.twentyten.df$sections), mean(flops.twentyten.df$Decade), mean(flops.twentyten.df$target))

colnames(average.twentyten.flop) <- c("Danceability", "Energy","Key", "Loudness", "Mode", "Speechiness","Acousticness",
                                 "Instrumentalness","Liveness","Valence","Tempo","Duration","Time Signature","Chorus Hit", "Sections", "Decade", "Target")


###
average.values.df <- rbind(average.sixties, average.sixties.flop ,average.seventies,average.seventies.flop, average.eighties,average.eighties.flop , average.nineties,average.nineties.flop , average.twothousand,average.twothousand.flop , average.twentyten , average.twentyten.flop)
View(average.values.df)
df<- data.frame(average.values.df)
df$Target <- factor(df$Target)
levels(df$Target) <- c("Flop", "Hit")
names(df)


##########################################################################

#Single Line graphs

#Loudness  
Decade <- dfhits$Decade
Loudness <- dfhits$Loudness

ggplot() +
  geom_line(data = dfhits , mapping = aes(x=Decade, y=Loudness), color="red") +
  geom_point(data=dfhits, mapping = aes(x=Decade, y=Loudness), color="blue")+
  ggtitle("Average Loudness by the year for Hit Songs") 

#Danceability  
Decade <- dfhits$Decade
Danceability <- dfhits$Danceability

ggplot() +
  geom_line(data = dfhits , mapping = aes(x=Decade, y=Danceability), color="red") +
  geom_point(data=dfhits, mapping = aes(x=Decade, y=Danceability), color="blue")+
  ggtitle("Average Danceability by the year for Hit Songs") 

#Energy  
Decade <- dfhits$Decade
Energy <- dfhits$Energy

ggplot() +
  geom_line(data = dfhits , mapping = aes(x=Decade, y=Energy), color="red") +
  geom_point(data=dfhits, mapping = aes(x=Decade, y=Energy), color="blue")+
  ggtitle("Average Energy by the year for Hit Songs") 

#Acousticness  
Decade <- dfhits$Decade
Acousticness <- dfhits$Acousticness

ggplot() +
  geom_line(data = dfhits , mapping = aes(x=Decade, y=Acousticness), color="red") +
  geom_point(data=dfhits, mapping = aes(x=Decade, y=Acousticness), color="blue")+
  ggtitle("Average Acousticness by the year for Hit Songs") 


#Liveness  
Decade <- dfhits$Decade
Liveness <- dfhits$Liveness

ggplot() +
  geom_line(data = dfhits , mapping = aes(x=Decade, y=Liveness), color="red") +
  geom_point(data=dfhits, mapping = aes(x=Decade, y=Liveness), color="blue")+
  ggtitle("Average Liveness by the year for Hit Songs") 



###########################################################################
#Continuous Bar Graphs

df<- data.frame(average.values.df)
df$Target <- factor(df$Target)
levels(df$Target) <- c("Flop", "Hit")

#View(df)
#Liveness
library(scales)
df<- data.frame(df)
ggplot(df, aes(Decade, Liveness, fill = Target)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title="Comparison b/w Hit & Flop for Liveness")

#Valence
ggplot(df, aes(Decade, Valence, fill = Target)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title="Comparison b/w Hit & Flop for Valence")

#Speechiness
ggplot(df, aes(Decade, Speechiness, fill = Target)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title="Comparison b/w Hit & Flop for Speechiness")

#Instrumentalness
ggplot(df, aes(Decade, Instrumentalness, fill = Target)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title="Comparison b/w Hit & Flop for Instrumentalness")

##########################################################################

#Multiple Line graphs
library(ggplot2)
install.packages("babynames")
library(babynames) # provide the dataset: a dataframe called babynames
install.packages("dplyr")
library(dplyr)

# Keep only 3 names
don <- babynames %>% 
  filter(average.values.df %in% c("Flop", "Hit"))

# hit flop Plot

dfhits <- df[df$Target=="Hit",]
dfhits
dfflops<- df[df$Target=="Flop",]
dfflops
Decade <- dfhits$Decade
Average.Acousticness <- dfhits$Acousticness

Decadef <- dfflops$Decade
Average.Acousticnessf <- dfflops$Acousticness

ggplot() +
    geom_line(data = dfhits , mapping = aes(x=Decade, y=Average.Acousticness), color="blue") +
    geom_line(data = dfflops , mapping = aes(x=Decadef, y=Average.Acousticnessf), color="red")

#danceability
names(df)
Decade <- dfhits$Decade
Danceability <- dfhits$Danceability

Decadef <- dfflops$Decade
Danceabilityf <- dfflops$Danceability

ggplot() +
  geom_line(data = dfhits , mapping = aes(x=Decade, y=Danceability), color="blue") +
  geom_line(data = dfflops , mapping = aes(x=Decadef, y=Danceabilityf), color="red")

############################################################################
#Other Graphs

names(df)
View(df)
#Upside down continuous bar graph
perf <- ggplot(data = df, aes(x=Decade,y= Loudness, fill=Target)) + 
  geom_bar(position="dodge", stat = "identity") +
  scale_y_continuous( breaks=seq(0,0.6,0.05)) +
  ylab("Loudness") +
  ggtitle("Loudness vs Decade")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
perf

#Violen graph
ggplot(data = df, aes(Danceability, Loudness)) + 
  geom_violin(aes(fill=Target)) +
  facet_wrap(~Target) + 
  scale_fill_brewer(palette = "Dark2", direction = -1) +
  ggtitle("Survival Rate based on Pclass and Age") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

#Scatterplot for Loundness vs Danceability of every decade
ggplot(data = df,aes(x = Loudness, y = Danceability, color=Decade)) +
  geom_point(alpha = 1) 

#Combined Bar graph
ggplot(data = df , aes(Decade, fill=Target)) + 
geom_bar(aes(x = Decade, y = Loudness, alpha=0.9, ), stat = "summary") +
  scale_fill_brewer(palette = "Dark2", direction = -1) +
  ylab("Loudness") +
  ggtitle("Loudness vs Decade")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
  






