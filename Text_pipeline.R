## Standard Pipeline for text data in R
library(stringr)
library(tidyr)
source("~/Documents/GitHub/Personal-Projects/Functions for LilRhino/Testing word vecs.R")
dat = as.data.frame(read_csv("~/Documents/Github/CAMCOS/RedditData.csv"))[,2:3]

titles = dat$title %>%
  Pretreatment(FALSE, TRUE, T) %>%
  lapply(replace_emoji) %>%
  unlist() %>%
  lapply(gsub, pattern = "\\[[^\\]]+\\]", replace = "") %>%
  unlist()

stopwords = StopWordMaker(titles, 20)

Emb = load_glove_embeddings('/Users/travisbarton/Documents/GitHub/Personal-Projects/glove.6B/glove.6B.50d.txt', 50)
Emb2 = Embedding_Matrix(titles, 5L, stopwords, skip_gram = 10L, 50, 100)

vectors = mclapply(titles, Sentence_Vector2, Emb, stopwords, 50, mc.cores = detectCores())
vectors2 = mclapply(titles, Sentence_Vector2, Emb2, stopwords, 50, mc.cores = detectCores())

vec = cbind(matrix(unlist(vectors), ncol = 50, byrow = T), factor(dat$sub, labels = c(1:30)))
vec2 = cbind(matrix(unlist(vectors2), ncol = 50, byrow = T), factor(dat$sub, labels = c(1:30)))
library(e1071)

dat1 = Cross_val_maker(vec, .2)
dat2 = Cross_val_maker(vec2, .2)

fit2 = svm(V51~., data = dat1$Train, type = 'C-classification')
fit = svm(V51~., data = dat1$Train, type = 'C-classification')
sum(predict(fit2, dat2$Test[,-51]) == dat2$Test[,51])/nrow(dat2$Test)
sum(predict(fit, dat1$Test[,-51]) == dat1$Test[,51])/nrow(dat1$Test)

vectors <- read.csv("~/Documents/GitHub/CAMCOS/vectors.csv", header=FALSE)
vectors = vectors[-1,]
vectors = vectors[,-1]

vectors$V302 = factor(vectors$V302, labels = c(1:30))

dat = Cross_val_maker(vectors, .2)
fit = svm(V302~., data=dat$Train, type = 'C-classification')
preds = predict(fit, dat$Test)
sum(preds == dat$Test$V302)/length(preds)














