rf = read.csv("../ResultLogs/RFTest1P_LOG_Parsed.txt")
ba = read.csv("../ResultLogs/BATest1P_LOG_Parsed.txt")
bo = read.csv("../ResultLogs/BOTest1P_LOG_Parsed.txt")
sv = read.csv("../ResultLogs/SVTest1P_LOG_Parsed.txt")

library(ggplot2)


rf$alg <- matrix( rep('purple', dim(rf)[1] ), ncol = 1 );
ba$alg <- matrix( rep('green', dim(ba)[1] ), ncol = 1 );
bo$alg <- matrix( rep('blue', dim(bo)[1] ), ncol = 1 );
sv$alg <- matrix( rep('red', dim(sv)[1] ), ncol = 1 );

data = rbind(rf,ba,bo,sv)

pdf("plotAll.pdf")

plot(data$Accuracy,data$Time, col = as.character(data$alg), pch = 16, xlab = "Accuracy", ylab = "Execution Time")

legend(75,11, c("Random Forest", "Bayes", "Boosting", "SVM"), lty=0, fill=c("purple", "green", "blue", "red"))

averages = matrix()

averages[1] = colMeans(rf["Accuracy"])
averages[2] = colMeans(ba["Accuracy"])
averages[3] = colMeans(bo["Accuracy"])
averages[4] = colMeans(sv["Accuracy"])

y <- barplot(averages, ylim=c(0,100), ylab="Percent Accuracy", names.arg=c("Random Forest", "Bayes", "Boosting", "SVM"), col=c("purple", "green", "blue", "red"))

text(y, averages + 10, labels=round(averages))