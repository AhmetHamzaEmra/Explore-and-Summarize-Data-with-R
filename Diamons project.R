library(ggplot2)
data(diamonds)
summary(diamonds)
length(diamonds)
str(diamonds)
levels(diamonds$color)
?diamonds
library(ggthemes) 

ggplot(aes(x=price/carat),data=diamonds)+
  geom_histogram(binwidth = 10)+
    scale_x_continuous(limits=c(0,15000))+
  facet_wrap(~cut)+
  theme_solarized(light = FALSE)+
  scale_color_solarized('red')
  
by(diamonds$price, diamonds$cut,summary)

ggplot(aes(x=price),data=subset(diamonds, !is.na(diamonds$price)))+
  geom_boxplot()
# Investigate the price per carat of diamonds across
# the different colors of diamonds using boxplots.
