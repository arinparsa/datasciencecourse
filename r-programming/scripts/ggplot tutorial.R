# Exercises from ggplot tutorial: http://r-statistics.co/ggplot2-Tutorial-With-R.html
# Author: Arin Parsa
# Date: 01/29/2021
library(ggplot2)
ggplot(diamonds)
ggplot(diamonds, aes(x=carat))
ggplot(diamonds, aes(x=carat, y=price))
ggplot(diamonds, aes(x=carat, color=cut))
ggplot(diamonds, aes(x=carat), color="steelblue")
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth()
ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price, color=cut))

library(ggplot2)
ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price))
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut)) + geom_smooth()
ggplot(diamonds, aes(x=carat, y=price, color=cut, shape=color)) + geom_point()

library(ggplot2)
gg <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + labs(title="Scatterplot", x="Carat", y="Price")  # add axis lables and plot title.
print(gg)
gg1 <- gg + theme(plot.title=element_text(size=30, face="bold"), 
                  axis.text.x=element_text(size=15), 
                  axis.text.y=element_text(size=15),
                  axis.title.x=element_text(size=25),
                  axis.title.y=element_text(size=25))
  scale_color_discrete(name="Cut of diamonds")
print(gg1)
library(ggfortify)
autoplot(AirPassengers) + labs(title="AirPassengers") +
  ggtitle("Use theme(plot.title = element_text(hjust = 0.5)) to center") +
  theme(plot.title = element_text(hjust = 0.5))
data(economics, package="ggplot2")
economics <- data.frame(economics)  # convert to dataframe
ggplot(economics) + geom_line(aes(x=date, y=pce, color="pcs")) + geom_line(aes(x=date, y=unemploy, col="unemploy")) + scale_color_discrete(name="Legend") + labs(title="Economics") # plot multiple time series using 'geom_line's

plot1 <- ggplot(mtcars, aes(x=cyl)) + geom_bar() + labs(title="Frequency bar chart")  

df <- data.frame(var=c("a", "b", "c"), nums=c(1:3))
plot2 <- ggplot(df, aes(x=var, y=nums)) + geom_bar(stat = "identity")  # Y axis is explicit. 'stat=identity'
print(plot2)
library(gridExtra)
grid.arrange(plot1, plot2, ncol=2)
  df <- data.frame(var=c("a", "b", "c"), nums=c(1:3))
ggplot(df, aes(x=var, y=nums)) + geom_bar() + coord_flip() + labs(title="Coordinates are flipped")
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + coord_cartesian(ylim=c(0, 10000)) + labs(title="Coord_cartesian zoomed in!")
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth() + ylim(c(0, 10000)) + labs(title="Datapoints deleted: Note the change in smoothing lines!")
ggplot(diamonds, aes(x=price, y=price+runif(nrow(diamonds), 100, 10000), color=cut)) + geom_point() + geom_smooth() + coord_equal()
