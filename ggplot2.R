library(ggplot2)
install.packages("RColorBrewer")
library(ColorBrewer)

str(mpg)
mpg <- mpg

levels(mpg$class)

mpg1 <- subset(mpg, subset=class==c("midsize", "minivan"))
levels(mpg1$class)
boxplot(mpg$cty ~ mpg$class)
boxplot(mpg$cty ~ mpg$class)

boxplot(mpg1$cty ~ mpg1$class)

boxplot(mpg1$cty ~ droplevels(mpg1$class))
droplevels(mpg1$class)

qplot(displ, hwy, data=mpg)
plot(mpg$displ, mpg$hwy)


qplot(displ, hwy, data=mpg, color = class)
qplot(displ, hwy, data=mpg, color = cty)
p <- qplot(displ, hwy, data=mpg, color = cty)
p + stat_smooth(method="lm")
p + stat_smooth(method="lm", level= 0.99)


ggplot(data=mpg, aes(x=displ, y=hwy))+
    geom_point(aes(color=cty))+
    stat_smooth(method = "lm", level=0.99)

ggplot(data=mpg, aes(x=displ, y=hwy))+
    geom_point(aes(color=cty, size=factor(cyl), shape=class))+
    stat_smooth(method = "lm", level=0.99)


ggplot(data=mpg, aes(x=displ, y=hwy))+
    geom_point(aes(color=cty,  shape=class))+
    stat_smooth(method = "lm", level=0.99)+
    facet_grid(cyl~drv)

?facet_grid
