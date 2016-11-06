getwd()
list.files()
pf <- read.csv("pseudo_facebook.tsv", sep = "\t")
names(pf)
library(ggplot2)
library(ggthemes) 
theme_set(theme_minimal(12)) 
qplot(x=dob_day,data =pf) +
  scale_x_continuous(breaks =1:31)+
  facet_wrap(~dob_month, ncol=2)
# we are creating 12 hist. each of them shows how many people dob_day
# dark thema "theme_solarized(light = FALSE) + scale_colour_solarized("red")"
names(pf)
ggplot(aes(x=friend_count), data=pf)+
  geom_histogram(binwidth = 25)+
  scale_x_continuous(limits = c(0,1000),breaks = seq(0,1000,50))
  
ggplot(aes(x = friend_count), data = subset(pf, !is.na(gender))) + 
  geom_histogram(color=I('black'),fill=I("#099DD9")) + 
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) + 
  facet_wrap(~gender)+
  theme_solarized(light = FALSE)+
  scale_color_solarized('red')
table(pf$gender)
by(pf$friend_count,pf$gender,summary)

qplot(x=tenure,data=pf,binwidth=30, color=I('black'), fill=I('#099DD9'))


ggplot(aes(x = tenure/365), data = pf) + 
  geom_histogram(binwidth = .25, color = 'black', fill = '#F79420')

ggplot(aes(x=tenure/365),data=pf)+
  geom_histogram(binwidth = .25,color='black',fill="#5760AB")+
  scale_x_continuous(breaks = seq(1,7,1),limits=c(0,7))+
  xlab('Number of years using Facebook')+
  ylab('Number of users in sample')



ggplot(aes(x=age) , data=pf) +
  geom_histogram(binwidth = 1,fill='#5760AB')+
  scale_x_continuous(breaks = seq(0,133,5))+
  theme_solarized(light = FALSE)+
  scale_color_solarized('red')


ggplot(aes(x=friend_count),data=pf)+
  geom_histogram()
library(gridExtra)
summary(pf$friend_count)
summary(log10(pf$friend_count+1))
summary()




p1=ggplot(aes(x=friend_count),data=pf)+
  geom_histogram()
p2=ggplot(aes(x=friend_count),data=pf)+
  geom_histogram()+
  scale_x_log10()+
  xlab('log10')
p3=ggplot(aes(x=friend_count),data=pf)+
  geom_histogram()+
  scale_x_sqrt()+
  xlab('sqrt')
grid.arrange(p1,p2,p3)



ggplot(aes(x = friend_count, y = ..count../sum(..count..)),
       data = subset(pf, !is.na(gender))) + 
  geom_freqpoly(aes(color = gender), binwidth=10) + 
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) + 
  xlab('Friend Count') + 
  ylab('Percentage of users with that friend count')+
  theme_solarized(light = FALSE)+
  scale_color_solarized('red')


ggplot(aes(x = www_likes), data = subset(pf, !is.na(gender))) + 
  geom_freqpoly(aes(color = gender)) + 
  scale_x_continuous()+
  scale_x_log10()+
  theme_solarized(light = FALSE  )+
  scale_color_solarized('red')
  


ggplot(aes(x=gender, y=friend_count),data=subset(pf,!is.na(gender)))+
  geom_boxplot()+
  coord_cartesian(ylim = c(0,250))




ggplot(aes(x=gender, y=friendships_initiated),data=subset(pf,!is.na(gender)))+
  geom_boxplot()+
  coord_cartesian(ylim = c(0,150))


pf$mobile_check_in <- NA. 
pf$mobile_check_in <- ifelse(pf$mobile_likes >0 , 1 , 0)
pf$mobile_check_in <- factor(pf$mobile_check_in )
summary(pf$mobile_check_in)

sum(pf$mobile_check_in==1)/length(pf$mobile_check_in)

