#' Create a Boostrap 4 section container
#'
#' Build an argon section container
#'
#' @param ... Any UI element.
#' @param size Section size. NULL by default.
#' @param status Section status.
#' @param gradient Section gradient effect. FALSE by default.
#' @param separator Section bottom separator. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonSection <- function(..., size = NULL, status = "default", gradient = FALSE, separator = FALSE) {
  
  sectionCl <- "section"
  if (!is.null(size)) sectionCl <- paste0(sectionCl, " section-", size)
  if (gradient) {
    if (!is.null(status)) sectionCl <- paste0(sectionCl, " bg-gradient-", status)
  } else {
    sectionCl <- paste0(sectionCl, " bg-", status)
  }
  
  htmltools::tags$section(
    class = "sectionCl",
    htmltools::tags$div(
      class = "container",
      ...
    ),
    if (separator) {
      htmltools::tags$div(
        class = "separator separator-bottom separator-skew zindex-100",
        htmltools::HTML(
          paste0(
            '<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-white" points="2560 0 2560 100 0 100"></polygon>
            </svg>
            '
          )
        )
      )
    }
  )
  
}