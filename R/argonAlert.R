#' Create a Boostrap 4 argon alert
#'
#' Build an argon alert
#'
#' @param ... Alert content.
#' @param icon Alert icon. Expect \link{argonIcon} or \link[shiny]{icon}.
#' @param status Alert status. See \url{https://demos.creative-tim.com/argon-design-system/docs/components/alerts.html}.
#' @param closable Whether to make the alert closable or not. TRUE by default.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonAlert(
#'   icon = argonIcon("basket"),
#'   status = "danger",
#'   "This is an alert",
#'   closable = TRUE
#'  )
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonAlert <- function(..., icon = NULL, status = "default", closable = TRUE) {
  
  alertCl <- "alert"
  if (!is.null(status)) alertCl <- paste0(alertCl, " alert-", status)
  
  htmltools::tags$div(
    class = alertCl,
    role = "alert",
    if (!is.null(icon)) {
      htmltools::tags$span(
        class = "alert-inner--icon",
        icon
      )
    },
    htmltools::tags$span(
      class = "alert-inner--text",
      ...
    ),
    if (closable) {
      htmltools::tags$button(
        class = "close",
        type = "button",
        `data-dismiss` = "alert",
        `aria-label` = "close",
        htmltools::tags$span(`aria-hidden` = "true", "x")
      ) 
    }
  )
  
}