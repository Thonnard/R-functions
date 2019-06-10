### Translation of STEYX function Excel > R
### Returns the standard error of the predicted y-value for each x in the regression.
### http://office.microsoft.com/en-au/excel-help/steyx-function-HP010062545.aspx

### David Thonnard
### v1. 21/05/2014
### thonnard.david@gmail.com

steyx <- function(x,y) {
# check parameters
if (missing(x))
        stop("Specify x!")
if (missing(y))
        stop("Specify y!")
if (length(x)!=length(y))
	stop("X and Y not of the same length...")

# calculations
n <- length(x)
a <- sqrt((1/(n-2))*(sum((y-mean(y))^2)-((sum((x-mean(x))*(y-mean(y))))^2)/(sum((x-mean(x))^2))))

# result
return(a)
}
