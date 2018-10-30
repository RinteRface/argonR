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




#' Create a Boostrap 4 blur effect
#'
#' Build an argon blur effect
#'
#' @param ... Tag to be treated by the blur effect.
#' @param text Text that appears on hover.
#' @param text_color Text color. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#' 
#' @note Not compatible with argonDash
#'
#' @export
argonBlur <- function(..., text = NULL, text_color = NULL) {
  htmltools::tags$div(
    class = "blur--hover",
    htmltools::tags$div(
      class = "blur-item mt-5 on-screen",
      `data-toggle` = "on-screen",
      ...
    ),
    htmltools::tags$span(class = paste0("blur-hidden h2 text-", text_color), text)
  )
}



#' Create a Boostrap 4 cascade effect
#'
#' Build an argon cascade effect
#'
#' @param ... Slot for \link{argonCascadeItem}. Exactly 13 items.
#' 
#' @note You must pass cascade = TRUE to argonSection
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCascade <- function(...) {
  
  htmltools::tags$div(
    class = "icons-container mt-5 on-screen",
    `data-toggle` = "on-screen",
    ...
  )
}



#' Create a Boostrap 4 cascade item
#'
#' Build an argon cascade item
#'
#' @param name Icon name.
#' @param size Icon size: NULL, "sm" or "lg".
#' @param src Optional external url, link, ...
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCascadeItem <- function(name, size = NULL, src = NULL) {
  
  cascadeItemCl <- "icon"
  if (!is.null(size)) cascadeItemCl <- paste0(cascadeItemCl, " icon-", size)
  if (!is.null(name)) cascadeItemCl <- paste0(cascadeItemCl, " ni ni-", name)
  
  htmltools::a(
    href = src,
    target = "_blank",
    htmltools::tags$i(class = cascadeItemCl) 
  )
  
}