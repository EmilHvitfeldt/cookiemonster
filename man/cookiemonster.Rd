% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cookiemonster.R
\name{cookiemonster}
\alias{cookiemonster}
\title{Creates a Cookie Monster lineup}
\usage{
cookiemonster(data, mapping = aes(), var = character(), n = 10,
  nrow = 2, procent = 0.5, ...)
}
\arguments{
\item{data}{default dataset to be used for the plot. Data.frame.}

\item{mapping}{Default list of aesthetic mappings to use for plot.}

\item{var}{name of variable to permute.}

\item{n}{total number of samples to generate (including true data).}

\item{nrow}{number of rows in lineup.}

\item{procent}{procent of area that Cookie Monster will occupy.}

\item{\\dots}{arguments passed on to lineup.}
}
\value{
The sum of \code{x} and \code{y}.
}
\description{
Creates a Cookie Monster lineup
}
\examples{
\dontrun{
cookiemonster(mtcars, var = "mpg") +
aes(mpg, wt) +
geom_point()

cookiemonster(mtcars, aes(mpg, wt), "mpg") +
geom_point()
}
}
