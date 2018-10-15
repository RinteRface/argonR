#' Create a Boostrap 4 row
#'
#' Build an argon row
#'
#' @param ... Any UI element.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonRow <- function(...) {
  htmltools::tags$div(class = "row", ..., htmltools::tags$br())
}