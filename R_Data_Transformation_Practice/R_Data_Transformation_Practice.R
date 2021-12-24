## Data Transformation / Data wrangling
#code install.packages( "tidyverse", dependencies = TRUE) = downloadที่เกี่ยวข้อง มาด้วย
install.packages( "tidyverse", dependencies = TRUE)
## tidyverse is a must know in workplace
## load library
library(tidyverse)

## read data files  read.csv() is base R tidyverse = read_csv() it's faster 
## <- same = 
friends <- read_csv("Desktop/R_Programming_Course/friends.csv")

## delimiter - spit data by ...
df1 <-read_delim("Desktop/R_Programming_Course/text_file_01.txt", delim = ";")

## "\t" tab
df2 <- read_delim("Desktop/R_Programming_Course/text_file_02.txt", delim =  "\t")

## tibble = give dimension information of data frame == enhanced dataframe
## change normal to tibble tibble = show head line 1-10 
## mtcars - dataframe in R
mtcars <- tibble(mtcars)

## dplyr - data transformation 
## 1. select()
## 2. filter()
## 3. mutate()
## 4. arrange()
## 5. summarise()
## 6. group_by()
## 7. count()


## select coloumns
select(mtcars, mpg, hp, wt)
select(mtcars, 1, 2, 4, 6)
select(mtcars, 1:3,8:10)

select(mtcars, starts_with("a")) 
select(mtcars, contains("a"))  # have letter a in column
select(mtcars, ends_with("p")) #ends letter with..
select(mtcars, carb, vs, everything())  # every columns ต่อท้าย card

#rename columns
select(mtcars, horsePower = hp,
               milePerGallon = mpg,
               weight = wt)

## filter rows with conditions
filter(mtcars, mpg < 20)
filter(mtcars, mpg < 20,
               hp  > 200 &
               am == 1)
#or  | 
filter(mtcars, mpg < 18 | am == 1)

## combine select + filer %>%
#mutate ceate new columns
head(mtcars) # top 6 rows
mtcars %>% head()
mtcars %>% 
  select(mpg, hp, wt) %>%
  filter(mpg < 20, hp > 200)%>%
  mutate(double_hp = hp*2, 
         log_hp = log(hp),
         exp_log_hp = exp(log_hp))

## arrange data
mtcars %>% 
  select(mpg, hp, wt) %>%
  arrange(hp) #  ascending order
# arrange( desc(hp)) descending order 

#convert am change to factor
mtcars %>%
  select(mpg, hp, wt, am)%>%
  mutate(am = factor(am, labels = c("Auto", "Manual")))

mtcars %>%  
  select(mpg, hp, wt, am) %>%
  mutate( am = factor(am,
                      levels = c(0,1),
                      labels = c("Auto","Manual"))) %>%
  arrange( desc(am), desc(hp))
  
## summarise
mtcars %>%
  mutate(a = factor(am,
                    levels = c(0,1),
                    labels = c("Auto","Manual"))) %>%
  group_by(am) %>%
  summarise(avg_hp = mean(hp),
            sum_hp = sum(hp),
            sd_hp = sd(hp),
            avg_mpg = mean(mpg),
            n = n()) %>%
  ungroup()
## if group after finish need to ungroup

## use case
## diamonds - building data set in tidyverse
## ordinal - factor เรียงสูงกลางต่ำได้categorical
result <- diamonds %>% 
  count(cut, color) %>%
  mutate(percent = n / sum(n)) %>%
  arrange( desc(percent))

## export data to csv file
write_csv(result,"top_ten_diamonds.csv")

## join tables
## sample data set "band_member" and "band_instruments"
band_members
band_instruments

inner_join( band_members, band_instruments , by = "name")
left_join( band_members, band_instruments , by = "name")
full_join( band_members, band_instruments , by = "name")

band_members %>%
  inner_join(band_instruments, by = "name")

## add grand total 
df1 <- diamonds %>%
  count(cut)
df2 <- data.frame(cut = "Total", n = length(diamonds$cut))
df1 %>% bind_rows(df2)









