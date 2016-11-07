library(ggplot2)
library(ggthemes)



pf<-read.csv('pseudo_facebook.tsv', sep='\t')



#iki varaible ile kullanilan graphlar 
ggplot(aes(x=age, y=friend_count),data=pf)+
  geom_point(color='red', alpha=1/20,position = position_jitter(h=0))


ggplot(aes(x=age, y=friend_count),data=pf)+
  geom_point(alpha=1/20,color='red')+xlim(13,90)+
  coord_trans(y='sqrt')+
  theme_solarized(light = FALSE)+
  scale_color_solarized('red')


ggplot(aes(x=age,y=friendships_initiated),data=pf)+
  geom_point(alpha=1/10, position = position_jitter(h=0))+
  coord_trans(y='sqrt')

########################################
library(dplyr)

#group by function 

age_group<-group_by(pf,age)
pf.fc_by_age<-summarise(age_group,friend_count_mean=mean(friend_count),friend_count_median=median(friend_count),n=n())
pf.fc_by_age<-arrange(pf.fc_by_age,age)

head(pf.fc_by_age)


ggplot(aes(x=age,y=friend_count_mean), data=pf.fc_by_age)+
  geom_line()

########################################
#overlaying summaries with raw data


ggplot(aes(x=age, y=friend_count),data=pf)+
  geom_point(alpha=1/20,color='orange')+xlim(13,90)+
  coord_trans(y='sqrt')+
  coord_trans(y='sqrt')+
  geom_line(stat='summary', fun.y=mean)+
  geom_line(stat='summary',
            fun.y=quantile , fun.args=list(probs=0.1),
            linetype=2 ,color='blue')+
  geom_line(stat='summary',
            fun.y=quantile , fun.args=list(probs=0.9),
            linetype=2 ,color='blue')+
  geom_line(stat='summary',
            fun.y=quantile , fun.args=list(probs=0.5),
            linetype=2 ,color='blue')


##############################################

ggplot(aes(x=age, y=friend_count),data=pf)+
  geom_point(alpha=1/20,color='orange')+
  coord_cartesian(xlim=c(13,70),ylim=c(0,1000))+
  geom_line(stat='summary', fun.y=mean)+
  geom_line(stat='summary',
            fun.y=quantile , fun.args=list(probs=0.1),
            linetype=2 ,color='blue')+
  geom_line(stat='summary',
            fun.y=quantile , fun.args=list(probs=0.9),
            linetype=2 ,color='blue')+
  geom_line(stat='summary',
            fun.y=quantile , fun.args=list(probs=0.5),
            linetype=2 ,color='blue')

