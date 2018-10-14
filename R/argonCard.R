#' Create a Boostrap 4 card
#'
#' Build an argon card
#'
#' @param ... Body content.
#' @param title Card title.
#' @param src  Card external link.
#' @param hover_lift Whether to apply a lift effect on hover. FALSE by default.
#' @param shadow Whether to apply a shadow effect. FALSE by default.
#' @param shadow_size Card shadow size. Only if shadow is TRUE. NULL by default.
#' @param hover_shadow Only if shadow is TRUE. Whether to enlarge the shadow on hover. FALSE by default.
#' @param border_level Border level. O by default.
#' @param icon Card icon
#' @param status Card status. 
#' @param background_color Card background color. NULL by default.
#' @param gradient Whether to apply a gradient effect on the card background. FALSE by default.
#' @param perspective Card perspective effect. "left" or "right".
#' @param floating Whether to animate the card by a vertical floating movement. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCard <- function(..., title = NULL, src = NULL, hover_lift = FALSE, 
                      shadow = FALSE, shadow_size = NULL, hover_shadow = FALSE, 
                      border_level = 0, icon = NULL, 
                      status = "primary", background_color = NULL, gradient = FALSE,
                      perspective = c("right", "left"), floating = FALSE) {
  
  perspective <- match.arg(perspective)
  
  cardCl <- "card"
  # perspective and floating effects needs to be applied before shadow
  if (!is.null(perspective)) cardCl <- paste0(cardCl, " transform-perspective-", perspective)
  if (floating) cardCl <- paste0(cardCl, " floating")
  if (shadow) {
    if (!is.null(shadow_size)) {
      cardCl <- paste0(cardCl, " shadow-", shadow_size)
    } else {
      cardCl <- paste0(cardCl, " shadow")
    }
  } 
  if (hover_lift) cardCl <- paste0(cardCl, " card-lift--hover")
  if (shadow) {
    if (hover_shadow) cardCl <- paste0(cardCl, " shadow-lg--hover")
  }
  if (!is.null(border_level)) cardCl <- paste0(cardCl, " border-", border_level)
  if (gradient) {
    if (!is.null(background_color)) cardCl <- paste0(cardCl, " bg-gradient-", background_color)
  } else {
    if (!is.null(background_color)) cardCl <- paste0(cardCl, " bg-", background_color)
  }
  
  
  iconCl <- "icon rounded-circle mb-4"
  if (!is.null(icon)) iconCl <- paste0(iconCl, " icon-", icon)
  if (!is.null(status)) iconCl <- paste0(iconCl, " icon-shape-", status)
  
  
  
  htmltools::tags$div(
    class = cardCl,
    htmltools::tags$div(
      class = "card-body py-5",
      # icon
      htmltools::tags$div(class = iconCl),
      # title
      htmltools::tags$h6(class = paste0("text-", status, " text-uppercase"), title),
      # content
      htmltools::tags$p(class = "description mt-3", ...),
      # external button
      htmltools::a(
        class = paste0("btn btn-", status, " mt-4"), 
        href = src, 
        target = "_blank", 
        "More"
      )
    )
  )
}