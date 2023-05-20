homework <- read.csv("P2-Section6-Homework-Data/Section6-Homework-Data.csv")
homework
head(homework)
tail(homework)
str(homework)
summary(homework)

library(ggplot2)

#>gross % US
#>Genre을 표시하여 박스 그래프로 표시하라 점의 크기는 budget$M으로 표시 색깔은 Studio로 표시
homeworkF <- data.frame(Genre = homework$Genre, Studio= homework$Studio,
                        Gross= homework$Gross...US,Budget = homework$Budget...mill)
home <- homeworkF[homeworkF$Studio==c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB"),]
homeworkF[homeworkF$Studio==c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB"),]
m <- ggplot(data=home, aes(x=Genre, y=Gross, colour =Studio, size=Budget))
m + geom_boxplot()
home
str(home)
summary(home)
home$Budget <- factor(home$Budget)
