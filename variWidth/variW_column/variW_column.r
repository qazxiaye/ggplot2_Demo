# Copyright @ Ye XIA <qazxiaye@126.com>
# part of the code is from https://learnr.wordpress.com

library(ggplot2)

df <- data.frame(x = c("Alpha", "Beta", "Gamma", "Delta"), width = c(25, 50, 75, 100), height = c(100, 75, 50, 25))

df$right    <- cumsum(df$width)
df$left     <- df$right - df$width
df$textPos  <- with(df, left + (right - left)/2)

png("1.png", width = 1000, height = 1000)
ggplot(df, aes(ymin = 0)) +
    geom_rect(aes(xmin = left, xmax = right, ymax = height, fill = x)) +
    geom_text(aes(x = textPos, y = height * 0.5, label = x)) +
    theme_bw()

png("2.png", width = 1000, height = 1000)
last_plot() + theme(legend.position = "none")
