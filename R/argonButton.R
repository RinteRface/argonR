#' Create a Boostrap 4 argon button
#'
#' Build an argon button
#'
#' @param name Button label.
#' @param status Button color.
#' @param icon Button icon.
#' @param size Button size: NULL, "sm" or "lg".
#' @param block Whether the button fill its parent. FALSE by default.
#' @param disabled Whether to disable the button. FALSE by default.
#' @param outline Whether to outline the button. FALSE by default.
#' @param toggle_modal Whether to use th button for a modal. FALSE by default.
#' @param modal_id If toggle_modal is TRUE, nedd to provide the modal targeted.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonButton <- function(name = NULL, status = "default", icon = NULL, 
                        size = NULL, block = FALSE, disabled = FALSE, 
                        outline = FALSE, toggle_modal = FALSE, modal_id = NULL) {
  
  btnCl <- "btn"
  if (!is.null(status)) btnCl <- paste0(btnCl, " btn-", if (outline) "outline-" else NULL, status)
  if (!is.null(size)) btnCl <- paste0(btnCl, " btn-", size)
  if (block) btnCl <- paste0(btnCl, " btn-block")
  
  htmltools::tags$button(
    class = btnCl,
    type = "button",
    disabled = if (disabled) NA else NULL,
    `data-toggle` = if (toggle_modal) "modal" else NULL,
    `data-target` = if (toggle_modal) paste0("#", modal_id) else NULL,
    if (!is.null(icon)) {
      if (!is.null(name)) {
        htmltools::tagList(
          htmltools::tags$span(class = "btn-inner--icon", argonIcon(icon)),
          htmltools::tags$span(class = "btn-inner--text", name)
        )
      } else {
        htmltools::tags$span(class = "btn-inner--icon", argonIcon(icon))
      }
    } else {
      name
    }
  )
}