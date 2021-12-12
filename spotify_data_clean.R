df.60 <- read.csv("dataset-of-60s.csv")
df.60$Decade <- "1960"
df.70 <- read.csv("dataset-of-70s.csv")
df.70$Decade <- "1970"
df.80 <- read.csv("dataset-of-80s.csv")
df.80$Decade <- "1980"
df.90 <- read.csv("dataset-of-90s.csv")
df.90$Decade <- "1990"
df.00 <- read.csv("dataset-of-00s.csv")
df.00$Decade <- "2000"
df.10 <- read.csv("dataset-of-10s.csv")
df.10$Decade <- "2010"

#Combine df
spotify.df <- do.call("rbind", list(df.60, df.70, df.80, df.90, df.00, df.10))


#last 3 decades
last3.df <- do.call("rbind", list(df.00, df.10))

#Save file
write.csv(last3.df,"/Users/yixiewu/Desktop/MSIS 2022/MSIS-510/first_2_decades.csv", row.names = FALSE)

write.csv(last3.df,"/Users/yixiewu/Desktop/MSIS 2022/MSIS-510/second_2_decades.csv", row.names = FALSE)

write.csv(last3.df,"/Users/yixiewu/Desktop/MSIS 2022/MSIS-510/third_2_decades.csv", row.names = FALSE)

write.csv(last3.df,"/Users/yixiewu/Desktop/MSIS 2022/MSIS-510/first_3_decades.csv", row.names = FALSE)

write.csv(last3.df,"/Users/yixiewu/Desktop/MSIS 2022/MSIS-510/second_3_decades.csv", row.names = FALSE)

write.csv(last3.df,"/Users/yixiewu/Desktop/MSIS 2022/MSIS-510/spotify_decades.csv", row.names = FALSE)

