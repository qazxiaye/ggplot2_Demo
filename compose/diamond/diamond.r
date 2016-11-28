# Copyright @ Ye XIA <qazxiaye@126.com>
# part of the code is from https://learnr.wordpress.com

require(ggplot2)
set.seed(42)
small <- diamonds[sample(nrow(diamonds), 100), seq(1,10)]

p <- ggplot(small)

png("1.png", width = 1000, height = 1000)
p + geom_point(aes(x=carat, y=price, shape=cut, colour=color))

png("2.png", width = 1000, height = 1000)
p + geom_point(aes(x=carat, y=price, shape=cut, colour=color)) + scale_y_log10() + scale_colour_manual(values=rainbow(7))

png("3.png", width = 1000, height = 1000)
ggplot(small, aes(x=carat, y=price)) + geom_point() + scale_y_log10() + stat_smooth()

png("4.png", width = 1000, height = 1000)
p + geom_bar(aes(x=clarity))

png("5.png", width = 1000, height = 1000)
p + geom_density(aes(x=price, colour=cut))

png("6.png", width = 1000, height = 1000)
p + geom_boxplot(aes(x=cut, y=price,fill=color))

png("7.png", width = 1000, height = 1000)
p + geom_bar(aes(x=cut, fill=cut))

png("8.png", width = 1000, height = 1000)
p + geom_bar(aes(x=cut, fill=cut)) + coord_flip()

png("9.png", width = 1000, height = 1000)
p + geom_bar(aes(x=factor(1), fill=cut)) + coord_polar(theta="y")

png("10.png", width = 1000, height = 1000)
p + geom_bar(aes(x=factor(1), fill=cut)) + coord_polar()

png("11.png", width = 1000, height = 1000)
p + geom_bar(aes(x=clarity, fill=cut)) + coord_polar()

png("12.png", width = 1000, height = 1000)
ggplot(diamonds, aes(carat, price)) + stat_density2d(aes(fill = ..level..), geom="polygon") +  scale_fill_continuous(high='darkblue',low='lightblue')
