## Assignment 2 for R Programming Course
## Code based on example vector caching class

## Initializes a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set=set, get=get,
         setinv = setinv,
         getinv = getinv)
}


## Calculates the inverse of the special matrix object created by
## makeCacheMatrix, but first checks to see if the result was already
## calculated. If so, use the cached result.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data,...)
    x$setinv(inv)
    inv
}
