# Importing thesis data from excel (by absolute throw)

library('readxl')
library('ggplot2')
library('tidyverse')
library('dplyr')
library('dslabs')
throwing <- read_excel('C:\\Users\\jacqu\\Documents\\las vegas\\unlv\\thesis\\Data Collection\\Data Analysis\\Data Analysis.xlsx', sheet = 'line')


# Boxplot with dotplot
  
throwing %>% ggplot(aes(x = block, y = score)) + 
  geom_boxplot(alpha = 0, width = 0.5, position = position_dodge(width = 0.5)) +
  stat_boxplot(geom = "errorbar", position = position_dodge(width = 0.5), width = 0.2) + 
  geom_dotplot(
    binaxis = "y", 
    stackdir = "center", 
    stackratio = 1, 
    binpositions = "all",
    position = position_dodge(width = .45),
    dotsize = .75,
    aes(fill = Group)) + 
  scale_color_manual(values = c("black","grey")) + 
  scale_fill_manual(values = c("black", "grey")) +
  scale_y_continuous(name="Mean Score / Participant", breaks = c(0:8), limit = c(0,8)) +
  stat_summary(fun = mean,
               aes(group = Group),
               position = position_dodge(width =1),
               color = "green", 
               size = 0.75) +
  xlab("Blocks") +
  ggtitle("Throwing Scores")


## Boxplot with points

throwing %>% ggplot(aes(x = block, y = score)) + 
  geom_point(aes(color = Group), size = 3) +
  scale_color_manual(values = c("black","dark grey")) + 
  geom_boxplot(alpha = 0) +
  scale_y_continuous(name="Mean score per participant", breaks = c(0:8), limit = c(0,8)) +
  stat_summary(fun = mean,
               aes(group = Group),
               position = position_dodge(width =1),
               color = "green", 
               size = 0.6) +
  xlab("Blocks") +
  ggtitle("Throwing Scores")


# Importing original thesis data from excel (by block)

blocks <- read_excel('C:\\Users\\jacqu\\Documents\\las vegas\\unlv\\thesis\\Data Collection\\Data Analysis\\Data Analysis.xlsx', sheet = 'R')

optimal <- blocks %>% filter(group == "OPTIMAL") #OPTIMAL group
control <- blocks %>% filter(group == "Control") #Control group

ob1 <- mean(optimal$Block1) #mean of optimal block 1
ob2 <- mean(optimal$Block2) #mean of optimal block 2
ob3 <- mean(optimal$Block3) #mean of optimal block 3
ob4 <- mean(optimal$Block4) #mean of optimal block 4
ob5 <- mean(optimal$Block5) #mean of optimal block 5

cb1 <- mean(control$Block1) #mean of control block 1
cb2 <- mean(control$Block2) #mean of control block 2
cb3 <- mean(control$Block3) #mean of control block 3
cb4 <- mean(control$Block4) #mean of control block 4
cb5 <- mean(control$Block5) #mean of control block 5



