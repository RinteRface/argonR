#' Create a Nucleo icon
#'
#' Build an argon Nucleo icon
#'
#' @param name icon name.
#' @param color icon color. 
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonIcon <- function(name, color = NULL) {
  
  iconCl <- "ni"
  if (!is.null(color)) iconCl <- paste0(iconCl, " text-", color)
  
  htmltools::tags$i(class = paste0(iconCl, " ni-", name))
}