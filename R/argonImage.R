#' Create a Boostrap 4 image container
#'
#' Build an argon image container
#'
#' @param src Image source or path.
#' @param url Only with card_mode on. Optional external link.
#' @param floating Whether to apply a floating effect. FALSE by default.
#' @param card_mode Whether to include the image in a card wrapper. FALSE by default. 
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonImage <- function(src = NULL, url = NULL, floating = FALSE, card_mode = FALSE) {
  
  imgCl <- "img-fluid"
  cardCl <- "card card-lift--hover shadow border-0"
  if (floating) imgCl <- paste0(imgCl, " floating")
  
  imgTag <- if (card_mode) {
    htmltools::tags$div(
      class = cardCl,
      htmltools::tags$a(
        href = url,
        target = "_blank",
        htmltools::img(
          class = "card-img",
          src = src 
        )
      ) 
    )
  } else {
    htmltools::img(
      class = imgCl,
      src = src
    )
  }
  
  imgTag
}