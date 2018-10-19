#' Create a Boostrap 4 argon footer
#'
#' Build an argon footer
#'
#' @param ... Footer content.
#' @param has_card Enable card rendering in the footer. FALSE by default.
#' @param status  Footer status color.
#' @param gradient Whether to apply a gradient. FALSE by default.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonFooter <- function(..., has_card = FALSE, status = NULL, gradient = FALSE) {
  
  footerCl <- "footer"
  if (!is.null(status)) {
    if (gradient) {
      footerCl <- paste0(footerCl, " bg-gradient-", status)
    } else {
      footerCl <- paste0(footerCl, " bg-", status)
    }
  }
  if (has_card) footerCl <- paste0(footerCl, " has-cards")
  
  htmltools::tags$footer(class = footerCl, ...)
  
}