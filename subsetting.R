##importing gapminder

gDat <- read.delim(file="../r.module.june2015.1/gapminder.5year.txt")
str(gDat)
head(gDat)
head(gDat, n=15)
tail(gDat)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
length(gDat)
numcol <- ncol(gDat)
str(numcol)

#two different ways to get a matrix of the column headers
colnames <- names(gDat)
write.csv(colnames, file="names2.txt")


write.csv(names(gDat), file="names.txt")

summary(gDat)

summary(gDat$pop)
summary(gDat[,3])

country.count <- summary(gDat$country)
head(country.count)
tail(country.count)

gDat$row.names
row.names(gDat)

mean(gDat$year)

plot(gDat$year, gDat$lifeExp)
plot(gDat$lifeExp ~ gDat$year)
plot(data=gDat, lifeExp ~ year)

qqnorm(gDat$gdpPercap)
qqnorm(gDat$lifeExp)

plot(gDat$gdpPercap, gDat$lifeExp)  # not very informative

gDat$log.gdp <- log10(gDat$gdpPercap)
?log
??log
plot(gDat$log.gdp, gDat$lifeExp)

gDat$log.gdp <- NULL

plot(gDat$continent, gDat$gdpPercap)

boxplot(gDat$continent, gDat$gdpPercap)
boxplot(gDat$gdpPercap~gDat$continent)

##### subsetting

str(gDat)

subset(gDat, subset=country=="Romania")
romania <- subset(gDat, subset=country=="Romania")

#select a couple of countries
subset(gDat, subset=country %in% c("Japan", "Romania"))

#select all but 
all.but <- subset(gDat, subset=country!="Romania")

subset(gDat, subset=lifeExp < 32)
subset(gDat, subset = lifeExp <28)

mean(gDat$lifeExp)

##doesn't work
mean((subset(gDat, subset=country=="Rwanda" && subset=year <1990))$lifeExp)
plot(subset(gDat, subset=country=="Rwanda")$year, subset(gDat, subset=country=="Rwanda")$lifeExp )

pre.90 <- gDat[gDat$year<1990,]
gDat[gDat$year > 1990 & gDat$lifeExp < 30,]
gDat[gDat$year > 1990 & gDat$lifeExp < 30,]

mean(subset(gDat, subset=country=="Rwanda")$lifeExp)
mean((gDat[gDat$country=="Rwanda",])$lifeExp)

with(gDat, mean(lifeExp))

