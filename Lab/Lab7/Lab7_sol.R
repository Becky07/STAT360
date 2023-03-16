# Hinge Function

h <- function(x,s,t) {
  return(pmax(0,s*(x-t)))
}