rf = read.csv("../ResultLogs/RFTest1P_LOG_Parsed.txt")
ba = read.csv("../ResultLogs/BATest1P_LOG_Parsed.txt")
bo = read.csv("../ResultLogs/BOTest1P_LOG_Parsed.txt")
sv = read.csv("../ResultLogs/SVTest1P_LOG_Parsed.txt")
rf2 = read.csv("../ResultLogs/RFTest2P_LOG_Parsed.txt")
ba2 = read.csv("../ResultLogs/BATest2P_LOG_Parsed.txt")
bo2 = read.csv("../ResultLogs/BOTest2P_LOG_Parsed.txt")
sv2 = read.csv("../ResultLogs/SVTest2P_LOG_Parsed.txt")

library(ggplot2)


rf$alg <- matrix( rep('purple1', dim(rf)[1] ), ncol = 1 );
ba$alg <- matrix( rep('green1', dim(ba)[1] ), ncol = 1 );
bo$alg <- matrix( rep('blue1', dim(bo)[1] ), ncol = 1 );
sv$alg <- matrix( rep('red1', dim(sv)[1] ), ncol = 1 );
rf2$alg <- matrix( rep('purple4', dim(rf2)[1] ), ncol = 1 );
ba2$alg <- matrix( rep('green4', dim(ba2)[1] ), ncol = 1 );
bo2$alg <- matrix( rep('blue4', dim(bo2)[1] ), ncol = 1 );
sv2$alg <- matrix( rep('red4', dim(sv2)[1] ), ncol = 1 );

data = rbind(rf,ba,bo,sv,rf2,ba2,bo2,sv2)

pdf("plotAll8.pdf")

plot(data$Accuracy,data$Time, col = as.character(data$alg), pch = 16, xlab = "Accuracy", ylab = "Execution Time")

legend(75,11, c("Random Forest", "Bayes", "Boosting", "SVM"), lty=0, fill=c("purple1", "green1", "blue1", "red1", "purple4", "green4", "blue4", "red4"))

averages = matrix()

averages[1] = colMeans(rf["Accuracy"])
averages[2] = colMeans(rf2["Accuracy"])
averages[3] = colMeans(ba["Accuracy"])
averages[4] = colMeans(ba2["Accuracy"])
averages[5] = colMeans(bo["Accuracy"])
averages[6] = colMeans(bo2["Accuracy"])
averages[7] = colMeans(sv["Accuracy"])
averages[8] = colMeans(sv2["Accuracy"])

y <- barplot(averages, ylim=c(0,100), cex.names=0.4, ylab="Percent Accuracy", names.arg=c("Random Forest", "Random Forest(2)", "Bayes", "Bayes(2)", "Boosting", "Boosting(2)", "SVM", "SVM(2)" ), col=c("purple1", "purple4", "red1", "red4", "green1", "green4", "blue1", "blue4"))

text(y, averages + 10, labels=round(averages))