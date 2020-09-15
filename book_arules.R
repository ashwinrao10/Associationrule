install.packages("arules")
library("arules")
setwd('C:/Users/Ashwin/Desktop/Assignments/Association_rule')
book <- read.csv('book.csv',header=TRUE)
View(book)
as.matrix(book[,2:11])
book_arules <- apriori(as.matrix(book[,2:11]),parameter=list(support=0.2,confidence=0.7))
book_arules

inspect(book_arules)
inspect(sort(book_arules,by="lift"))

#EDA
 
book_arules1 <- apriori(as.matrix(book[,2:11]),parameter=list(support=0.1,confidence=0.6))
book_arules1
inspect(book_arules1)
inspect(head(sort(book_arules1,by="lift")))

book_arules2 <- apriori(as.matrix(book[,2:11]),parameter=list(support=0.05,confidence=0.6))
book_arules2
inspect(book_arules2)
inspect(head(sort(book_arules1,by="lift")))
        
        