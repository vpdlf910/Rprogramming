Salary
Games
MinutesPlayed

?matrix

my.data <- 1:20
A <- matrix(my.data)
B <- matrix(my.data, nrow=4, ncol=5)
B
B[2,5]

C <- matrix(my.data,nrow=4,ncol=5,byrow = T)
C

r1 <- c("I", "am", "happy")
r2 <- c("What", "a", " day")
r3 <- c(1,2,3)


D <- rbind(r1,r2,r3)
D
d1 <- 1:5
d2 <- -1:-5
E <- cbind(d1,d2)
E
