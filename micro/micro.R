library(arules)
library(arulesViz)

data("Income") #upload data
income<-Income
summary(income)

colnames(income)

rules <- apriori(income, parameter = list(support = 0.4, confidence = 0.3, minlen=2))
subrules <- head(rules, n = 25, by = "lift")
inspect(subrules)
plot(subrules, method = "grouped")
