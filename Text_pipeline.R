## Standard Pipeline for text data in R
library(stringr)
library(tidyr)
source("Documents/GitHub/Personal-Projects/Functions for LilRhino/Testing word vecs.R")
dat = as.data.frame(read_csv("Desktop/CAMCOS/RedditData.csv"))
titles = dat$title
titles = titles %>%
  Pretreatment(FALSE, FALSE) %>%
  lapply(replace_emoji) %>%
  unlist() %>%
  lapply(gsub, pattern = "\\[[^\\]]+\\]", replace = "") %>%
  unlist()

stopwords = StopWordMaker(titles, 20)

Emb = load_glove_embeddings('/Users/travisbarton/Documents/GitHub/Personal-Projects/glove.6B/glove.6B.50d.txt', 50)
Emb2 = t(Embedding_Matrix(titles, 5L, stopwords, skip_gram = 10L, 50, 50))





  
  
