\name{iidpred}
\alias{iidpred}
\title{IID predictor}
\description{Prediction intervals based on the IID model}
\usage{iidpred(train,test,epsilons=c(0.05,0.01),ridge=0)}

\arguments{
  \item{train}{Training set as a matrix of size $N\times(K+1)$.
    Each row describes an observation.
    Columns 1 to $K$ are the explanatory variables,
    and column $K+1$ is the response variables.}
  \item{test}{Test set as a matrix of size $N_2\times K$.
    Each row corresponds to an observation
    (but without the response variable).
    Columns 1 to $K$ are the explanatory variables.}
  \item{epsilons}{Vector of several significance levels.
     Each significance level is $\epsilon\in(0,1)$.
     The default value is $(5\%,1\%)$.}
  \item{ridge}{Ridge coefficient, a nonnegative number.
     The default value is 0;
     setting it to a small positive constant might lead to more stable results.}
}

\value{The output is a list of three elements.
  \item{output[[1]]}{The matrix of lower bounds of prediction intervals.
    Its size is $N_2\times N_{\epsilon}$,
    where $N_2$ is the number of test observations
    and $N_{\epsilon}$ is the number of significance levels.
    The element \code{output[[1]]}${}_{i,j}$ of \code{output[[1]]}
    is the lower bound $a$ of the prediction interval $[a,b]$
    for the $i$th test observation
    and for the $j$th significance level $\epsilon_j$
    in the vector \code{epsilons}.}
  \item{output[[2]]}{The matrix of upper bounds $b$,
    with the same structure as \code{output[[1]]}.
    Typically $a={}$\code{output[[1]]}${}_{i,j}$
    and $b={}$\code{output[[2]]}${}_{i,j}$ are real numbers
    such that $a\le b$.
    Exceptions: $a$ is allowed to be $-\infty$
    and $b$ is allowed to be $\infty$;
    the only case where $a>b$
    is $a=\infty$ and $b=-\infty$ (empty prediction $[a,b]=\emptyset$).}
  \item{output[[3]]}{The termination code:
    0 = normal termination;
    1 = illegal parameters
      (the training and test sets have different numbers of explanatory variables);
    2 = too few observations for all significance levels.}
}

\references{
  Vovk, V., Nouretdinov, I., and Gammerman, A. (2008)
  On-line predictive linear regression.
  \emph{Annals of Statistics} (to appear).
  The new arXiv version (\texttt{http://arxiv.org/abs/math/0511522}, to appear)
  will contain the description of this program
  (and of the package PredictiveRegression in general).

  Vovk, V., Gammerman, A., and Shafer, G. (2005)
  \emph{Algorithmic Learning in a Random World}.
  New York: Sprinder.
  This program implements the algorithm described on pages 30--34
  of this book.
}

\examples{
  train <- array(0,c(4,2));
  test <- array(0,c(3,1));
  train[1:4,1] <- c(0,10,20,30);
  train[1:4,2] <- c(1.01,10.99,21.01,30.99);
  test[1:3,1] <- c(5,15,25);
  output <- iidpred(train,test,c(0.05,0.2),0.01);
  print(output[[1]]);
  print(output[[2]]);
}

\keyword{models}
\keyword{regression}
