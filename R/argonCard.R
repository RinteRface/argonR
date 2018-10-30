#' Create a Boostrap 4 card
#'
#' Build an argon card
#'
#' @param ... Body content.
#' @param title Card title.
#' @param src  Card external link.
#' @param hover_lift Whether to apply a lift effect on hover. FALSE by default.
#' Not compatible with floating.
#' @param shadow Whether to apply a shadow effect. FALSE by default.
#' @param shadow_size Card shadow size. Only if shadow is TRUE. NULL by default.
#' @param hover_shadow Only if shadow is TRUE. Whether to enlarge the shadow on hover. FALSE by default.
#' @param border_level Border level. O by default.
#' @param icon Card icon
#' @param status Card status. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' @param background_color Card background color. NULL by default. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' @param gradient Whether to apply a gradient effect on the card background. FALSE by default.
#' @param floating Whether to animate the card by a vertical floating movement. FALSE by default.
#' Not compatible with hover_lift.
#' @param width Card width. Between 1 and 12.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonCard(
#'   status = "primary",
#'   width = 12,
#'   title = "Card 1",
#'   hover_lift = TRUE,
#'   shadow = TRUE,
#'   icon = "check-bold",
#'   src = "#",
#'   "Argon is a great free UI package based on Bootstrap 4 
#'   that includes the most important components and features."
#'  )
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
                      floating = FALSE, width = 6) {
  
  # set vertical space between card to 3 (cf BS4 spacing rules)
  cardCl <- "card my-3"
  # floating effect needs to be applied before shadow
  if (floating) {
    if (!hover_lift) cardCl <- paste0(cardCl, " floating")
  }
  if (shadow) {
    if (!is.null(shadow_size)) {
      cardCl <- paste0(cardCl, " shadow-", shadow_size)
    } else {
      cardCl <- paste0(cardCl, " shadow")
    }
  } 
  if (hover_lift) {
    if(!floating) cardCl <- paste0(cardCl, " card-lift--hover")
  }
  if (shadow) {
    if (hover_shadow) cardCl <- paste0(cardCl, " shadow-lg--hover")
  }
  if (!is.null(border_level)) cardCl <- paste0(cardCl, " border-", border_level)
  if (gradient) {
    if (!is.null(background_color)) cardCl <- paste0(cardCl, " bg-gradient-", background_color)
  } else {
    if (!is.null(background_color)) cardCl <- paste0(cardCl, " bg-", background_color)
  }
  
  
  iconCl <- "icon icon-shape rounded-circle mb-4"
  if (!is.null(status)) iconCl <- paste0(iconCl, " icon-shape-", status)
  
  
  
  cardTag <- htmltools::tags$div(
    class = cardCl,
    # header
    if (!is.null(title)) {
      htmltools::tags$div(
        class = "card-header",
        htmltools::tags$div(
          class = "row align-items-center",
          # icon
          if(!is.null(icon)) {
            argonIconWrapper(
              iconTag = argonIcon(name = icon, color = status),
              circle = TRUE,
              size = "sm",
              shadow = TRUE,
              status = status,
              hover_shadow = FALSE
            )
          },
          # title
          htmltools::tags$h6(class = paste0("text-", status, " text-uppercase my-0 mx-1"), title)
        )
      )
    },
    htmltools::tags$div(
      class = "card-body",
      # content
      htmltools::tags$p(class = "description", ...),
      # external button
      if (!is.null(src)) {
        htmltools::a(
          class = paste0("btn btn-", status, " mt-4"), 
          href = src, 
          target = "_blank", 
          "More"
        )
      }
    )
  )
  
  argonColumn(width = width, cardTag)
  
}