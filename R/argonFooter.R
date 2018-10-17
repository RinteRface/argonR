#' Create a Boostrap 4 argon footer
#'
#' Build an argon footer
#'
#' @param ... Footer content.
#' @param has_card Enable card rendering in the footer. FALSE by default.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonFooter <- function(..., has_card = FALSE) {
  
  footerCl <- "footer"
  if (has_card) footerCl <- paste0(footerCl, " has-cards")
  
  htmltools::tags$footer(class = footerCl, ...)
  
}