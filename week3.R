#1
s <- split(iris, iris$Species)
lapply(s, function(x) colMeans(x[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]))
# or 
tapply(iris$Sepal.Length, iris$Species, mean)



#2
apply(iris[,1:4], 2, mean)
# or
colMeans(iris[,1:4])

#3
with(mtcars, tapply(mpg, cyl, mean))
# or
s <- split(mtcars, mtcars$cyl)
lapply(s, function(x) mean(x$mpg))


#4
s <- split(mtcars, mtcars$cyl)
mhps <- lapply(s, function(x) mean(x$hp))
mhps$`4` - mhps$`8`