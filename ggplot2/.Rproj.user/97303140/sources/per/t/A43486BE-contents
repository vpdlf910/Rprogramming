getwd()
movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre","CriticRating", "AudienceRating", 
                      "BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

#------------------------------------- Aesthetics

library(ggplot2)
ggplot(data= movies, aes(x=CriticRating,y=AudienceRating))
#이것만으로는 데이터가 표시되지는 않는다. 

#add geometry

ggplot(data= movies, aes(x=CriticRating,y=AudienceRating))+ geom_point()
#add colour

ggplot(data= movies, aes(x=CriticRating,y=AudienceRating, 
                         colour = Genre))+ geom_point()
#add size

ggplot(data= movies, aes(x=CriticRating,y=AudienceRating, 
                         colour = Genre, size = Genre))+ geom_point()

#add size -better way

ggplot(data= movies, aes(x=CriticRating,y=AudienceRating, 
                         colour = Genre, size = BudgetMillions))+ geom_point()

#>>> this #1 (we will improve it)

#--------------------- Plotting With Layers

p<-ggplot(data= movies, aes(x=CriticRating,y=AudienceRating, 
                         colour = Genre, size = BudgetMillions))
#point
p + geom_point() 
#lines
p+ geom_line()
#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#--------------------------Overriding Aesthetics

q <- ggplot(data = movies, aes(x= CriticRating, y = AudienceRating, colour= Genre
                               ,size = BudgetMillions))
#add geom layer
q + geom_point()


#overriding aes
#ex1
q + geom_point(aes(size= CriticRating))
#기존의 q안에 있던 size의 조건이 변경된다

#ex2
q +  geom_point(aes(colour = BudgetMillions))

q+ geom_point()
#overriding을 하지 않으면 기존의 데이터로 돌아온다.

#ex3
q + geom_point(aes(x = BudgetMillions))
#overriding을 할지라고 기존의 x를 유지하고 있지만 내용물은 달라진다.
q + geom_point(aes(x = BudgetMillions)) + xlab("Budget Millions $$$")

#ex4

q + geom_line() + geom_point()
#reduce line size
q + geom_line(size = 1) + geom_point()

#------------------------------ Mapping vs Setting
r <- ggplot(data = movies, aes(x=CriticRating, y = AudienceRating))
r + geom_point()

#Add colour
#1. Mapping( what we' ve done so far):
r + geom_point(aes(colour = Genre))
#2. Setting:
r + geom_point(colour = "DarkGreen")
#ERROR:
r + geom_point(aes(colour = "DarkGreen"))

#1. Mapping
r + geom_point(aes(size = BudgetMillions))
#2. Setting
r + geom_point(size=10)
#ERROR:
r + geom_point(aes(size=10))#범주 10에 해당되는 값을 설정 실제 크기는 3~4가 된다.

#------------------ Histograms and Density Charts

s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#add colour
s + geom_histogram(binwidth = 10, aes(fill=Genre))
#add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#>>>3 (we will improve it)

#cometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position='stack')

#------------------------ Starting Layer Tips

t <- ggplot(data = movies , aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                   fill= "White", colour="Blue")

#another way:
t<- ggplot(data= movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating),
                   fill= "White", colour="Blue")

#이 방법을 통해서 x에 들어갈 column을 유연하게 지정할 수 있다.
#>>> 4
t + geom_histogram(binwidth=10, aes(x=CriticRating),
                   fill= "White", colour="Blue")

#>>> 5
t <- ggplot()
#스켈레톤 plot이라 부른다. 다양한 데이터를 동시에 사용할 때 사용한다.

#-----------------------------Staticstical Transformations

?geom_smooth

u <- ggplot(data= movies, aes(x=CriticRating, y=AudienceRating,
                              colour= Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
            colour = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1.2) 
u + geom_boxplot(size = 1.2) + geom_point()
#tips / hack:
u + geom_boxplot(size = 1.2) + geom_jitter()
#상자안의 데이터를 보기가 편하게 흐트려 준다.

#another way:
u + geom_jitter() + geom_boxplot(size=1.2, alpha= 0.5)

#>>> 6:

u <-ggplot(data=movies, aes(x=Genre, y=CriticRating,
                            colour = Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_jitter()

#-------------------------Using Facets

v <- ggplot(data= movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,aes(fill=Genre),
                   colour = "Black")
#facets
v + geom_histogram(binwidth = 10,aes(fill=Genre),
                   colour = "Black") + 
  facet_grid(Genre~., scales = "free")

#scatterplots:
w <- ggplot(data= movies, aes(x=CriticRating, y= AudienceRating,
            colour = Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3)+ facet_grid(Genre~.)
w + geom_point(size=3)+ facet_grid(.~Year)
w + geom_point(size=3)+ facet_grid(Genre~Year)

w + geom_point(size=3)+ facet_grid(Genre~Year) + geom_smooth()
w + geom_point(aes(size=BudgetMillions))+ facet_grid(Genre~Year)+ geom_smooth()

#>>> 1 (but still will improve)

#------------------------------- Coordinates

#Today:
#limits
#zoom

m <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               size= BudgetMillions,
                               colour = Genre))
m + geom_point()
m + geom_point() +
  xlim(50,100) +
  ylim(50,100)

#won't work well always
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre),colour= "Black")
n + geom_histogram(binwidth=10, aes(fill=Genre),colour= "Black")+
  ylim(0,50)
#실제로 데이터를 확대하는 것이 아닌 삭제하는 것이다.
#instead - zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre),colour= "Black")+
  coord_cartesian(ylim = c(0,50))


#improve #1:
w + geom_point(aes(size=BudgetMillions))+ 
  facet_grid(Genre~Year)+ 
  geom_smooth() +
  coord_cartesian(ylim=c(0,100))

#-------------------------- Theme
o <- ggplot(data = movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")

#axis labels
h + xlab("Money Axis") +
  ylab("Number of Movies")

#label formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour = "Red", size=30))
#tick mark formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))
?theme

#legend formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title= element_text(size=30),
        legend.text = element_text(size=20),
        legend.position= c(1,1),
        legend.justification = c(1,1))
#title
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title= element_text(size=30),
        legend.text = element_text(size=20),
        legend.position= c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour= "DarkBlue",
                                  size=40,
                                  family="Courier"))
