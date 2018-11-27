#' Create a Boostrap 4 argon button
#'
#' Build an argon button
#'
#' @param src Button external link.
#' @param name Button label.
#' @param status Button color. See \url{https://demos.creative-tim.com/argon-design-system/docs/components/buttons.html}.
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
#'  argonButton(
#'   name = "Click me!",
#'   status = "danger",
#'   icon = "atom",
#'   size = "lg",
#'   toggle_modal = TRUE,
#'   modal_id = "modal1"
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonButton <- function(src = NULL, name = NULL, status = "default", icon = NULL, 
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
        htmltools::tags$a(
          href = src,
          target = "_blank",
          htmltools::tags$span(class = "btn-inner--icon", argonIcon(icon)),
          htmltools::tags$span(class = "btn-inner--text", name)
        )
      } else {
        htmltools::tags$a(
          href = src,
          target = "_blank",
          htmltools::tags$span(class = "btn-inner--icon", argonIcon(icon))
        )
      }
    } else {
      htmltools::tags$a(
        href = src,
        target = "_blank",
        name
      )
    }
  )
}




#' Create a Boostrap 4 argon social button
#'
#' Build an argon social button
#'
#' @param src Button external link.
#' @param status Button color. See \url{https://demos.creative-tim.com/argon-design-system/docs/components/buttons.html}.
#' @param icon Button icon.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#'  argonSocialButton(
#'   src = "http://rinterface.com",
#'   status = "danger",
#'   icon = "atom"
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonSocialButton <- function(src = NULL, status = "default", icon = NULL) {
  btnCl <- "btn btn-icon-only rounded-circle"
  if (!is.null(status)) btnCl <- paste0(btnCl, " btn-", status)
  
  htmltools::tags$a(
    class = btnCl,
    href = src,
    target = "_blank",
    htmltools::tags$i(class = paste0("fa fa-", icon))
  )
  
}