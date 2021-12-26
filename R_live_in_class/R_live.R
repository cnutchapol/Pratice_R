## library glue
library(glue)

## data structures
# vector, matrix, list, data frame

# vector
1:10
89:101

my_friends <- c("Nut","Fiat","Jijie","Nine","gift")
ages <- c("21","22","22","21","23")
movie_lover <- c(T, F, T, T, T)

#matrix
matrix(1:20, ncol = 4)
matrix(1:20, nrow =  4)
m1 <- matrix(1:20, nrow =  4, byrow =  T)
## check row and column
## dim = dimension 
ncol(m1)
nrow(m1)
dim(m1)

## list 
## key = value pair 
customers_data <- list(
  id = 1,
  name = "Nut",
  location = "Thailand",
  language = "Thai"
)
customers_data$id
## ตำแหน่งที่..
customers_data[[3]]
customers_data[3]


## nested list
consumer_data <- list(
  consumer_data1 = list(
    name = "Fiat",
    ages = "20" 
  ),
  consumer_data2 = list(
    name = "gift",
    ages = "22",
    sex = "Female"
  ),
  consumer_data3 = list(
    name = "Jijie",
    ages = "21",
    sex = "Female",
    account_balance = 4000
  )
)
consumer_data[[3]][[4]]

## data frame 
## table 
df <- data.frame(id = 1:5,
                 my_friends,
                 movie_lover,
                 ages)
## write csv
library(tidyverse)
write.csv(df,"R_friends",row.names = F )

## read csv file
R_friends <- read.csv("Desktop/R_Programming_Course/R_friends")

class(R_friends)

#subset data frame = extract data
#row , columns
R_friends[1:2, 1:3]
R_friends[1:4, ]
R_friends[c(1,3,4), ]
R_friends[ , 1:2]
R_friends[ , c("id","ages")]
R_friends$ages < 23
R_friends[R_friends$ages < 23 , ]
## ! reverse ture = f , false = t

new_Friends <- data.frame(
  id = 6:7,
  my_friends = c("god","aom"),
  movie_lover = c(T,T),
  ages = c(21,22)
)
# row bind  sql = union
all_friends <- rbind(R_friends, new_Friends)

# add new columns 
#$new columns <- original dataframe$columns
all_friends$correct_ages <- all_friends$ages -1

# remove column 
all_friends$ages <-  NULL

# rename column 
# R index start = 1 Python = 0
names(all_friends)[2] <- "name"

mini_friends <- all_friends[[ -c(3,4), ]]

###control flow 
## if, for , while 
#if 
score <- 85 
if(score >= 80) {
  print("Passed")
} else {
  print("Failed")
}

## create function
check_grade  <- function(score) {
  if(score >= 80){
    print("Passed")
  }else {
    print("Failed")
  }
}
#in console check_grade(67,...)

check_grade2 <- function(score) {
  ifelse(score >=80 , "Passed","Failed")
}
score <- 82

check_grades <- function(score) {
  if(score >= 80) {
  print("A")
}else if(score >= 80) {
  print("B+")
}else if(score >= 75) {
  print("B")
}else if(score >= 70) {
    print("c+")
}else {
  print("Failed")
}
}

## for loop 
numbers <- c(10,15,20,50)
## for( dummy_variable in vector)
for (num in numbers) {
  print(num*2)
}
numbers * 2  # element wise computation 

friends <- c("Nut","Fiat","God")
print(paste("Hello",friends ))

## while loop 
#while (TRUE) {
#  de something
#}

x <- 0 
while (x <10) {
  print( "hello!")
  x <- x+1
}

# check username and password 
## input form user (in console ) readline("") 

check_in <- function(){
  user_input <- readline("What is your username: ")
  user_pw <- readline("What is your password: ")
  
  system_username <- "nut"
  system_password <- "012345"
  if(user_input == system_username & user_pw == system_password) {
    print("Log in success")
  }else {
    print("Please check your username & password")
  }
}







































