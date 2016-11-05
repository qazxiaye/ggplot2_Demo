# Copyright @ Ye XIA <qazxiaye@126.com>
# part of the code is from https://learnr.wordpress.com

library(ggplot2)
library(reshape)

df <- structure(
    list(
        City = structure(
            c(2L, 3L, 1L),
            .Label = c("Minneapolis", "Phoenix", "Raleigh"),
            class = "factor"),
        
        January   = c(52.1, 40.5, 12.2),
        February  = c(55.1, 42.2, 16.5), 
        March     = c(59.7, 49.2, 28.3), 
        April     = c(67.7, 59.5, 45.1), 
        May       = c(76.3, 67.4, 57.1), 
        June      = c(84.6, 74.4, 66.9), 
        July      = c(91.2, 77.5, 71.9), 
        August    = c(89.1, 76.5, 70.2), 
        September = c(83.8, 70.6, 60), 
        October   = c(72.2, 60.2, 50), 
        November  = c(59.8, 50, 32.4), 
        December  = c(52.5, 41.2, 18.6)
    ), 
        
    .Names = c("City", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"), 
    class = "data.frame", 
    row.names = c(NA, -3L)
)

(dfm <- melt(df, variable_name = "month"))
levels(dfm$month) <- month.abb # set months to be short

png("1.png", width = 1000, height = 1000)
ggplot(dfm, aes(month, value, group = City, colour = City)) + geom_line(size = 1)

png("2.png", width = 1000, height = 1000)
last_plot() + theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    geom_vline(xintercept = c(2.9, 5.9, 8.9, 11.9), colour = "grey85", alpha = 0.5) +
    geom_hline(yintercept = 32, colour = "grey80", alpha = 0.5) + 
    annotate("text", x = 1.2, y = 35, label = "Freezing", colour = "grey80", size = 4) +
    annotate("text", x = c(1.5, 4.5, 7.5, 10.5), y = 97, label = c("Winter", "Spring", "Summer", "Autumn"), colour = "grey70", size = 4)
