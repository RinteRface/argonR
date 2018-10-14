#' Create a Boostrap 4 perspective effect
#'
#' Build an argon perspective effect
#'
#' @param ... Tag to be treated by the persp effect.
#' @param side Perspective side effect. "right" or "left".
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonPersp(argonCard(), side = "right")
#' }
#' 
#' @note Disabled on small screens (not a bug)
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonPersp <- function(..., side) {
  htmltools::tags$div(class = paste0("transform-perspective-", side), ...)
}