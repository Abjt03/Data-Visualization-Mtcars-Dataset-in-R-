library(graphics)
library(ggplot2)
library(datasets)
data(mtcars)
str(mtcars)

jpeg(file="scatter.jpeg")
plot(mtcars$mpg, xlab = "Number of cars", ylab = "Miles per Gallon", col = "red")
dev.off()

jpeg(file="barplot.jpeg")
barplot(mtcars$hp, ylab = "HorsePower", col = "cyan", horiz = FALSE)
dev.off()

jpeg(file="histogram.jpeg")
hist(mtcars$mpg,xlab = "Miles Per Gallon", main = "Histogram for MPG", col = "yellow")
dev.off()


# GGPlot2
mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$gear <- as.factor(mtcars$gear)

jpeg(file="ggplot2-scatter+jitter.jpeg")
ggplot(mtcars, aes(x= cyl , y= vs)) + geom_jitter(width = 0.1, alpha = 0.5)
dev.off()

jpeg(file="ggplot2-multivariate-scatter.jpeg")
ggplot(mtcars, aes(x= cyl , y= vs ,color = am)) +
  geom_jitter(width = 0.1, alpha = 0.5) +
  labs(x = "Cylinders",y = "Engine Type", color = "Transmission(0 = automatic, 1 = manual)")
dev.off()

jpeg(file="ggplot2-barplot.jpeg")
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar() +
  labs(x = "Cylinders", y = "Car count", fill = "Transmission")
dev.off()

jpeg(file="gglplot2-histogram.jpeg")
ggplot(mtcars, aes(mpg,fill = cyl)) +
  geom_histogram(binwidth = 1)+
  theme_bw()+
  labs(title = "Miles per Gallon by Cylinders",x = "Miles per Gallon",y =
         "Count",fill = "Cylinders")
dev.off()
