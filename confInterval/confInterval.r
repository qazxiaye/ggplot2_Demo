# Copyright @ Ye XIA <qazxiaye@126.com> & Xinxiu TAO <taozi_1101@163.com>

library(plyr)
library(ggplot2)

df <- read.csv("./data.csv")
(splitDf <- ddply(df, .(Size, Type), summarize, mean=mean(Time), sd=sd(Time)))


png("1.png", width = 1000, height = 1000)
ggplot(splitDf, aes(x=Size, y=mean, colour=Type)) + geom_line() + labs(x = "Array Size", y = "Execution Time")

png("2.png", width = 1000, height = 1000)
limits <- aes(ymax = mean + 2 * sd/(50^0.5), ymin=mean - 2 * sd/(50^0.5))
last_plot() + geom_errorbar(limits, width=0.2)
