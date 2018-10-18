#' Create a Boostrap 4 argon modal
#'
#' Build an argon modal
#'
#' @param ... Modal body content.
#' @param id Modal unique id. Should be the same as modal_id from \link{argonButton}.
#' @param title Modal title.
#' @param status Modal color.
#' @param gradient Modal background gradient. FALSE by default. Does not work if status is NULL.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonModal <- function(..., id, title = NULL, status = NULL, gradient = FALSE) {
  
  modalCl <- "modal-dialog modal-dialog-centered"
  if (status) modalCl <- paste0(modalCl, " modal-", status)
    
  contentCl <- "modal-content"
  if (gradient) {
    if (!is.null(status)) contentCl <- paste0(contentCl, " bg-gradient-", status)
  }
  
  # header
  modalHeader <- htmltools::tags$div(
    class = "modal-header",
    htmltools::tags$h5(class = "modal-title", id = paste0(id, "Label") , title),
    htmltools::tags$button(
      type = "button", 
      class="close", 
      `data-dismiss` = "modal",
      `aria-label` = "Close",
      htmltools::tags$span(`aria-hidden` = "true", "x")
    )
  )
  
  # footer
  modalFooter <- htmltools::tags$div(
    class = "modal-footer",
    htmltools::tags$button(
      type = "button", 
      class="btn btn-secondary", 
      `data-dismiss` = "modal", 
      "Close"
    ),
    argonButton(name = "Ok", status = "primary")
  )
  
  # content
  modalBody <- htmltools::tags$div(class = "modal-body", ...)
  
  
  modalWrapper <- htmltools::tags$div(
    class = "modal fade",
    id = id,
    tabindex = "-1",
    role = "dialog",
    `aria-labelledby` = paste0(id, "Label"),
    `aria-hidden` = "true",
    htmltools::tags$div(
      class = modalCl,
      role = "document",
      htmltools::tags$div(
        class = contentCl,
        modalHeader,
        modalBody,
        modalFooter
      )
    )
  )
  
  modalWrapper
  
}