\name{gausspred}
\alias{gausspred}
\title{Gauss predictor}
\description{Prediction intervals based on the Gauss linear model}
\usage{gausspred(train,test,epsilons=c(0.05,0.01))}

\arguments{
  \item{train}{Training set as a matrix of size \eqn{N} times \eqn{K+1}.
    Each row describes an observation.
    Columns \eqn{1} to \eqn{K} are the explanatory variables,
    and column \eqn{K+1} is the response variables.}
  \item{test}{Test set as a matrix of size \eqn{N_2}{N2} times \eqn{K}.
    Each row corresponds to an observation
    (but without the response variable).
    Columns \eqn{1} to \eqn{K} are the explanatory variables.}
  \item{epsilons}{Vector of several significance levels.
     Each significance level \code{epsilons}[\eqn{j}] is a number between 0 and 1.
     The default value is (5\%,1\%).}
}

\value{The output is a list of three elements.
  \item{output[[1]]}{The matrix of lower bounds of prediction intervals.
    Its size is \eqn{N_2}{N2} times \eqn{N_{\epsilon}}{Neps},
    where \eqn{N_2}{N2} is the number of test observations
    and \eqn{N_{\epsilon}}{Neps} is the number of significance levels.
    The element \code{output[[1]]}[\eqn{i},\eqn{j}] of \code{output[[1]]}
    is the lower bound \eqn{a} of the prediction interval \eqn{[a,b]}
    for the \eqn{i}{i-}th test observation
    and for the \eqn{j}{j-}th significance level \code{epsilons}[\eqn{j}]
    in the vector \code{epsilons}.}
  \item{output[[2]]}{The matrix of upper bounds \eqn{b},
    with the same structure as \code{output[[1]]}.
    Typically \eqn{a = }\code{output[[1]]}[\eqn{i},\eqn{j}]
    and \eqn{b = }\code{output[[2]]}[\eqn{i},\eqn{j}] are real numbers
    such that \eqn{a\le b}{a <= b}.
    Exceptions: \eqn{a} is allowed to be \eqn{-\infty}{-infinity}
    and \eqn{b} is allowed to be \eqn{\infty}{infinity};
    the only case where \eqn{a > b}
    is \eqn{a=\infty}{a = infinity} and \eqn{b=-\infty}{b = - infinity}
    (the empty prediction \eqn{[a,b]}).}
  \item{output[[3]]}{The termination code:
    0 = normal termination;
    1 = illegal parameters
      (the training and test sets have different numbers of explanatory variables);
    2 = too few observations.}
}

\references{
  Vovk, V., Nouretdinov, I., and Gammerman, A. (2009)
  On-line predictive linear regression.
  \emph{Annals of Statistics} 37, 1566 - 1590.
  This paper describes this standard textbook procedure
  and its properties when used in the on-line mode.
}

\examples{
  train <- matrix(c(1,2,3,4, 2.01,2.99,4.01,4.99), nrow=4, ncol=2);
  test <- matrix(c(0,10,20), nrow=3, ncol=1);
  output <- gausspred(train,test,c(0.05,0.2));
  print(output[[1]]);
  print(output[[2]]);
}

\keyword{models}
\keyword{regression}
