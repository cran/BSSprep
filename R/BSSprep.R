# a wrapper for BSSprep
BSSprep <- function(X) {
  .Call("PREPBSS", X, PACKAGE = "BSSprep") #calling the function PREPBSS
}