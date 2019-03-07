## Attempting our own alg
library(readr)
library(readxl)
library(LilRhino)
## Amazon data 
Amazon_Data <- read_csv("Documents/GitHub/CAMCOS/Amazon_Data.csv")
test_amazon_data <- read_excel("Downloads/test_amazon_data.xlsx", 
                               col_names = FALSE)

temp = labelActively(data = Amazon_Data[,-51], 
              sentences = test_amazon_data$X__3,
              label.list = unique(test_amazon_data$X__1))


table(temp[[2]]@map, Amazon_Data$Label)
ARI(temp[[2]]@map, Amazon_Data$Label)
Percent(temp[[2]]@map, Amazon_Data$Label)
# 75% accuracy
# .4863 ARI
### Not great


### Easy Normal Data
Easy_Normal = read_csv("Easy_Normal.csv")
Easy_Normal = cbind(Easy_Normal, c(rep(1, 1000), rep(2, 1000), rep(3, 1000), rep(4, 1000), rep(5, 1000)))
colnames(Easy_Normal) = c("V1", "V2", "Label")

temp = labelActively(data = Easy_Normal[,-3], 
                     sentences = as.character(Easy_Normal$Label),
                     label.list = as.character(c(1, 2, 3, 4, 5)))

table(temp[[2]]@map, Easy_Normal$Label)
ARI(temp[[2]]@map, Easy_Normal$Label)
#Percent(temp[[2]]@map, Easy_Normal$Label) Label Switching... ignore that.
# ARI of 98.36! Well done. Lets look at a plot:
plot(Easy_Normal[,-3], col = temp[[2]]@map)
## Thats bad... Very bad... Why do we have these outliers??



####### WHEN YOU PICK UP, DO THE REST OF THE DATA!
