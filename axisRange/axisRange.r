# Copyright @ Ye XIA <qazxiaye@126.com>
# part of the code is from https://learnr.wordpress.com

library(ggplot2)

df <- read.table(
    textConnection("
1 City X Y
2 Atlanta 4 15
3 Atlanta 5 18
4 Boston 6 16
5 Boston 6 16
6 Boston 7 12
7 Boston 11 11
8 Chicago 10 13
9 Chicago 13 10
10 Chicago 15 8
11 Detroit 10 9
12 Detroit 15 5
13 Detroit 13 3
14 Detroit 14 6
    "), header=TRUE
)

png("1.png", width = 1000, height = 1000)
ggplot(df, aes(x = X, y = Y, colour = City, shape = City, label = City)) +
    geom_point() + xlab(NULL) + ylab(NULL) +
    geom_text(aes(hjust = -0.1, vjust = 0.5)) +
    theme(legend.position = "none")

png("2.png", width = 1000, height = 1000)
maxl <- max(df$X, df$Y)
last_plot() + 
    scale_x_continuous(limits = c(0, maxl)) + scale_y_continuous(limits = c(0, maxl)) +
    geom_point(size=4)

png("3.png", width = 1000, height = 1000)
ggplot(df, aes(x = X, y = Y, colour = City, shape = City, label = City, xmin = 0, xmax = maxl, ymin = 0, ymax = maxl)) +
    geom_point() + xlab(NULL) + ylab(NULL) +
    geom_text(aes(hjust = -0.1, vjust = 0.5)) +
    theme(legend.position = "none") +
    geom_point(size=4)
