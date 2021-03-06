% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Doccat.R
\name{dc_train}
\alias{dc_train}
\title{Train Document Classifer}
\usage{
dc_train(model, lang, data)
}
\arguments{
\item{model}{Full path to Output model file.}

\item{lang}{Language which is being processed.}

\item{data}{a data.frame of classifed documents, see details and examples.}
}
\description{
Train document classifier.
}
\details{
\code{data} is a data.frame of 2 columns:
\enumerate{
  \item{class - the dodcument class}
  \item{document - the document}
}

Note that you need a 5'000 classified document to train a decent model.
The examples below are just to demonstrate how to run the code.
}
\examples{
\dontrun{
# get working directory
# need to pass full path
wd <- getwd()

data <- data.frame(
  class = c("Sport", "Business", "Sport", "Sport", "Business", "Politics", "Politics", "Politics"),
  doc = c("Football, tennis, golf and, bowling and, score.",
          "Marketing, Finance, Legal and, Administration.",
          "Tennis, Ski, Golf and, gym and, match.",
          "football, climbing and gym.",
          "Marketing, Business, Money and, Management.",
          "This document talks politics and Donal Trump.",
          "Donald Trump is the President of the US, sadly.",
          "Article about politics and president Trump.")
)

# Error not enough data
# model <- dc_train(model = paste0(wd, "/model.bin"), data = data, lang = "en")

# repeat data 50 times
# Obviously do not do that in te real world
data <- do.call("rbind", replicate(50, data[sample(nrow(data), 4),],
                                   simplify = FALSE))

# train model
model <- dc_train(model = paste0(wd, "/model.bin"), data = data, lang = "en")
}

}
