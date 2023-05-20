?read.csv()
#Method 1: Select The File Manually

stats <- read.csv(file.choose())
stats

#Method 2: Set WD and Read Data
getwd()
setwd("C:\\Users\\Kirill\\Desktop\\R Programming")
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")


#Exploring Data
stats
nrow(stats)
ncol(stats)
head(stats)
str(stats) #str() , runif()
summary(stats)

# Using $

stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats
stats[,"Internet.users"]
levels(stats$Income.Group)
stats$Income.Group

# Basic Operations with a DF

stats[1:10,]
stats[3:9 ,]
stats[c(4,100),]

stats[1,]
is.data.frame(stats[1,]) #no need drop
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users

#test of knowlegde
stats$xyz <- 1:5
#stats$test <- 1:6 #작동되지 않는다.
head(stats, n=10) 

#remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL

levels(stats$Country.Name)
?levels

#filtering
filter <-stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group =="High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]
factor(c("m","m","f","f"))
levels(factor(c("m","m","f","f")))
nlevels(factor(c("m","m","f","f")))


?apply

install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate , size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate , size=I(3), 
      colour = I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate , size=I(3), 
      colour = "blue")

qplot(data=stats, x=Income.Group, y=Birth.rate , geom='boxplot')

#Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4),colour = I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4),colour = Income.Group)

#--------------------------

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <-c("Country", "Code","Region")
#colnames(mydf)
#head(mydf)

rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
mydf
head(mydf)
tail(mydf)
summary(mydf)

merged <- merge(stats, mydf, by.x= "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)

#----------------------------------

qplot(data= merged , x= Internet.users, y= Birth.rate)
qplot(data= merged , x= Internet.users, y= Birth.rate,
      colour = Region)
#1. shapes

qplot(data= merged , x= Internet.users , y= Birth.rate,
      colour = Region, size=I(5) , shape = I(2))
#2. Transparency

qplot(data= merged , x= Internet.users , y= Birth.rate,
      colour = Region, size=I(5) , shape = I(19),
      alpha = I(0.6))
#3. Title


qplot(data= merged , x= Internet.users , y= Birth.rate,
      colour = Region, size=I(5) , shape = I(2),
      alpha = I(0.6), main= "Birth rate Vs Internet Users")

