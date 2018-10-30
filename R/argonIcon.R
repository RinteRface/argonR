#' Create a Nucleo icon
#'
#' Build an argon Nucleo icon
#'
#' @param name icon name.
#' @param color icon color. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonIcon("atom")
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




#' Create a Nucleo icon wrapper
#'
#' Build an argon Nucleo icon wrapper
#'
#' @param iconTag Slot for \link{argonIcon}
#' @param circle Wrapper's shape. TRUE by default. 
#' @param size Wrapper size. "sm", "md" or "lg".
#' @param status Wrapper color. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' @param gradient_color icon gradient background color.
#' @param shadow Whether to apply a shadow effet. TRUE by default.
#' @param hover_shadow Only if shadow is TRUE. Whether to enlarge the shadow on hover. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonIconWrapper(
#'   iconTag = argonIcon("atom"),
#'   size = "lg",
#'   status = "danger",
#'   shadow = TRUE,
#'   hover_shadow = TRUE
#'  )
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonIconWrapper <- function(iconTag, circle = TRUE, size = NULL, status = "default", 
                             gradient_color = NULL, shadow = TRUE, hover_shadow = FALSE) {
  
  wrapperCl <- "icon icon-shape"
  if (circle) wrapperCl <- paste0(wrapperCl, " rounded-circle")
  if (!is.null(gradient_color)) {
    wrapperCl <- paste0(wrapperCl, " bg-gradient-", gradient_color)
    status <- NULL
  }
  if (!is.null(status)) wrapperCl <- paste0(wrapperCl, " icon-shape-", status)
  if (!is.null(size)) wrapperCl <- paste0(wrapperCl, " icon-", size)
  if (shadow) {
    if (hover_shadow) wrapperCl <- paste0(wrapperCl, " shadow-lg--hover")
    else {
      wrapperCl <- paste0(wrapperCl, " shadow")
    }
  } 
  
  htmltools::tags$div(class = wrapperCl, iconTag)
}