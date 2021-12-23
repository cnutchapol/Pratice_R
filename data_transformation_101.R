## install packages
install.packages("dplyr")
## load package ทุกครั้งที่เปิด program
library(dplyr)

## read csv file intro Rstudio
## StringAsFactors = จะ keep เอาไว้
imdb <-read.csv("imdb.csv", stringsAsFactors =  FALSE)

## review data structure
#function glimpse in dplyr - load package before run
glimpse(imdb)

## print head and tail of data  , up to want to show 
head(imdb, 10)
tail(imdb,10)

## select columns 
## agrument 1 - name of data frame , name of columns
## in Console if forgot name use function names(name of data frame)
select(imdb, MOVIE_NAME, RATING)
## can use index column refer name of column
select(imdb,1,5)

#change name of column new name = original name 
select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

## pipe operator * สามารถ pipe ต่อ fucntion อื่นได้
## write pipe in consode = %>% = imdb %>% head()
imdb %>% 
  select(movie_name = MOVIE_NAME, released_year = YEAR) %>%
  head(10)

## filter data
filter(imdb,SCORE >= 9.0 )
imdb %>% filter(SCORE >= 9.0)

## change to lower case
names(imdb) <- tolower(names(imdb))

imdb %>% 
  select(movie_name,year,score) %>%
  filter( score >= 9 & year > 2000)

imdb %>% 
  select(movie_name, length,score)%>%
  filter(score == 8.8 | score == 8.3 | score == 9 )
## | pipe = or 

## in operator
imdb %>% 
  select(movie_name, length,score)%>%
  filter(score %in% c(8.3,8.8,9.0))

## filter string columns
imdb %>%
  select(movie_name,genre,rating) %>%
  filter(rating == "R")

imdb %>%
  select(movie_name,genre,rating) %>%
  filter(rating == "PG-13")

## exaclty match only Drama 
imdb %>%
  select(movie_name,genre,rating) %>%
  filter(genre == "Drama")
## ถ้ามีหลายข้อมูลจะดึงที่มี dram a กับอันอื่่น function 
## $ ดึง column  ออกจาก dataframe
## in console grepl( ) = find pattern  grepl("Drama",imdb$genre)

## have drama in genreโดยไม่สนว่ามีค่าอื่นด้วยไหม 
imdb %>%
  select(movie_name,genre,rating) %>%
  filter(grepl("Drama",imdb$genre))

# extract name of the movie that startwith "The"
# grepl is sensitive ต้องพิมพ์ๆเล็กใหญ่ให้ถูกต้องได้ผลลัพธ์ตามที่พิมพ์
imdb%>%
  select(movie_name) %>%
  filter(grepl("The",imdb$movie_name))

imdb%>%
  select(movie_name) %>%
  filter(grepl("King",imdb$movie_name))

## create new columns function mutate(new column = condition)
imdb %>% 
  select(movie_name,score,length) %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film","Short Film"))

imdb %>%
  select(movie_name,score)%>%
  mutate(score_update = score + 0.1) %>%
  head(10)

## arrange data : sort in R 
imdb %>%
  arrange(length) %>%
  head(10)

imdb %>%
  arrange(desc(length)) %>%  ## descending order
  head(10)

imdb %>%
  arrange(rating,desc(length))  ##groupby rating 

##summarize or group by  name of myself = nameof สูตร
imdb %>% 
  summarise(mean_lenght = mean(length),sd_lenght = sd(length),
            min_lenght = min(length),
            max_lengt = max(length),
            n= n())

## group by rating 
imdb %>% 
  group_by(rating) %>%
  summarise(mean_lenght = mean(length),sd_lenght = sd(length),
            min_lenght = min(length),
            max_lengt = max(length),
            n= n())

## group by rating filter blank rating group  != ไม่เท่ากับ ""=blank 
imdb %>% 
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(mean_lenght = mean(length),
            sd_lenght = sd(length),
            min_lenght = min(length),
            max_lengt = max(length),
            n= n())

##join data or join table
favourite_films <- data.frame(id = c(5,10,25,30,98))

# inner_join(other dataframe,byโดย = c("columnnew" = "column other dataframe))
favourite_films %>%
  inner_join(imdb, by = c("id"= "no"))

#can export in csv file 
imdb_prep <-imdb %>% 
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)
## export  = write.csv   row.names = false = don't want row no.
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)











