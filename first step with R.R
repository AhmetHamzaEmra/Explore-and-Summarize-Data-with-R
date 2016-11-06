getwd()
reddit <- read.csv('reddit.csv')


table(reddit$employment.status)
summary(reddit)

str(reddit)
reddit$age.range<-ordered(reddit$age.range,levels= c("Under 18","18-24","25-34","35-44", "45-54", "55-64", "65 or Above" ))
qplot(data=reddit,x=age.range)


reddit$income.range<-ordered(reddit$income.range,levels=c("Under 18","18-24","25-34","35-44", "45-54", "55-64", "65 or Above" ))
qplot(data=reddit,x=income.range)
