## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(X = matrix()) {
inverse <- NULL
set <- function(Y){
	X <<- Y
	inverse <<- NULL
	}
get <- function() X
setinverse <- function(Inverse) inverse <<- Inverse
getinverse <- function() inverse
list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(X, ...) 
{
if(require("corpcor")){
	print("corpcor library is loaded")
	} else {
		print("installing corpcor")
		install.packages("corpcor")
		if(require(corpcor)){
			print("corpcor installed and loaded")
			} else {
			stop("could not install corpcor")
			}
		}
inverse <- X$getinverse()
if(!is.null(inverse)){
	message("matrix is stored in memory")
	return(inverse)
	}
message("inverse is not in memory")
data <- X$get()
inverse <- pseudoinverse(data, ...)
X$setinverse(inverse)
inverse
}
