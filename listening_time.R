data = read.csv("train.csv")

str(data)

### removing ID

data = data[,-1]

### Defining categorical variables

data$Podcast_Name = as.factor(data$Podcast_Name)

#### whatt to do with episode

data$Episode_Sentiment = as.factor(data$Episode_Sentiment)

data$Genre = as.factor(data$Genre)

data$Publication_Day = as.factor(data$Publication_Day)

data$Publication_Time = as.factor(data$Publication_Time)

data$Episode_Sentiment = as.factor(data$Episode_Sentiment)

### Missing values

for(i in 1:ncol(data)){
  print(sum(is.na(data[,i])))
}

### Checking correlations

data_num = data[sapply(data, is.numeric)]

library(corrplot)

corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45)


cor_matrix = cor(na.omit(data_num))
