patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata

diabetes <- factor(diabetes)
status <- factor(status, ordered = TRUE)
patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata)
summary(patientdata)

g <- "My First List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow = 5)
k <- c("one", "two", "three")
mylist <- list(title = g, ages = h, j, k)
mylist

mydata <- data.frame(age = numeric(0), gender = character(0), weight = numeric(0))
mydata <- edit(mydata)
mydata

data1 <- read.csv("data1.csv", header = TRUE)
data1

library(xlsx)
data2 <- read.xlsx("./data2.xlsx", 1)
data2

