library(wordcloud)

library(tm)
spotify.df <- read.csv("dataset-of-60s.csv")
View(spotify.df)

spotify.df <- spotify.df[, 1]

docs <- Corpus(VectorSource(spotify.df))
inspect(docs)

docs <- tm_map(docs, removeNumbers) 
docs <- tm_map(docs, removePunctuation) 
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, tolower)
docs <- tm_map(docs, removeWords, stopwords("english"))

inspect(docs)


dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

set.seed(100)
wordcloud(words = df$word, freq = df$freq, min.freq = 1, max.words = 200,
          random.order = FALSE, rot.per = 0.35, colors = brewer.pal(8,"Dark2"))

confusionMatrix(default.ct.point.pred, factor(valid.df$target))