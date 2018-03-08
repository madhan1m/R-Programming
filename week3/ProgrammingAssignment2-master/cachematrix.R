# See README.md for instructions on running the code and output from it

# makeCacheMatrix - A function that returns a list of functions

# Its puspose is to store a martix and a cached value of the inverse of the 

# matrix. Contains the following functions:

# * setMatrix      set the value of a matrix

# * getMatrix      get the value of a matrix

# * cacheInverse   get the cahced value (inverse of the matrix)

# * getInverse     get the cahced value (inverse of the matrix)

#

makeCacheMatrix <- function(x = numeric()) {
  
  # holds the cached value or NULL if nothing is cached
 
  # initially nothing is cached so set it to NULL
  
  cache <- NULL

  # store a matrix
  
  setMatrix <- function(newValue) {
    
    x <<- newValue
    
    # since the matrix is assigned a new value, flush the cache
    
    cache <<- NULL
    
  }
  
  # returns the stored matrix
  
  getMatrix <- function() {
    
    x
    
  }
  
  # cache the given argument 
  
  cacheInverse <- function(minv) {
    
    cache <<- minv
    
  }
  
  # get the cached value
  
  getInverse <- function() {
    
    cache
    
  }
  
  # return a list. Each named element of the list is a function
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
  
}


# The following function calculates the inverse of a "special" matrix created with 

# makeCacheMatrix

cacheSolve <- function(y, ...) {
  
  # get the cached value
  
  inverse <- y$getInverse()
  
  # if a cached value exists return it
  
  if(!is.null(inverse)) {
    
    message("Found cached data")
    
    return(inverse)
    
  }
  
  # otherwise get the matrix, caclulate the inverse and store it in the cache
  
  data <- y$getMatrix()
  
  inverse <- solve(data)
  
  y$cacheInverse(inverse)
  
  
  # return the inverse
  
  inverse
  
}


# Execution and sample working. You can replace A with any matrix

A = matrix( c(1,2,3,0,1,4,5,6,0), nrow=3, ncol=3, byrow = TRUE)

A

matA <- makeCacheMatrix(A)

matA

cacheSolve(matA)

# Note the second time cacheSolve is called the data should be retrieved from

# the cache instead of computing the inverse

cacheSolve(matA)