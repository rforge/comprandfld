\name{HypoTest}
\alias{HypoTest}
\title{Statistical Hypothesis Tests for Nested Models}
\description{
  The function performs statistical hypothesis tests for nested models
  based on composite likelihood versions of: Wald-type, score-type and
  Wilks-type (likelihood ratio) statistics.
}

\usage{
HypoTest(object1, object2, \dots, statistic)
}

\arguments{
  \item{object1}{An object of class \code{FitComposite}.}
  \item{object2}{An object of class \code{FitComposite} that is a nested
    model within \code{object1}.}
  \item{\dots}{Further successively nested objects.}
  \item{statistic}{String; the name of the statistic used within the
  hypothesis test (see \bold{Details}).}
}


\details{
  The implemented hypothesis tests for nested models are based on the
  following statistics:
  \enumerate{
     \item Wald-type (\code{Wald});
     \item Score-type, also known as Rao-type (\code{Rao});
     \item Wilks-type; also known as the composite likelihood ratio
     statistic. Available are variants of the basic version, in particular:
     \itemize{
       \item Rotnitzky and Jewell adjustment (\code{WilksRJ});
       \item Satterhwaite adjustment (\code{WilksS});
       \item Chandler and Bate adjustment (\code{WilksCB});
       \item Pace, Salvan and Sartori adjustment (\code{WilksPSS});
     }
   }

 More specifically,
 consider an \eqn{p}-dimensional random vector \eqn{\mathbf{Y}}{Y} with
 probability density function \eqn{f(\mathbf{y};\mathbf{\theta})}{f(y;theta)},
where \eqn{\mathbf{\theta} \in \Theta}{theta in Theta} is a
\eqn{q}-dimensional vector of parameters. Suppose that
\eqn{\mathbf{\theta}=(\mathbf{\psi},\mathbf{\tau})}{theta=(psi, tau)}
 can be partitioned in a \eqn{q'}-dimensional subvector \eqn{\psi}{psi}
 and \eqn{q''}-dimensional subvector \eqn{\tau}{tau}. Assume also to be
 interested in testing the specific values of the vector
 \eqn{\psi}{psi}. Then, one can use some statistical
 hypothesis tests for testing the null hypothesis \eqn{H_0:
 \psi=\psi_0}{H_0: psi=psi_0} against the alternative \eqn{H_1:
 \psi \neq \psi_0}{H_1: psi <> psi_0}. Composite likelihood versions
of 'Wald' and 'score' statistics have the usual asymptotic
chi-square distribution with \eqn{q'} degree of freedom. The Wald-type statistic is
\deqn{W=(\hat{\psi}-\psi_0)^T (G^{\psi \psi})^{-1}(\hat{\theta})(\hat{\psi}-\psi_0),}{%
W=(hat{psi}-psi_0)^T (G^{psi psi})^{-1} (hat{theta})(hat{psi}-psi_0),}
where \eqn{G_{\psi \psi}}{G_{psi psi}} is the \eqn{q' \times q'}{q' x q'}
 submatrix of the Godambe information pertaining to \eqn{\psi}{psi} and
 \eqn{\hat{\theta}}{hat{theta}} is the maximum likelihood estimator from
 the full model. The score-type statistic (Rao-type) is
 \deqn{W=s_{\mathbf{\psi}}\{\mathbf{\psi}_0,
 \hat{\mathbf{\tau}}(\mathbf{\psi}_0)\}^T H^{\psi
   \psi}(\hat{\theta}_\psi) \{G^{\psi \psi}(\hat{\theta}_\psi)\}^{-1}
 H^{\psi \psi}(\hat{\theta}_\psi)
 s_{\mathbf{\psi}}\{\mathbf{\psi}_0, \hat{\mathbf{\tau}}(\mathbf{\psi}_0)\},}{%
   W=s_{psi}{psi_0, hat{tau}(psi_0)}^T H^{psi psi}(hat{theta}_psi)
   \{G^{psi psi}(hat{theta}_psi)\}^{-1} H^{psi psi}(hat{theta}_psi)
   s_{psi}{psi_0, hat{tau}(psi_0)},}
 where \eqn{H^{\psi \psi}}{H^{psi psi}} is the \eqn{q' \times q'}{q' x q'}
 submatrix of the inverse of \eqn{H(\theta)}{H(theta)} pertaining to
 \eqn{\psi}{psi} (the same for \eqn{G}) and
 \eqn{\hat{\theta}_\psi}{hat{theta}_psi} is the constrained maximum
 likelihood estimate of \eqn{\theta}{theta} for fixed \eqn{\psi}{psi}.
 These two statistics can be called from the
 routine \code{HypoTest} assigning at the argument \code{statistic}
 respectively the values: \code{Wald} and \code{Rao}.


 Alternatively to the Wald-type and score-type statistics one can use the
 composite version of the Wilks-type or likelihood ratio statistic, given by
 \deqn{W=2[C \ell(\hat{\mathbf{\theta}};\mathbf{y}) - C \ell\{\mathbf{\psi}_0,
   \hat{\mathbf{\tau}}(\mathbf{\psi}_0);\mathbf{y}\}].}{%
 W=2[Cl(hat{theta};y) - Cl{psi_0, hat{tau}(psi_0);y}].}
 The asymptotic distribution of the composite likelihood ratio statistic
 is given by
 \deqn{W \dot{\sim} \sum_{i} \lambda_i \chi^2,}{%
   W ~ sum_i lambda_i Chi^2_i,}
 for \eqn{i=1,\ldots,q'}{i=1,...,q'}, where \eqn{\chi^2_i}{Chi^2_i} are
 \eqn{q'} iid copies of a chi-square one random variable and
 \eqn{\lambda_1,\ldots,\lambda_{q'}}{lambda_1,...,lambda_{q'}}
 are the eigenvalues of the matrix \eqn{(H^{\psi \psi})^{-1} G^{\psi
 \psi}}{(H^{psi psi})^-1 G^{psi psi}}. There exist several adjustments
 to the composite likelihood ratio statistic in order to get an
 approximated \eqn{\chi^2_{q'}}{Chi^2_{q'}}. For example, Rotnitzky and Jewell
 (1990) proposed the adjustment \eqn{W'= W / \bar{\lambda}}{W'= W /
   bar{lambda}} where \eqn{\bar{\lambda}}{bar{lambda}} is the average
 of the eigenvalues \eqn{\lambda_i}{lambda_i}. This statistic can be
 called within the routine by the value: \code{WilksRJ}. A better
 solution is proposed by Satterhwaite (1946) defining \eqn{W''=\nu W /
 (q' \bar{\lambda})}{W''= nu W / (q' bar{lambda})}, where \eqn{\nu=(\sum_i
 \lambda)^2 / \sum_i \lambda^2_i}{nu = sum_i lambda / sum_i lambda^2_i} for
\eqn{i=1\ldots,q'}{i=1...,q'}, is the effective number of the degree of
freedom. Note that in this case the distribution of the likelihood ratio
 statistic is a chi-square random variable with \eqn{\nu}{nu} degree of
 freedom. This statistic can be called from the routine assigning the
 value: \code{WilksS}. For the adjustments suggested by Chandler and
 Bate (2007) and Pace, Salvan and Sartori (2011) we refere to the articles (see
 \bold{References}), these versions can be called from the routine assigning
 respectively the values: \code{WilksCB} and \code{WilksPSS}.

}

\value{
 An object of class \code{c("data.frame")}. The object contain a table
 with the results of the tested models. The rows represent the
 responses for each model and the columns the following results:
 \item{Num.Par}{The number of the model's parameters.}
 \item{Diff.Par}{The difference between the number of parameters of the model in the previous row
   and those in the actual row.}
 \item{Df}{The effective number of degree of freedom of the chi-square distribution.}
 \item{Chisq}{The observed value of the statistic.}
 \item{Pr(>chisq)}{The p-value of the quantile
 \code{Chisq} computed using a chi-squared distribution with \code{Df} degrees
    of freedom.}
}

\references{

Chandler, R. E., and Bate, S. (2007). Inference for Clustered Data Using the
Independence log-likelihood. \emph{Biometrika}, \bold{94}, 167--183.

Pace, L., Salvan, A. and Sartori, N. (2011). Adjusting Composite
Likelihood Ratio Statistics. \emph{Statistica Sinica}, \bold{21}, 129--148.

Rotnitzky, A. and Jewell, N. P. (1990). Hypothesis Testing of Regression
Parameters in Semiparametric Generalized Linear Models for Cluster
Correlated Data. \emph{Biometrika}, \bold{77}, 485--497.

Satterthwaite, F. E. (1946). An Approximate Distribution of Estimates of
Variance Components. \emph{Biometrics Bulletin}, \bold{2}, 110--114.

Varin, C., Reid, N. and Firth, D. (2011). An Overview of Composite
Likelihood Methods. \emph{Statistica Sinica}, \bold{21}, 5--42.

}

\author{Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{http://faculty.unibocconi.it/simonepadoan};
  Moreno Bevilacqua, \email{moreno.bevilacqua@uv.cl},
  \url{https://sites.google.com/a/uv.cl/moreno-bevilacqua/home}.}

\seealso{
  \command{\link{FitComposite}}.
}
\examples{
# Please remove the symbol hashtag to run the code

library(CompRandFld)
library(RandomFields)
set.seed(3451)

# Define the spatial-coordinates of the points:
x <- runif(300, 0, 10)
y <- runif(300, 0, 10)

################################################################
###
### Example 1. Composite likelihood-based hypothesis testing.
### Simulation of a Gaussian spatial random field with
### stable correlation.
### Estimation by composite likelihood using the setting:
### marginal pairwise likelihood objects.
###
###############################################################

# Set the model's parameters:
corrmodel <- "stable"
mean <- 0
sill <- 1
nugget <- 1
scale <- 1
power <- 1.3

# Simulation of the spatial Gaussian random field:
data <- RFsim(x, y, corrmodel=corrmodel, param=list(mean=mean,
              sill=sill,nugget=nugget,scale=scale,power=power))$data

# Maximum composite-likelihood fitting of the random field, full model:
fit1 <- FitComposite(data, x, y, corrmodel=corrmodel, maxdist=5,
                    varest=TRUE,start=list(mean=mean,power=power,scale=scale,sill=sill),
                    fixed=list(nugget=1))

# Maximum composite-likelihood fitting of the random field, first nasted model:
fit2 <- FitComposite(data, x, y, corrmodel=corrmodel, maxdist=5,
                    varest=TRUE,start=list(mean=mean,power=power,scale=scale),
                    fixed=list(nugget=1,sill=1))

# Maximum composite-likelihood fitting of the random field, second nasted model:
fit3 <- FitComposite(data, x, y, corrmodel=corrmodel, maxdist=5,
                    varest=TRUE,start=list(scale=scale),
                    fixed=list(nugget=1,sill=1,mean=0,power=1.3))

# Hypothesis testing results:
# composite Wald-type statistic:
HypoTest(fit1, fit2, fit3, statistic='Wald')

# composite score-type statistic:
HypoTest(fit1, fit2, fit3, statistic='Rao')

# composite likelihood ratio statistic with RJ adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksRJ')

# composite likelihood ratio statistic with S adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksS')

# composite likelihood ratio statistic with CB adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksCB')

# composite likelihood ratio statistic with PSS adjustment:
HypoTest(fit1, fit2, fit3, statistic='WilksPSS')

}
\keyword{spatial}
