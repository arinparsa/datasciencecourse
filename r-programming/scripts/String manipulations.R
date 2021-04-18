# Apply siblings homework
library(stringr)

m1 <- matrix(c <- (1:10), nrow=5, ncol=6)
apply(m1, 2, mean)

numero <- c("1", "6", "2", "4", "21", "7", "87")
numero <- as.numeric(numero)
lapply(iris$Sepal.Length, sum)

iris <- iris

cars <- cars

lsum <- lapply(cars$speed, min)
ssum <- sapply(cars$speed, min)

lsum
ssum

tapply(iris$Sepal.Width, iris$Species, median)

#Dplyr exercises

library(dplyr)

iris3 <- select(iris, c(1:3))

head(iris3)

other_iris <- select(iris, -4)

head(other_iris)

select(iris, starts_with("P"))

filter(iris, iris$Sepal.Length>=4.6, iris$Petal.Width>=1.5)

iris %>% select(1, 2)

iris %>% arrange(2)

iris %>% select(c(1:3)) %>% arrange(1, 2)

iris %>% mutate(proportion = Sepal.Length/Sepal.Width)

iris %>% summarize(avg_length = mean(Sepal.Length))

iris %>% group_by(Sepal.Length) %>% summarize(avg_slength = mean(Sepal.Length))

#string exercises
x <- "\\"
x <- "\\"
x <- c("\"", "\\")
writeLines(x)
y <- c("bac", NA)
str_c("|-", y, "-|")
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
str_to_upper(c("i", "ı"), locale = "tr")
z = c("b", "c", "a")
str_c(z, sep = ",")
str_c(z, sep = ", ")
str_c("x", "y", sep = ", ")
str_c("a", "b", "c", sep = ",")
str_c("a", "b", "c", collapse = ",")
x <- c("apple", "banana", "pear")
str_view(x, "an")
install.packages("htmlwidgets")
x <- c("apple", "banana", "pear")
str_view(x, "an")
str_view("gray", "abc", ("a"|"e"|"i"|"o"|"u"))
str_view("gray", "abc", "^(a|e|i|o|u)")
x <- c("apple pie", "apple", "apple cake")
str_view(x, "apple")
# Look for a literal character that normally has special meaning in a regex
str_view(c("abc", "a.c", "a*c", "a c"), "a[.]c")
str_view(c("abc", "a.c", "a*c", "a c"), ".[*]c")
str_view(c("abc", "a.c", "a*c", "a c"), "a[ ]")
str_view(c("grey", "gray"), "gr(e|a)y")
x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
str_view(x, "CC+")
str_view(x, 'C[LX]+')

library(dplyr)

s <- c("Scooby", "Doo")
str_c(str_c(s, collapse = "-"), "!")

sentence <- (sentences[1])
sentence <- str_to_lower(sentence, local = "en")
sentence <- gsub('[[:punct:] ]+',' ', sentence)
sentence <- strsplit(sentence, " ")
frequencies <- table(sentence)
barplot(frequencies)

v <- "Harry Potter says 'what'?"
v <- str_to_lower(v, local = "en")
v <- gsub('[[:punct:] ]+',' ', v)
str_replace(v, "harry potter says what ", "i ate 3 tacos")


g <- scan("scripts/text.txt", "character", sep = "\n")
g <- str_to_lower(g, locale = "en")
g <- gsub('[[:punct:] ]+',' ', g)
g <- strsplit(g, " ")
g_frequencies <- table(g)
barplot(g_frequencies, main = "Animal Farm Text Analysis")
