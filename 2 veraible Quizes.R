library(ggplot2)
library(dplyr)
library(ggthemes)
diamonds<-diamonds


# Q1
# In this problem set, you'll continue
# to explore the diamonds data set.

# Your first task is to create a
# scatterplot of price vs x.
# using the ggplot syntax.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================
ggplot(aes(x=price,y=x), data=diamonds)+
  geom_point()


# Q2
# Correlation

cor.test(diamonds$price,diamonds$x,method = 'pearson')
cor.test(diamonds$price,diamonds$y,method = 'pearson')
cor.test(diamonds$price,diamonds$z,method = 'pearson')


# Q3
# Create a simple scatter plot of price vs depth.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
#==================================================

ggplot(aes(x=price,y=depth), data=diamonds)+
  geom_point()


# Q4
# Change the code to make the transparency of the
# points to be 1/100 of what they are now and mark
# the x-axis every 2 units. See the instructor notes
# for two hints.

# This assignment is not graded and
# will be marked as correct when you submit.

# ALTER THE CODE BELOW THIS LINE
#============================================
ggplot(data = diamonds, aes(x = depth, y = price)) + 
  geom_point(alpha=1/100)+
  scale_x_continuous(breaks =seq(50,70,2))


# Q5
cor.test(diamonds$price,diamonds$depth,method = 'pearson')

# Q6
# Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ========================================
ggplot(aes(x = carat, y = price), 
       data = subset(diamonds, diamonds$price < quantile(diamonds$price, 0.99) &
                       diamonds$carat < quantile(diamonds$carat, 0.99))) + 
  geom_point()



# Create a scatterplot of price vs. volume (x * y * z).
# This is a very rough approximation for a diamond's volume.

# Create a new variable for volume in the diamonds data frame.
# This will be useful in a later exercise.

# Don't make any adjustments to the plot just yet.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# =================================================================

diamonds$volume<-diamonds$x*diamonds$y*diamonds$z
ggplot(aes(x=price,y=volume),data=diamonds)+geom_point()




#### Correlation on subset

pf_800 <-subset(diamonds, !(volume == 0 | volume >= 800))



cor.test(pf_800$price,pf_800$volume,method = 'pearson')







# Subset the data to exclude diamonds with a volume
# greater than or equal to 800. Also, exclude diamonds
# with a volume of 0. Adjust the transparency of the
# points and add a linear model to the plot. (See the
# Instructor Notes or look up the documentation of
# geom_smooth() for more details about smoothers.)

# We encourage you to think about this next question and
# to post your thoughts in the discussion section.

# Do you think this would be a useful model to estimate
# the price of diamonds? Why or why not?

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ========================================

ggplot(aes(x=price, y=volume), data=pf_800)+
  geom_point()+
  geom_smooth()



# Use the function dplyr package
# to create a new data frame containing
# info on diamonds by clarity.

# Name the data frame diamondsByClarity

# The data frame should contain the following
# variables in this order.

#       (1) mean_price
#       (2) median_price
#       (3) min_price
#       (4) max_price
#       (5) n

# where n is the number of diamonds in each
# level of clarity.

# This assignment WILL BE automatically
# graded!

# DO NOT ALTER THE NEXT THREE LINES OF CODE.
# ======================================================
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
data(diamonds)

# ENTER YOUR CODE BELOW THIS LINE
# ======================================================

library(dplyr)
diamondsByClarity <- 
  diamonds %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(as.numeric(price)),
            median_price = median(as.numeric(price)),
            min_price = min(as.numeric(price)),
            max_price = max(as.numeric(price)),
            n = n()) %>%
  arrange(clarity)








# We've created summary data frames with the mean price
# by clarity and color. You can run the code in R to
# verify what data is in the variables diamonds_mp_by_clarity
# and diamonds_mp_by_color.

# Your task is to write additional code to create two bar plots
# on one output image using the grid.arrange() function from the package
# gridExtra.

# This assignment is not graded and
# will be marked as correct when you submit.

# See the Instructor Notes for more info on bar charts
# and for a hint on this task.

# DO NOT DELETE THE LINES OF CODE BELOW
# ===================================================================


# ENTER YOUR CODE BELOW THIS LINE
# ===================================================================
diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

p1<-ggplot(data=diamonds_mp_by_clarity, aes(y=diamonds_by_clarity, x=mean_price ) )+ geom_line()

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))
p2<-ggplot(data=diamonds_mp_by_color, aes(y=diamonds_by_color, x=mean_price ) )+ geom_bar()

library(gridExtra)
grid.arrange(p1,p2,ncol=1)
p1 <- ggplot(aes(clarity, mean_price), data = diamonds_mp_by_clarity) +
  geom_bar(stat = 'identity')

p2 <- ggplot(aes(color, mean_price), data = diamonds_mp_by_color) +
  geom_bar(stat = 'identity')
grid.arrange(p1, p2)




# The Gapminder website contains over 500 data sets with information about
# the world's population. Your task is to continue the investigation you did at the
# end of Problem Set 3 or you can start fresh and choose a different
# data set from Gapminder.

# If you're feeling adventurous or want to try some data munging see if you can
# find a data set or scrape one from the web.

# In your investigation, examine pairs of variable and create 2-5 plots that make
# use of the techniques from Lesson 4.

# You can find a link to the Gapminder website in the Instructor Notes.

# Once you've completed your investigation, create a post in the discussions that includes:
#       1. the variable(s) you investigated, your observations, and any summary statistics
#       2. snippets of code that created the plots
#       3. links to the images of your plots

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# ====================================================================
getwd()
library(ggthemes)

install.packages("xlsx")
library(xlsx)
data<- read.xlsx("indicator_total_suicides_20100913.xlsx",1)
head(data)
p1<-ggplot(aes(x=Suicides..total.deaths,y=X2002),data=data)+geom_point(color='red')+ylim(c(0,1000))+geom_smooth(method = 'lm',color='red')
p2<-ggplot(aes(x=Suicides..total.deaths,y=X2004),data=data)+geom_point()+ylim(c(0,1000))
grid.arrange(p1,p2)


p5<-ggplot(aes(y=Suicides..total.deaths),data=data)+
  geom_point(aes(x=X2002),color='red')+
  geom_point(aes(x=X2004))+xlim(c(0,1000))+ theme_solarized(light = FALSE)+
  scale_color_solarized('red')

data$differences<-(data$X2004-data$X2002)
p3<-ggplot(aes(x=differences,y=Suicides..total.deaths),data=data)+geom_point(color='red')+xlim(c(-1000,1000))+ theme_solarized(light = FALSE)+
  scale_color_solarized('red')
grid.arrange(p3,p5,ncol=2)
