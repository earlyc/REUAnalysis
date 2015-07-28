library(car)

data = read.csv("../ResultLogs/RFTest1P_LOG_Parsed.txt")
newboost = data[1:162,]
boostsub <- newboost[ (grep("R_50",newboost$ModelFile)),]
pdf("plot_1P_RF.pdf")
scatterplot(boostsub$Accuracy ~ boostsub$Time, boostsub[c(6,3)], xlab="Execution Time", ylab="Accuracy")
dev.off()


data = read.csv("../ResultLogs/BATest1P_LOG_Parsed.txt")
newboost = data[1:162,]
boostsub <- newboost[ (grep("R_50",newboost$ModelFile)),]
pdf("plot_1P_BA.pdf")
scatterplot(boostsub$Accuracy ~ boostsub$Time, boostsub[c(6,3)], xlab="Execution Time", ylab="Accuracy")
dev.off()


data = read.csv("../ResultLogs/BOTest1P_LOG_Parsed.txt")
newboost = data[1:162,]
boostsub <- newboost[ (grep("R_50",newboost$ModelFile)),]
pdf("plot_1P_BO.pdf")
scatterplot(boostsub$Accuracy ~ boostsub$Time, boostsub[c(6,3)], xlab="Execution Time", ylab="Accuracy")
dev.off()


data = read.csv("../ResultLogs/SVTest1P_LOG_Parsed.txt")
newboost = data[1:162,]
boostsub <- newboost[ (grep("R_50",newboost$ModelFile)),]
pdf("plot_1P_SV.pdf")
scatterplot(boostsub$Accuracy ~ boostsub$Time, boostsub[c(6,3)], xlab="Execution Time", ylab="Accuracy")
dev.off()