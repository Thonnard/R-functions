# calculate viewing angle

# a = interstimulusdistance
# b = viewing distance
# result = viewing angle in degrees 

vangle <- function(a, b){
if(!is.numeric(a)) stop("Please enter a numeric value!\n")
if(!is.numeric(b)) stop("Please enter a numeric value!\n")
x <- a/2
s <- sqrt(x^2 + b^2)
os <- x/s
rad <- asin(os)
deg <- rad * (180/pi)
angle <- 2 * deg
angle
}
