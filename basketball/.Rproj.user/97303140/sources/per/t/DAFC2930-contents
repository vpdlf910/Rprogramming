x <- c('a','b','c','d','e')
x
x[c(1,5)]
x[1]

Games
Games[1:3, 6:10]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])
#이것의 이유는 R이 사용자의 의도를 추측하는 데 객체가 더 이상 2차원이
#필요없다고 생각하기 때문에 벡터로 추출하고 싶어한다고 R이 판단하기에

Games[1,,drop =F]
Games[1,5,drop =F]

Data <- MinutesPlayed[1:3,]

matplot(t(Data), type="b", pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset= 0.01, legend=Players,pch = 15:18, col=c(1:4,6),horiz=F)
