% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/argonCard.R
\name{argonCard}
\alias{argonCard}
\title{Create a Boostrap 4 card}
\usage{
argonCard(..., title = NULL, src = NULL, hover_lift = FALSE,
  shadow = FALSE, shadow_size = NULL, hover_shadow = FALSE,
  border_level = 0, icon = NULL, status = "primary",
  background_color = NULL, gradient = FALSE, floating = FALSE,
  width = 6)
}
\arguments{
\item{...}{Body content.}

\item{title}{Card title.}

\item{src}{Card external link.}

\item{hover_lift}{Whether to apply a lift effect on hover. FALSE by default.
Not compatible with floating.}

\item{shadow}{Whether to apply a shadow effect. FALSE by default.}

\item{shadow_size}{Card shadow size. Only if shadow is TRUE. NULL by default.}

\item{hover_shadow}{Only if shadow is TRUE. Whether to enlarge the shadow on hover. FALSE by default.}

\item{border_level}{Border level. O by default.}

\item{icon}{Card icon}

\item{status}{Card status.}

\item{background_color}{Card background color. NULL by default.}

\item{gradient}{Whether to apply a gradient effect on the card background. FALSE by default.}

\item{floating}{Whether to animate the card by a vertical floating movement. FALSE by default.
Not compatible with hover_lift.}

\item{width}{Card width. Between 1 and 12.}
}
\description{
Build an argon card
}
\examples{
if (interactive()) {
}


}
\author{
David Granjon, \email{dgranjon@ymail.com}
}