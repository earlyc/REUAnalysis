library(car)

data = read.csv("ResultLogs/RFTest1P_LOG_Parsed.txt")

newboost = data[1:162,]

boostsub <- newboost[ (grep("R_50",newboost$ModelFile)),]

#scatterplot(boostsub$Accuracy ~ boostsub$Time | boostsub$ModelFile, data=boostsub[c(3,6)])

scatterplot(boostsub$Accuracy ~ boostsub$Time, boostsub[c(6,3)])