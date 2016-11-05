# Copyright @ Ye XIA <qazxiaye@126.com>
# part of the code is from https://learnr.wordpress.com

library(ggplot2)
library(plyr)
library(reshape)
    
df <- data.frame(
    segment = c("A", "B", "C", "D"), 
    segpct = c(40, 30, 20, 10), 
    Alpha = c(60, 40, 30, 25), 
    Beta = c(25, 30, 30, 25), 
    Gamma = c(10, 20, 20, 25), 
    Delta = c(5, 10, 20, 25)
)

df$xmax   <- cumsum(df$segpct)
df$xmin   <- df$xmax - df$segpct
df$segpct <- NULL

(dfm <- melt(df, id = c("segment", "xmin", "xmax")))
(dfm <- ddply(dfm, .(segment), transform, ymax = cumsum(value)))
(dfm <- ddply(dfm, .(segment), transform, ymin = ymax - value))

dfm$xtext <- with(dfm, xmin + (xmax - xmin)/2)
dfm$ytext <- with(dfm, ymin + (ymax - ymin)/2)

png("1.png", width = 1000, height = 1000)
ggplot(dfm, aes(ymin = ymin, ymax = ymax, xmin = xmin, xmax = xmax, fill = variable)) + geom_rect(colour = I("grey")) + theme(legend.position = "none") + xlab(NULL) + ylab(NULL)

png("2.png", width = 1000, height = 1000)
last_plot() + geom_text(aes(x = xtext, y = ytext, label = ifelse(segment == "A", paste(variable, " - ", value, "%", sep = ""), paste(value, "%", sep = ""))), size = 3.5)

png("3.png", width = 1000, height = 1000)
last_plot() + geom_text(aes(x = xtext, y = 103, label = paste("Seg ", segment)), size = 4)

png("4.png", width = 1000, height = 1000)
last_plot() + theme_bw() + theme(legend.position = "none", panel.grid.major = element_line(colour = NA))
