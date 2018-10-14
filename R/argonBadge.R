#' Create a Boostrap 4 badge
#'
#' Build an argon badge
#'
#' @param text Badge text.
#' @param src Badge external link.
#' @param pill Pill mode. FALSE by default.
#' @param status Badge status.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonBadge <- function(text = NULL, src = NULL, pill = FALSE, status = "default") {
  
  badgeCl <- "badge"
  if (pill) badgeCl <- paste0(badgeCl, " badge-pill")
  if (!is.null(status)) badgeCl <- paste0(badgeCl, " badge-", status)
  
  if (!is.null(src)) {
    htmltools::a(href = src, class = badgeCl, text)
  } else {
    htmltools::tags$span(class = badgeCl, text)
  }
  
}