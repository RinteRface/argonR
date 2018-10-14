#' Create a Boostrap 4 column
#'
#' Build an argon column
#'
#' @param width Optional. Column width between 1 and 12.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonColumn <- function(width = NULL) {
  htmltools::tags$div(class = if(!is.null(width)) paste0("col-sm-", width) else "col-sm")
}