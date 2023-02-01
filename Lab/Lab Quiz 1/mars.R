# Lab Quiz 1 Solution Template
mars <- function(formula, data, control){ 
  fwd_out <- fwd_stepwise() 
  bwd_out <- bwd_stepwise(fwd_out) 
  return(bwd_out) 
}

mars.control <- function(){
  control_lst<-list()
  return(control_lst)
}

fwd_stepwise <- function(){
  fwd_lst <- list()
  return(fwd_lst)
}

bwd_stepwise <- function(bwd_in){ 
  bwd_lst <- list()
  return(bwd_lst)
}
