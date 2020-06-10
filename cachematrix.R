## Put comments here that give an overall description of what your
## functions do

#makeCacheMatrix() creates an R object that stores a matrix and it's inverse.The second function, cacheSolve() requires an arguement that is returned by makeCacheMatrix() in order to retrieve the inverse from the cached value that is stored in the makeCacheMatrix() object's environment.

## Write a short comment describing this function

#This function returns a list that contains four functions: set(), get(), setinverse(), getinverse(). It also includes two data objects, x and im.

makeCacheMatrix <- function(x = matrix()) {
    im<-NULL
    set<-function(y){
        x<<-y
        im<<-NULL
    }
    get<-function()x
    setInverse<-function(solve) im<<-solve
    getInverse<-function() im
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    im<-x$getInverse()
    if(!is.null(im)){
        message("getting cached data")
        return(im)
    }
    data<-x$get()
    im<-solve(data,...)
    x$setInverse(im)
    im
    }

