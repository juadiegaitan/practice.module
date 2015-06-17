install.packages("nycflights13")

library(nycflights13)
library(ggplot2)
library(dplyr)


dim(flights)
head(flights)
str(flights)


dplyr.filter <- filter(flights, 
            month== 1, day == 1)
index.filter <- flights[flights$month == 1 
                & flights$day ==1 , ]


arrange(flights, year, month, day)

flights$year <- NULL
select(flights -(year))
rename(flights, tail_num = tailnum)

#creating a version of flights that tells summmarise how to apply
by_tailnum <- group_by(flights, tailnum)

delay <- summarise(by_tailnum, 
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE))

# remove short flights and rare planes
delay <-  filter(delay, count > 20, dist < 2000)

ggplot(delay, aes(dist, delay)) +
    geom_point(aes(size = count), alpha = 1/2) +
    geom_smooth() +
    scale_size_area()




by_tailnum <- group_by(flights, tailnum)
delay <- summarise(by_tailnum,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dist < 2000)

# Interestingly, the average delay is only slightly related to the
# average distance flown by a plane.
ggplot(delay, aes(dist, delay)) +
    geom_point(aes(size = count), alpha = 1/2) +
    geom_smooth() +
    scale_size_area()

####Chaining

flights %>%
    group_by(year, month, day) %>%
    select(arr_delay, dep_delay) %>%
    summarise(
        arr = mean(arr_delay, na.rm = TRUE), 
        dep = mean(dep_delay, na.rm = TRUE), 
    ) %>%
    filter(arr >30 | dep > 30)
