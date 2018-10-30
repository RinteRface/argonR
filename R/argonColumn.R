#' Create a Boostrap 4 column
#'
#' Build an argon column
#'
#' @param ... Any UI element.
#' @param width Optional. Column width between 1 and 12.
#' @param center Whether to center column elements or not. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonColumn(
#'   width = 4,
#'   argonAlert(
#'     icon = "basket",
#'     status = "danger",
#'     "This is an alert",
#'     closable = TRUE
#'   )
#'  )
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonColumn <- function(..., width = NULL, center = FALSE) {
  
  colCl <- if(!is.null(width)) paste0("col-sm-", width) else "col-sm"
  if (center) colCl <- paste0(colCl, " text-center")
  
  htmltools::tags$div(class = colCl, ...)
}