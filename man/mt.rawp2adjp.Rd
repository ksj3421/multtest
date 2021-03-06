\name{mt.rawp2adjp}
\alias{mt.rawp2adjp}
\title{Adjusted p-values for simple multiple testing procedures}
\description{
  This function computes adjusted \eqn{p}-values for simple
  multiple testing procedures from a vector of raw (unadjusted)
  \eqn{p}-values. The procedures include the Bonferroni, Holm (1979),
  Hochberg (1988), and Sidak procedures for strong control of the
  family-wise Type I error rate (FWER), and the Benjamini & Hochberg
  (1995) and Benjamini & Yekutieli (2001) procedures for (strong)
  control of the false discovery rate (FDR).  The less conservative
  adaptive Benjamini & Hochberg (2000) and two-stage Benjamini & Hochberg
  (2006) FDR-controlling procedures are also included.
}
\usage{
mt.rawp2adjp(rawp, proc=c("Bonferroni", "Holm", "Hochberg", "SidakSS", "SidakSD",
"BH", "BY","ABH","TSBH"), alpha = 0.05, na.rm = FALSE)
}
\arguments{
  \item{rawp}{A vector of raw (unadjusted) \eqn{p}-values for each
    hypothesis under consideration. These could be nominal
    \eqn{p}-values, for example, from \eqn{t}-tables, or permutation
    \eqn{p}-values as given in \code{mt.maxT} and \code{mt.minP}. If the
    \code{mt.maxT} or \code{mt.minP} functions are used, raw
    \eqn{p}-values should be given in the original data order,
    \code{rawp[order(index)]}.}
  \item{proc}{A vector of character strings containing the names of the
    multiple testing procedures for which adjusted \eqn{p}-values are to
    be computed. This vector should include any of the following:
    \code{"Bonferroni"}, \code{"Holm"}, \code{"Hochberg"},
    \code{"SidakSS"}, \code{"SidakSD"}, \code{"BH"}, \code{"BY"},
    \code{"ABH"}, \code{"TSBH"}.\cr

Adjusted \eqn{p}-values are computed for simple FWER- and FDR-
controlling procedures based on a vector of raw (unadjusted)
\eqn{p}-values by one or more of the following methods:

\describe{
\item{Bonferroni}{Bonferroni single-step adjusted \eqn{p}-values
for strong control of the FWER.}
\item{Holm}{Holm (1979) step-down adjusted \eqn{p}-values for
strong control of the FWER.}
\item{Hochberg}{ Hochberg (1988) step-up adjusted \eqn{p}-values
for
strong control of the FWER (for raw (unadjusted) \eqn{p}-values
satisfying the Simes inequality).}
\item{SidakSS}{Sidak single-step adjusted \eqn{p}-values for
strong control of the FWER (for positive orthant dependent test
statistics).}
\item{SidakSD}{Sidak step-down adjusted \eqn{p}-values for
strong control of the FWER (for positive orthant dependent test
statistics).}
\item{BH}{Adjusted \eqn{p}-values for the Benjamini & Hochberg
(1995) step-up FDR-controlling procedure (independent and positive
regression dependent test statistics).}
\item{BY}{Adjusted \eqn{p}-values for the Benjamini & Yekutieli
(2001) step-up FDR-controlling procedure (general dependency
structures).}
\item{ABH}{Adjusted \eqn{p}-values for the adaptive Benjamini & Hochberg
(2000) step-up FDR-controlling procedure.  This method ammends the original step-up procedure using an estimate of the number of true null hypotheses obtained from \eqn{p}-values.}
\item{TSBH}{Adjusted \eqn{p}-values for the two-stage Benjamini & Hochberg
(2006) step-up FDR-controlling procedure.  This method ammends the original step-up procedure using an estimate of the number of true null hypotheses obtained from a first-pass application of \code{"BH"}.  The adjusted \eqn{p}-values are \eqn{a}-dependent, therefore \code{alpha} must be set in the function arguments when using this procedure.}
}
}

\item{alpha}{A nominal type I error rate, or a vector of error
    rates, used for estimating the number of true null hypotheses in the
    two-stage Benjamini & Hochberg procedure (\code{"TSBH"}).  Default is 0.05.}

\item{na.rm}{An option for handling \code{NA} values in a list of raw \eqn{p}-values.  If
\code{FALSE}, the number of hypotheses considered is the length of the vector
of raw \eqn{p}-values.  Otherwise, if \code{TRUE}, the number of hypotheses is
the number of raw \eqn{p}-values which were not \code{NA}s.}
}


