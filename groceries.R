install.packages("arules")
library('arules')
setwd('C:/Users/Ashwin/Desktop/Assignments/Association_rule')
groceries <- read.csv('C:/Users/Ashwin/Desktop/Assignments/Association_rule/groceries.csv',header=FALSE)
View(groceries)
summary(groceries)

install.packages("arulesViz")
library("arulesViz")
?apriori

arules <- apriori(groceries, parameter=list(support=0.002,confidence=0.6))
arules
inspect(head(sort(arules,by="lift")))

#Different ways of visualization rules
plot(arules)
plot(arules,method="grouped")
plot(arules[1:30],method="graph")

write(arules,file="groceries_arules.csv",sep=",")

#EDA

arules1 <- apriori(groceries,parameter=list(support=0.1,confidence=0.8))
arules1
inspect(arules1)
inspect(head(sort(arules1,by="lift")))

plot(arules1)
plot(arules1,method="grouped")
plot(arules1,metho="graph")


arules2 <- apriori(groceries,parameter=list(support=0.015,confidence=0.7))
arules2
inspect(arules2)
inspect(head(sort(arules2,by="lift")))

plot(arules2)
plot(arules2,method="grouped")
plot(arules2,method="graph")
