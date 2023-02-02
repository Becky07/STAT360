## 1. Simulate some test data as follows:
set.seed(1)
x1 <- 1:100
x2 <- rnorm(100)
x3 <- rnorm(100)
y <- x1+rnorm(100)
data <- data.frame(y,x1,x2,x3)

## 2. Write a couple of lines of R code to (i) fit a model with `lm()`
# with response variable y and predictors x1, x2 and x3 and (ii) use
# `step()` on the fitted model to do stepwise model reductions.
# In your call to lm, use the `.` in your formula and pass it the 
# data frame constructed in the code chunk.

fit <- lm(y ~ ., data = data)
sfit <- step(fit)
# summary(sfit)
# sfit$anova

## 3.
mars <- function(formula, data, control){ 
  fwd_out <- fwd_stepwise(formula, data) 
  bwd_out <- bwd_stepwise(fwd_out) 
  return(bwd_out) 
}


mars.control <- function(){
  control_list<-list()
  return(control_list)
}


fwd_stepwise <- function(formula, data){
  fwd_list = lm(formula, data)
  return(fwd_list)
}


bwd_stepwise <- function(bwd_in){ 
  bwd_list = step(bwd_in)
  return(bwd_list)
}

# Test mars()
mars(y ~., data=data)

## 4.
testdata = data
rm(data)
mars(y ~., data = testdata) # causes error
traceback()

# Modify bwd_stepwise() and mars()
mars <- function(formula, data, control){ 
  fwd_out <- fwd_stepwise(formula, data) 
  bwd_out <- bwd_stepwise(fwd_out, data) 
  return(bwd_out) 
}

bwd_stepwise <- function(bwd_in){ 
  bwd_list = step(bwd_in, data)
  return(bwd_list)
}

# Test mars()
mars(y ~., data = testdata) # works after modifications