# Copyright @ Ye XIA <qazxiaye@126.com>
# part of the code is from https://learnr.wordpress.com

library(ggplot2)
library(reshape)

df <- structure(
    c(106487, 495681, 1597442, 2452577, 2065141, 2271925, 4735484, 3555352, 8056040, 4321887, 2463194, 347566, 621147, 1325727, 1123492, 800368, 761550, 1359737, 1073726, 36, 53, 141, 41538, 64759, 124160, 69942, 74862, 323543, 247236, 112059, 16595, 37028, 153249, 427642, 1588178, 2738157, 2795672, 2265696, 11951, 33424, 62469, 74720, 166607, 404044, 426967, 38972, 361888, 1143671, 1516716, 160037, 354804, 996944, 1716374, 1982735, 3615225, 4486806, 3037122, 17, 54, 55, 210, 312, 358, 857, 350, 7368, 8443, 6286, 1750, 7367, 14092, 28954, 80779, 176893, 354939, 446792, 33333, 69911, 53144, 29169, 18005, 11704, 13363, 18028, 46547, 14574, 8954, 2483, 14693, 25467, 25215, 41254, 46237, 98263, 185986), # 95
    .Dim = c(19, 5),  # 19*5 = 95
    .Dimnames = list(
        c("1820-30", "1831-40", "1841-50", "1851-60", "1861-70", "1871-80", "1881-90", "1891-00", "1901-10", "1911-20", "1921-30", "1931-40", "1941-50", "1951-60", "1961-70", "1971-80", "1981-90", "1991-00", "2001-06"), # 19
        c("Europe", "Asia", "Americas", "Africa", "Oceania") # 5
    )
)

df <- melt(df)
df <- rename(df, c(X1 = "Period", X2 = "Region"))


# change text direction in xlab
theme_update(axis.text.x = element_text(angle = 90, hjust = 1), panel.grid.major = element_line(colour = "grey90"), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.ticks = element_blank())

png("1.png", width = 1000, height = 1000)
ggplot(df, aes(x = Period, y = value/1e+06, fill = Region)) +
    labs(title = "Migration to the United States by Source Region (1820-2006)", x = NULL, y = "Number of People (in millions)") +
    geom_bar(stat = "identity", position = "stack") +
    scale_fill_brewer(palette = "Set1")

png("2.png", width = 1000, height = 1000)
(p <- last_plot() + labs(fill = NULL))


png("3.png", width = 1000, height = 1000)
p + geom_bar(stat = "identity", aes(x = Region, y = value/1e+06)) +
    theme_grey() + facet_wrap(~Period)
     
png("4.png", width = 1000, height = 1000)
p + facet_grid(Region ~ .) + theme(legend.position = "none")


total <- cast(df, Period ~ ., sum)
total <- rename(total, c(`(all)` = "value"))
total$Region <- "Total"
df <- rbind(total, df)

png("5.png", width = 1000, height = 1000)
last_plot() %+% df

png("6.png", width = 1000, height = 1000)
last_plot() + facet_grid(Region ~ ., scale = "free_y")

