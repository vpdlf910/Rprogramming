#패키지와 라이브러리

#패키지가 실제적인 함수들의 모음
#라이브러리는 패키지가 들어가 있는 documentary에 불과하다

#R은 패키지를 활성하거나 비활성화하거나가 쉽다

#패키지를 제거하는 것도 가능

install.packages("ggplot2")


?qplot()
?ggplot()
?diamonds
library(ggplot2)

qplot(data=diamonds, carat, price, colour = clarity, facets =.~clarity)


