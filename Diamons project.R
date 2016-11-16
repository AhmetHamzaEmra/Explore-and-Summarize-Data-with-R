library(ggplot2)
di<-data(diamonds)
summary(diamonds)
length(diamonds)
str(diamonds)
levels(diamonds$color)
?diamonds
library(ggthemes) 
di<-diamonds
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


ggplot(aes(x=log(price)),data=di)+
  geom_histogram(aes(fill=cut))+
  facet_wrap(~color)+
  scale_fill_brewer(palette = 'Spectral')


ggplot(data=diamonds, aes(x=log(price))) + geom_histogram(aes(fill = cut)) +
  facet_wrap(~color) +
  scale_fill_brewer(palette="Spectral")



ggplot(aes(x=table,y=price),data=diamonds)+
  geom_point(aes(color=cut))+
  scale_color_brewer(type= 'qual')


di$volume<-di$x*di$y*di$z



# Create a scatterplot of diamond price vs.
# volume (x * y * z) and color the points by
# the clarity of diamonds. Use scale on the y-axis
# to take the log10 of price. You should also
# omit the top 1% of diamond volumes from the plot.

# Note: Volume is a very rough approximation of
# a diamond's actual volume.

# The plot should look something like this.
# http://i.imgur.com/excUpea.jpg

# Note: In the link, a color palette of type
# 'div' was used to color the scatterplot using
# scale_color_brewer(type = 'div')

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================



ggplot(aes(x=volume,y=(price)),data=subset(di, di$volume!=0))+
  geom_point(aes(color=clarity))+
  scale_color_brewer(type='div')+
  xlim(0,quantile(di$volume,0.99))+
  scale_y_log10()
