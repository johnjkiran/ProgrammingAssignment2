## This function will return the inverse of the matrix provided
## If the matrix inverse has already been ejaculated, then result would be extracted from 
## from the cached memory, rather than re-computing the same matrix. This saves lot of time and computation power 

## This function creates a special matrix, which is the list containing four functions
## setting the value of the matrix, getting the value of the matrix,setting the value of the inverse matrix
## and getting the value of the inverted matrix 

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
setmatrix <- function(y) {
                x <<- y
                m <<- NULL
        }
getmatrix <- function() x
setinverse<- function(inverse) m <<- inverse
getinverse<- function() m
list(setmatrix = setmatrix, getmatrix = getmatrix,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function calculates the inverse of the special matrix created with the above function. 
## if the inverse is already calculated, then the result is returned from the cached memory

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()  
if(!is.null(m)) {
	message("getting cached matrix")
	return(m)
        }
data <- x$getmatrix()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
