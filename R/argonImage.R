#' Create a Boostrap 4 image container
#'
#' Build an argon image container
#'
#' @param src Image source or path.
#' @param url Only with card_mode on. Optional external link.
#' @param floating Whether to apply a floating effect. FALSE by default.
#' @param card_mode Whether to include the image in a card wrapper. FALSE by default. 
#' @param hover_lift Whether to apply a lift effect on hover. FALSE by default.
#' Not compatible with floating. Only if card_mode is TRUE.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonImage(
#'   floating = TRUE,
#'   src = "https://demos.creative-tim.com/argon-design-system/assets/img/ill/ill-2.svg",
#'   hover_lift = TRUE
#'  )
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonImage <- function(src = NULL, url = NULL, floating = FALSE, card_mode = FALSE,
                       hover_lift = FALSE) {
  
  imgCl <- "img-fluid"
  cardCl <- "card shadow border-0"
  if (floating) imgCl <- paste0(imgCl, " floating")
  if (hover_lift) cardCl <- paste0(cardCl, " card-lift--hover")
  
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
    htmltools::tags$a(
      href = url,
      target = "_blank",
      htmltools::img(
        class = imgCl,
        src = src
      )
    )
  }
  
  imgTag
}