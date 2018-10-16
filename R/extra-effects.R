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




# #' Create a Boostrap 4 blur effect
# #'
# #' Build an argon blur effect
# #'
# #' @param ... Tag to be treated by the blur effect.
# #' 
# #' @examples 
# #' if (interactive()) {
# #'  library(argonR)
# #'
# #' }
# #' 
# #' @author David Granjon, \email{dgranjon@@ymail.com}
# #'
# #' @export
# argonBlur <- function(...) {
#   htmltools::tags$div(
#     class = "blur--hover",
#     htmltools::tags$div(
#       class = "blur-item mt-5 on-screen",
#       `data-toggle` = "on-screen",
#       ...
#     )
#   )
# }