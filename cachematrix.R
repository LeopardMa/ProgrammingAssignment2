## This is a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        inver <- NULL
        set <- function(y) {
                x <<- y
                inver <<- NULL
        }
        get <- function() x
        setinver <- function(Matrinver) inver <<- Matrinver
        getinver <- function() inver
        list(set = set, get = get,
             setinver = setinver,
             getinver = getinver)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inver <- x$getinver()
        if(!is.null(inver)) {
                message("getting cached data")
                return(inver)
        }
        data <- x$get()
        inver <- solve(data, ...)
        x$setinver(inver)
        inver
}
