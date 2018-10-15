#' Create a Boostrap 4 user image
#'
#' Build an argon user image
#'
#' @param ... Any element such as \link{argonIcon}...
#' @param title User title.
#' @param subtitle User subtitle.
#' @param src User image url or path.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonUser <- function(..., title = NULL, subtitle = NULL, src = NULL) {
  htmltools::tags$div(
    class = "px-4",
    # image
    htmltools::img(
      src = src,
      class = "rounded-circle img-center img-fluid shadow shadow-lg--hover",
      style = "width: 200px;"
    ),
    htmltools::tags$div(
      class = "pt-4 text-center",
      # title/subtitle
      htmltools::tags$h5(
        htmltools::span(class = "d-block mb-1", title),
        htmltools::tags$small(class = "h6 text-muted", subtitle)
      ),
      htmltools::tags$div(
        class = "mt-3",
        ...
      )
    )
  )
}