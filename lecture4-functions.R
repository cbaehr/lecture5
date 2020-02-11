## 4: Functions
## Advanced Programming in R

###HOMEWORK 1 DUE TUESDAY!!!


## 4.1) For loops

## If you find yourself doing similar tasks over and over again and your
## code becomes repetititve, you want to use for loops

print(1+10)
print(2+10)
print(3+10)
## ...
print(20+10)

for(number in 1:20) {
  
  print(10+number)

}

for(number7 in 1:20) {
  
  print(10+number7)
  
}

# for(7number in 1:20) {
#   
#   print(10+number)
#   
# }

#"number" can be replaced with any meaningful name. It is a PLACEHOLDER
#"1:20" should be replaced with the values you want to INDEX through
#the code in the parentheses will be run using EACH index

## The placeholder will take on ONE index value, then the code in the parentheses
## is run using that value.

#for(PLACEHOLDER in VALUES) {
#  
#  CODE TO EXECUTE (SEPERATELY!!!) FOR **EACH** VALUE
#  
#}

for(car in c("Mazda", "Honda", "Toyota")) {
  
  print(car)
  
}
# first, car = "Mazda", then R runs the print function. Then car = "Honda", and R runs the
# code again. And so on


#######################################
###
### In-class exercise ###
###
### Create a for loop that flips a coin x amount of times (you choose how many)
### and prints the results
###
#######################################

x <- 20

for(coin in 1:x) {
  
  result <- sample(c("H", "T"), size = 1)
  
  print(result)
  
}


sample(c("Heads", "Tails"), size = 20, replace = T)


## 4.2) Functions

## We have used a number of functions in R. These functions have all come with 
## some pre-defined purpose and a set of arguments that allow us to customize
## the function to some degree

## We can also make our own functions. This exercise is twofold: building our
## own functions opens a universe of possibilities for what we can do in R. It
## will also help us better understand how other peoples functions work

## Lets start by creating a simple function

## This function takes an input and adds two to each value in the input. It then
## returns the "input + 2" vector
add.two <- function(number) {
  
  new_number <- number + 2
  
  return(new_number)
  
}

## Test the function
add.two(number=2)
add.two(c(1:10))

val1 <- "bananas"
val2 <- "apples"
c(val1, val2)
paste(val1, val2)


## We can create functions for a number of purposes with varying levels
## of complexity. This function will take a vector of x values, compute
## the logarithmic form of each, and plot them on a coordinate plane

plot_log <- function(xvals) {
  
  yvals <- log(xvals)
  
  plot(xvals, yvals)
}

## Lets test it
plot_log(xvals = c(1:1000))

# plot_log(xvals = seq(1, 1000, 100))

plot_log <- function(xvals) {
  
  if(class(xvals) == "character") {
    warning("Cannot take character vector as xval")
  }
  
  yvals <- log(xvals)
  
  plot(xvals, yvals)
}

plot_log(xvals = c("apple", "banana"))


## More often than not, any functions you create will be very pragmatic.
## Rather than creating transcendent new software that will grace the
## R community, you will write some clunky function that just prevents you
## from having to write the same code over and over again. Lets try
## an example of this.

movies <- read.csv("/Users/christianbaehr/Downloads/tmdb_5000_movies.csv", stringsAsFactors = F)
# table(movies$original_language)
# unique(movies$original_language)
# 
# movies$original_language[movies$original_language == "fr" | movies$original_language == ""] <- NA

# movies$original_language[movies$original_language=="es"] <- NA

## Here is a dataset with metadata from 5000 movies pulled from The Movie Database. We 
## want to evaluate how certain films perform relative to other films in the same genre.

## Lets do it together!!!

View(movies)

## Lets...take this part for granted for the time being
genre <- gsub('[\\"\\"]', "", regmatches(movies$genres[1], gregexpr('\\".*?\\"', movies$genres[1]))[[1]])

genre[genre != "id" & genre != "name"]
# genre[seq(3, 12, 3)]

genre <- gsub('[\\"\\"]', "", regmatches(movies$genres[2], gregexpr('\\".*?\\"', movies$genres[2]))[[1]])
genre[genre != "id" & genre != "name"]

movies$genres_clean <- NA

for(i in 1:nrow(movies)) {
  
  temp <- gsub('[\\"\\"]', "", regmatches(movies$genres[i], gregexpr('\\".*?\\"', movies$genres[i]))[[1]])
  temp <- temp[temp != "id" & temp != "name"]
  
  movies$genres_clean[i] <- list(temp)
  
}

movies$genres_clean[[3]]

movies[1, ]













