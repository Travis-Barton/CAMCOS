## Standard Pipeline for text data in R
library(stringr)
library(tidyr)
source("Documents/GitHub/Personal-Projects/Functions for LilRhino/Testing word vecs.R")
dat = as.data.frame(read_csv("Documents/Github/CAMCOS/RedditData.csv"))[,2:3]

titles = dat$title %>%
  Pretreatment(FALSE, TRUE) %>%
  lapply(replace_emoji) %>%
  unlist() %>%
  lapply(gsub, pattern = "\\[[^\\]]+\\]", replace = "") %>%
  unlist()

stopwords = StopWordMaker(titles, 20)

Emb = load_glove_embeddings('/Users/travisbarton/Documents/GitHub/Personal-Projects/glove.6B/glove.6B.50d.txt', 50)
Emb2 = t(Embedding_Matrix(titles, 5L, stopwords, skip_gram = 10L, 50, 500))

vectors = lapply(titles, Sentence_Vector, Emb, stopwords)
vectors2 = lapply(titles, Sentence_Vector, Emb2, stopwords)

vec = cbind(matrix(unlist(vectors), ncol = 50, byrow = T), factor(dat$sub, labels = c(1:30)))
vec2 = cbind(matrix(unlist(vectors2), ncol = 50, byrow = T), factor(dat$sub, labels = c(1:30)))
library(e1071)

dat1 = Cross_val_maker(vec, .2)
dat2 = Cross_val_maker(vec2, .2)

fit2 = svm(V51~., data = dat2$Train, type = 'C-classification')
fit = svm(V51~., data = dat1$Train, type = 'C-classification')
sum(predict(fit1, dat1$Test[,-51]) == dat1$Test[,51])/nrow(vec)














