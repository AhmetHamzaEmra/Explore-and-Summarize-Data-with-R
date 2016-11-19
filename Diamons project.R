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





# Many interesting variables are derived from two or more others.
# For example, we might wonder how much of a person's network on
# a service like Facebook the user actively initiated. Two users
# with the same degree (or number of friends) might be very
# different if one initiated most of those connections on the
# service, while the other initiated very few. So it could be
# useful to consider this proportion of existing friendships that
# the user initiated. This might be a good predictor of how active
# a user is compared with their peers, or other traits, such as
# personality (i.e., is this person an extrovert?).

# Your task is to create a new variable called 'prop_initiated'
# in the Pseudo-Facebook data set. The variable should contain
# the proportion of friendships that the user initiated.

# This programming assignment WILL BE automatically graded.

# DO NOT DELETE THIS NEXT LINE OF CODE
# ========================================================================

# ENTER YOUR CODE BELOW THIS LINE
# ========================================================================

pf<- read.csv('facebook.tsv', sep = '\t')
str(pf)

pf$prop_initiated <- with(pf, 1-((friend_count-friendships_initiated)/friend_count))
pf$prop_initiated <- ifelse(is.na(pf$prop_initiated), 0, pf$prop_initiated)
summary(pf$prop_initiated)

pf$year_joined<- floor(2014-pf$tenure/365)
pf$year_joined.bucket<-cut(pf$year_joined,
                           c(2004,2009,2011,2012,2014))



ggplot(aes(x=tenure,y=prop_initiated),data=subset(pf,!is.na(pf$tenure)))+
  geom_line(aes(color=year_joined.bucket),stat='summary',fun.y=median)


# Smooth the last plot you created of
# of prop_initiated vs tenure colored by
# year_joined.bucket. You can bin together ranges
# of tenure or add a smoother to the plot.

# There won't be a solution image for this exercise.
# You will answer some questions about your plot in
# the next two exercises.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ====================================================

ggplot(aes(x=tenure,y=prop_initiated),data=subset(pf,!is.na(pf$tenure)))+
  geom_line(aes(color=year_joined.bucket),stat='summary',fun.y=median)+
  geom_smooth()




# Create a scatter plot of the price/carat ratio
# of diamonds. The variable x should be
# assigned to cut. The points should be colored
# by diamond color, and the plot should be
# faceted by clarity.

# The plot should look something like this.
# http://i.imgur.com/YzbWkHT.jpg.

# Note: In the link, a color palette of type
# 'div' was used to color the histogram using
# scale_color_brewer(type = 'div')

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================


ggplot(aes(x=cut,y=price/carat),data=di)+
  geom_jitter(aes(color=color))+
  scale_color_brewer(type='div')+
  facet_wrap(~clarity)





# The Gapminder website contains over 500 data sets with information about
# the world's population. Your task is to continue the investigation you did at the
# end of Problem Set 4 or you can start fresh and choose a different
# data set from Gapminder.

# If you're feeling adventurous or want to try some data munging see if you can
# find a data set or scrape one from the web.

# In your investigation, examine 3 or more variables and create 2-5 plots that make
# use of the techniques from Lesson 5.

# You can find a link to the Gapminder website in the Instructor Notes.

# Once you've completed your investigation, create a post in the discussions that includes:
#       1. the variable(s) you investigated, your observations, and any summary statistics
#       2. snippets of code that created the plots
#       3. links to the images of your plots

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# ============================================================================================
