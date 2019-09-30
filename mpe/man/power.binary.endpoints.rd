\name{power.binary.endpoints}
\alias{power.binary.endpoints}
\title{Multiple Co-Primary Binary Endpoints}
\description{
 The function calculates either sample size or power for multiple co-Primary binary endpoint.
}
\usage{
power.binary.endpoints <- function(K= NULL, n = NULL, p1 = NULL,p2 = NULL, Sigma, SD, rho, sig.level = 0.05, power = NULL, method = "arcsine", tol = .Machine$double.eps^0.25)
}

\arguments{
  \item{K}{number of co-primary binary endpoints}
  \item{n}{optional: sample size}
  \item{p1}{success proportions or probaility in test}
  \item{p2}{success proportions or probaility in control}
  \item{Sigma}{known covariance matrix (dimension \code{K} x \code{K})}
  \item{SD}{known standard deviations (length \code{K})}
  \item{rho}{known correlations (length \code{0.5*K*(K-1)})}
  \item{sig.level}{significance level (Type I error probability)}
  \item{power}{optional: power of test (1 minus Type II error probability)}
  \item{method}{character string specifing which method to use, either
    \code{"arcsine"} or\code{"arcsine-cc"} or \code{"chisquare"} or
    \code{"chisquare-cc"}}
  \item{tol}{the desired accuracy for \code{\link[stats]{uniroot}}.}
}

\details{
The function can be used to either compute sample size or power for continuous
multiple co-Primary binary endpoint by an asymptotic chi-square and an arcsine method with
and without continuity correction. The implementation is based on the formulas given in the reference below.

  The null hypothesis reads \eqn{$\pi_{Tk}-\pi_{Ck}\le 0$}{pi_Tk-pi_Ck <= 0} for
  at least one \eqn{$k\in\{1,\ldots,K\}$}{k in {1,...,K}} where Tk is treatment k,
  Ck is control k and K is the number of co-primary binary endpoints.

  One has to specify either \code{n} or \code{power}, the other parameter is
  determined. Moreover, either covariance matrix \code{Sigma} or standard
  deviations \code{SD} and correlations \code{rho} must be given.
}
\value{
Object of class \code{power.bmpe.test}, a list of arguments (including the
computed one) augemented with method and note elements.
}
\references{

  Sozu, T. and Sugimoto, T. and Hamasaki, T. and Evans, S.R. (2015). \emph{Sample
  Size Determination in Clinical Trials with Multiple Endpoints}. Springer Briefs in
  Statistics, ISBN 978-3-319-22005-5.
}
\seealso{ \code{\link{power.unknown.var}},\code{\link{power.known.var}} \code{\link{atleast.one.endpoint}} }
\examples{

## default arcsine
power.binary.Endpoints(K = 2,p1 = 0.55, p2 = 0.50, Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2),
                      power = .80,  sig.level = 0.025)

##arcsine
power.binary.Endpoints(K = 2,p1 = 0.55, p2 = 0.50, Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2),
                      power = .80,  sig.level = 0.025, method = "arcsine")
                      
##arcsine with continuity correction
power.binary.Endpoints(K = 2,p1 = 0.55, p2 = 0.50, Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2),
                      power = .80,  sig.level = 0.025, method = "arcsine-cc")
                 
##chi sqaure
power.binary.Endpoints(K = 2,p1 = 0.55, p2 = 0.50, Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2),
                      power = .80,  sig.level = 0.025, method = "chisquare")  

##chi square with continuity correction 
power.binary.Endpoints(K = 2,p1 = 0.55, p2 = 0.50, Sigma = matrix(c(1, 0.5, 0.5, 1), nrow = 2),
                      power = .80,  sig.level = 0.025, method = "chisquare-cc")
                 
                 

}
\keyword{htest}
\keyword{multivariate}
