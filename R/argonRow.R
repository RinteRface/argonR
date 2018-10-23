#' Create a Boostrap 4 row
#'
#' Build an argon row
#'
#' @param ... Any UI element.
#' @param center Whether to center row elements or not. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonRow <- function(..., center = FALSE) {
  rowCl <- "row"
  if (center) rowCl <- paste0(rowCl, " align-items-center justify-content-center")
  
  htmltools::tags$div(class = rowCl, ..., htmltools::tags$br())
}