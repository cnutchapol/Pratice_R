# data transformation / data viz 101
#modern R - ggplot2 , dplyr
install.packages( c("ggplot2", "'dplyr")) 
library(ggplot2)
library(dplyr)

#dplyr 
mtcars
tibble(mtcars)
select(mtcars,1:3,6)
select(mtcars, cyl,wt, mpg)
# rename columns
select(mtcars,
       mile_per_gallon = mpg,
       auto_munual = am,
       house_power = hp,
       weight = wt)
## ETL
## %>% pipe operator 
df <- mtcars %>%
  #step1 select columns
  select( mile_per_gallon = mpg,
           auto_munual = am,
           house_power = hp,
           weight = wt) %>%
  #step2 filter row 
  filter(mile_per_gallon <= 15) %>%
  #step3 sort HP-house_power
  arrange( desc(house_power))

# data visualization
#base R
mtcars$hp
hist(mtcars$hp)
plot(mtcars$hp,mtcars$mpg, pch=16, col = "red")

#modern R
ggplot(mtcars, aes(hp, mpg)) + geom_point() + geom_smooth()+ 
  theme_minimal()

# basic modeling 
## K-Means - cluster
head(iris)
### Prep Data ###
Species <- iris$Species
## delete column Species
iris_data <- iris %>% select(-Species)

### Modeling K-means clustering ###
#K-means - unsupervised learning
km_result <- kmeans(iris_data,3) #3segments
cluster_membership <- km_result$cluster

table(cluster_membership) #check
## Cross Check ###
table(Species,cluster_membership)














