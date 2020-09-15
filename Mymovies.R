install.packages("arules")
library("arules")
movies <- read.csv('my_movies.csv')
View(movies)
as.matrix(movies[,6:15])

movies_arule <- apriori(as.matrix(movies[,6:15]),parameter = list(support=0.3,confidence=0.7))

inspect(movies_arule)
inspect(head(sort(movies_arule,by="lift")))

#EDA
movies_arule1 <- apriori(as.matrix(movies[,6:15]),parameter = list(support=0.2,confidence=0.7))
movies_arule1
inspect(movies_arule1)
inspect(head(sort(movies_arule1,by="lift")))

movies_arule2 <- apriori(as.matrix(movies[,6:15]),parameter = list(support=0.25,confidence=0.8))
movies_arule2
inspect(movies_arule2)
inspect(head(sort(movies_arule2,by="lift")))
