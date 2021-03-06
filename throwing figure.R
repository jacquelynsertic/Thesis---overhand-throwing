# Importing overhand throwing score thesis data from excel

library('readxl')
library('ggplot2')
library('tidyverse')
library('dplyr')
library('dslabs')
throwing <- read_excel('C:\\Users\\jacqu\\Documents\\las vegas\\unlv\\thesis\\Data Collection\\Data Analysis\\Data Analysis.xlsx', sheet = 'line')


# dotplot
  
throwing %>% ggplot(aes(x = block, y = score, order = factor(Group))) + #creates the ggplot
  geom_boxplot(alpha = 0, width = .8) + #adjusts spaces between boxplots
  geom_dotplot( #creates dotplot
    binaxis = "y", #puts the dots along the y-axis
    stackdir = "center",#centers the dots
    stackratio = 1, #stacks the dots
    binpositions = "all", #shows dots of the groups
    position = position_dodge(width = .785), #adjustst the spacing of the dots between the groups
    dotsize = .65, #size of the dots
    aes(fill = Group)) + #allows the groups to be represented by the dots
  scale_fill_manual(values = c("black", "grey")) + #colors the dots with specified colors
  scale_y_continuous(name="Throwing Scores", #names the y-axis
    breaks = c(0:8), #adds tick marks for each value
    limit = c(0,8)) +  #set the min and max values for y-axis
  stat_summary(fun = mean,  #creates a dot at the mean
    aes(group = Group), #creates a mean value for each group
    size = .5, #changes mean dot size,
    position = position_dodge(width = .785), #moves the mean dot away from the midline
    color = "black", #changes the shape outline color
    fill = "white", #changes the shape fill color
    shape = 21, #shape creates a circle
    stroke = 1.5) + #stroke controls the boarder thickness
  geom_point(aes(size = "Group Mean"), #creates new dots w/ legend 
    alpha = 0, #transparency
    fill = "white", #fills dots with white
    shape = 21, #changes the shape to diamond
    stroke = 1.5) + #boarder thickness
  guides(fill = guide_legend(order = 1), size = guide_legend(order = 2)) + 
  guides(size = guide_legend(override.aes = list(alpha = 1))) + #overrides legend transparency
  theme_bw() + 
  theme(axis.title = element_text()) + 
  theme(legend.title=element_blank()) + #removes legend titles
  theme(axis.title.x = element_blank()) + #removes x-axis label
  theme(text = element_text(size=20)) #changes the size of the text 

