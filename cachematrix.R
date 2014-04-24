## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This will cache the matrix into a list so that the cacheSolve function will be able to retrieve it in other environments.
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  get_matrix<- function() x
  get_solved <- function(solve) m<<- solve
  get_solved <- function() m
  
  list(get_matrix = get_matrix, 
       get_solved=get_solved, 
       get_solved = get_solved)
  
  
}


## Write a short comment describing this function
#This function will return "retrieving matrix" if the solution to the matrix is already cached then return the cached value, if
#it doesn't, this function will solve the matrix to get the inverse
#th
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$get_solved()
  
  if(!is.null(m)) {
    message("retrieving cache")
    return(m)
  }
  
  data <- x$get_matrix()
  
  inverse_matrix <- solve(data)
  x$get_solved(inverse_matrix)
  inverse_matrix
}
