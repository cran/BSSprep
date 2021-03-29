\name{BSSprep}
\alias{BSSprep}
\title{
Whitening of Multivariate Data
}

\description{
A function for data whitening.

}

\usage{
BSSprep(X)
}

\arguments{
  \item{X}{A numeric matrix. Missing values are not allowed.}
}

\details{

A \eqn{p}-variate \eqn{{\bf Y}}{Y} with \eqn{T} observations is whitened, i.e. \eqn{{\bf Y}={\bf S}^{-1/2}({\bf X}_t - \frac{1}{T}\sum_{t=1}^T {\bf X}_{t})}{Y = S^(-1/2)*(X_t - (1/T)*sum_t(X_t))}, \if{html}{for \eqn{t = 1, \ldots, T},}
where \eqn{{\bf S}}{S} is the sample covariance matrix of \eqn{{\bf X}}{X}.

This is often need as a preprocessing step like in almost all blind source separation (BSS) methods. The function is implemented using C++ and returns the whitened data matrix as well as the ingredients to back transform.
}

\value{
 A list containing the following components:
  \item{Y }{The whitened data matrix.}
  \item{X.C }{The mean-centered data matrix.}
  \item{COV.sqrt.i }{The inverse square root of the covariance matrix of X.}
  \item{MEAN }{Mean vector of X.}
}

\author{
Markus Matilainen, Klaus Nordhausen
}


\examples{
n <- 100
X <- matrix(rnorm(10*n) - 1, nrow = n, ncol = 10)

res1 <- BSSprep(X)
res1$Y # The whitened matrix
colMeans(res1$Y) # should be close to zero
cov(res1$Y) # should be close to the identity matrix
res1$MEAN # Should hover around -1 for all 10 columns
}

\keyword{ multivariate }
\keyword{ ts }