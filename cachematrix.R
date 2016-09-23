## The below functions make it easy to cache a matrix
## 

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}


#set up small matrix for input
x <- diag(7,5)
x
     [,1] [,2] [,3] [,4] [,5]
[1,]    7    0    0    0    0
[2,]    0    7    0    0    0
[3,]    0    0    7    0    0
[4,]    0    0    0    7    0
[5,]    0    0    0    0    7

#below function returns inverse of matric provided above
cacheSolve(CachedMarix)
          [,1]      [,2]      [,3]      [,4]      [,5]
[1,] 0.1428571 0.0000000 0.0000000 0.0000000 0.0000000
[2,] 0.0000000 0.1428571 0.0000000 0.0000000 0.0000000
[3,] 0.0000000 0.0000000 0.1428571 0.0000000 0.0000000
[4,] 0.0000000 0.0000000 0.0000000 0.1428571 0.0000000
[5,] 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571

