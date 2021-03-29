#include "BSSprep.h"
#include <Rcpp.h>
#include <cmath>
//#include <RcppArmadillo.h>
//#include <R.h>
//#include <Rdefines.h>
//#include <Rinternals.h>

using namespace Rcpp;
using namespace arma;

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::export]]

SEXP PREPBSS(SEXP X){  
  mat x = as<arma::mat>(X); 
  int N = x.n_rows;

  arma::rowvec MEAN = mean(x,0);
  mat xc = x.each_row() - MEAN;
  mat S = xc.t()*xc/(N-1);
  vec eigvalS;
  mat eigvecS;
  eig_sym(eigvalS,eigvecS,S);
  vec SqrtEigvalSI = 1/sqrt(eigvalS);
  mat EVS = diagmat( SqrtEigvalSI );
  mat SqrtI = eigvecS * EVS * eigvecS.t();
  mat y = xc * SqrtI;
  return Rcpp::List::create(Rcpp::Named("Y") = y,
                              Rcpp::Named("X.C") = xc,
                              Rcpp::Named("COV.sqrt.i") = SqrtI,
                              Rcpp::Named("MEAN") = MEAN
    );
} //Code was originally in package tsBSS
