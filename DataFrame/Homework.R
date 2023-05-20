getwd()
rm(mydf)
rm(stats)
rm(merged)
data1 <-read.csv("P2-Section5-Homework-Data.csv")
data1

data2 <-data.frame(Country_Code,Life_Expectancy_At_Birth_1960,Life_Expectancy_At_Birth_2013)
data2

head(data1)
head(data2)

HomeMerged <- merge.data.frame(data1, data2, by.x="Country.Code",by.y ="Country_Code")
head(HomeMerged)
library(ggplot2)
qplot(data= HomeMerged, x= Fertility.Rate , y=Life_Expectancy_At_Birth_1960,
      colour = Region)
qplot(data= HomeMerged, x= Fertility.Rate , y=Life_Expectancy_At_Birth_2013,
      colour = Region)