\value{
A list with components:
  \item{adjp}{A matrix of adjusted \eqn{p}-values, with rows
    corresponding to hypotheses and columns to multiple testing
    procedures. Hypotheses are sorted in increasing order of their raw
    (unadjusted) \eqn{p}-values.}
  \item{index}{A vector of row indices, between 1 and
    \code{length(rawp)}, where rows are sorted according to
    their raw (unadjusted) \eqn{p}-values. To obtain the adjusted
    \eqn{p}-values in the original data order, use
    \code{adjp[order(index),]}.}
  \item{h0.ABH}{The estimate of the number of true null hypotheses as proposed
    by Benjamini & Hochberg (2000) used when computing adjusted \eqn{p}-values
    for the \code{"ABH"} procedure (see Dudoit et al., 2007).}
  \item{h0.TSBH}{The estimate (or vector of estimates) of the number of true
    null hypotheses as proposed by Benjamini et al. (2006) when computing adjusted
    \eqn{p}-values for the \code{"TSBH"} procedure. (see Dudoit et al., 2007).}
}

\references{
Y. Benjamini and Y. Hochberg (1995). Controlling the false discovery
rate: a practical and powerful approach to multiple
testing. \emph{J. R. Statist. Soc. B}. Vol. 57: 289-300.\cr

Y. Benjamini and Y. Hochberg (2000). On the adaptive control of the false discovery rate in multiple testing with independent statistics. \emph{J. Behav. Educ. Statist}. Vol 25: 60-83.\cr

Y. Benjamini and D. Yekutieli (2001). The control of the false discovery rate in multiple hypothesis testing under dependency. \emph{Annals of Statistics}. Vol. 29: 1165-88.\cr

Y. Benjamini, A. M. Krieger and D. Yekutieli (2006). Adaptive linear step-up procedures that control the false discovery rate. \emph{Biometrika}. Vol. 93: 491-507.\cr

S. Dudoit, J. P. Shaffer, and J. C. Boldrick (2003). Multiple
hypothesis testing in microarray experiments. \emph{Statistical Science}. Vol. 18: 71-103. \cr

S. Dudoit, H. N. Gilbert, and M. J. van der Laan (2008).
Resampling-based empirical Bayes multiple testing procedures for controlling generalized tail probability and expected value error rates: Focus on the false discovery rate and simulation study. \emph{Biometrical Journal}, 50(5):716-44. \url{http://www.stat.berkeley.edu/~houston/BJMCPSupp/BJMCPSupp.html}. \cr

Y. Ge, S. Dudoit, and T. P. Speed (2003). Resampling-based multiple testing for microarray data analysis. \emph{TEST}. Vol. 12: 1-44 (plus discussion p. 44-77).\cr

Y. Hochberg (1988). A sharper Bonferroni procedure for multiple tests of significance, \emph{Biometrika}. Vol. 75: 800-802.\cr

S. Holm (1979). A simple sequentially rejective multiple test
procedure. \emph{Scand. J. Statist.}. Vol. 6: 65-70.
}

\author{
  Sandrine Dudoit, \url{http://www.stat.berkeley.edu/~sandrine},\cr
  Yongchao Ge, \email{yongchao.ge@mssm.edu},\cr
  Houston Gilbert, \url{http://www.stat.berkeley.edu/~houston}.
}

\seealso{\code{\link{mt.maxT}}, \code{\link{mt.minP}},
  \code{\link{mt.plot}}, \code{\link{mt.reject}}, \code{\link{golub}}.}

\examples{
# Gene expression data from Golub et al. (1999)
# To reduce computation time and for illustrative purposes, we condider only
# the first 100 genes and use the default of B=10,000 permutations.
# In general, one would need a much larger number of permutations
# for microarray data.

data(golub)
smallgd<-golub[1:100,]
classlabel<-golub.cl

# Permutation unadjusted p-values and adjusted p-values for maxT procedure
res1<-mt.maxT(smallgd,classlabel)
rawp<-res1$rawp[order(res1$index)]

# Permutation adjusted p-values for simple multiple testing procedures
procs<-c("Bonferroni","Holm","Hochberg","SidakSS","SidakSD","BH","BY","ABH","TSBH")
res2<-mt.rawp2adjp(rawp,procs)
}

\keyword{htest}





