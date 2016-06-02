## makeCacheMatrix creates a list of of 4 items, setting and
## getting the matrix, and the inverse of these.
## cacheSolve gives you the inverse of the matrix, if the matrix
## isn't already inversely computed. The function assumes that
## every matrix is invertible.

## Fill in as follows for example:
## variable <- makeCacheMatrix(matrix(rnorm(81),9))
## variable2 <- CacheSolve(variable)

makeCacheMatrix <- function(x = matrix()){
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}

## cacheSolve will report if data is already cached.
cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
