## this is a comment
print("Hello World")
print("I am learning R programming !!")

## create variables
income <- 50000
expense <- 32000
saving <- income - expense
print(saving)
my_name <- "nut" 

## Cat statement : text statement 
cat("My saving this month: ", saving)

## remove/ delete object ( variable)
rm(income)
rm(expense)

## class - data types
my_name <- "Nut"
my_age <- 21
is_male <- TRUE 
class (my_name) ; class(my_age)
## logical
1+1 == 2 
5 < 2
4*3 != 12

## Data Structures
## 1. Vector
## 2. Matrix 
## 3. List
## 4. DataFrame

## create vector
friends <- c("Nut","Khim","Jijie","Fiat","Aom")
ages <- c(21,20,21,24,24)
gender <- c("M","M","F","F","F")

gender <- factor(gender)
gender

## matrix
m1 <- matrix(1:20,ncol = 5,byrow = T)

##list 
my_list <- list(artist = "Adele",
                song = "Easy on me",
                year = 2020,
                like = 600000,
                is_male = TRUE,
                my_matrix = m1,
                friends = friends)
my_list$artist

## Dataframe 

friends <- c("Nut","Khim","Jijie","Fiat","Aom")
ages <- c(21,20,21,24,24)
gender <- c("M","M","F","F","F")
length(friends)
## Create DataFrame
df <- data.frame(friends,ages,gender)



