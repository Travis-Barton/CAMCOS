library(ggplot2)

data.frame(x = seq(1, 10, 1), y = exp(seq(1, 10, 1)), cc = c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2), z = rep(5000, 10), k = exp(seq(1, 20, 2))) %>%
  ggplot(data = ., aes(x = x, y =k)) +geom_line(aes(x = x, y = y, color = "blue")) + 
  geom_line(aes(x = x, y = z, color = "red")) + 
  geom_line(aes(x = x, y = k, color = "green")) +
  scale_color_manual(labels = c("I use GGplot", "I'm a JMP man","I use matplotlib"), values = c("blue", "red", "green")) + 
  xlab("How Baysean are you?") + ylab("How hot do ladies find the phrase: ")

data.frame(x = rep(1, 10), y = exp(seq(1, 10, 1)), cc = c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2), z = rep(2, 10), k = exp(seq(1, 20, 2))) %>%
  ggplot(data = ., aes(x = x, y = y)) + 
  geom_bar(y = z)



data.frame(x = c(1, 2, 3, 3, 3, 3)) %>%
  ggplot(data = ., aes(x)) +
  geom_bar(aes(fill = "#FF6666")) +
  scale_y_continuous(breaks = c(1, 4), labels = c("No", "Yes!")) +
  scale_x_continuous(breaks = c(1, 2, 3), labels = c("Howd you get \nmy number?", "Travis stop", "...you?")) +
  ggtitle("Guess who learned how to make a bar chart??") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  ylab("") + xlab("") + guides(fill = F)


data.frame(x = c(1, 1, 1, 1, 2, 2, 2, 2, 2, 2,3, 3, 3, 3, 3, 3, 3)) %>%
  ggplot(data = ., aes(x)) +
  geom_bar(aes(fill = "#FF6666")) +
  scale_y_continuous(breaks = c(1, 4), labels = c("No", "Yes!")) +
  scale_x_continuous(breaks = c(1, 2, 3), 
                     labels = c("Really good", 
                                "Really Really good", 
                                "Really Really Really good")) +
  ggtitle("How Do I feel when Lindsey says I'm cute??") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  ylab("") + xlab("") + guides(fill = F)

