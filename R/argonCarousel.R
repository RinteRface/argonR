#' Create a carousel
#'
#' Build an argon carousel
#' 
#' @param ... Slot for \link{argonCarouselItem}.
#' @param id Carousel unique id.
#' @param width Carousel width.
#'
#' @examples
#' if (interactive()) {
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCarousel <- function(..., id, width = 6) {
  
  carouselItems <- list(...)
  len <- length(carouselItems)
  found_active <- FALSE
  
  # nav and navitems
  carouselNavItems <- lapply(X = 1:len, FUN = function(i) {
      
      currentItem <- carouselItems[[i]]
      currentItemCl <- currentItem$attribs$class
      if (!found_active) {
        active <- sum(grep(x = currentItemCl, pattern = "active")) == 1
        if (active) found_active <<- TRUE
        # if there is already an active carousel item, set all other to inactive
      } else {
        active <- FALSE
      }
      
      # items
      htmltools::tags$li(
        `data-target` = paste0("#", id),
        `data-slide-to` = paste0(i-1),
        class = if (active) "active" else NA
      )
    })
  
  carouselNav <- htmltools::tags$ol(class = "carousel-indicators", carouselNavItems)
  
  # main content
  carouselContent <- htmltools::tags$div(class = "carousel-inner", ...)
  
  # controls
  carouselControls <- htmltools::tagList(
    htmltools::tags$a(
      class = "carousel-control-prev",
      href = paste0("#", id), 
      role = "button", 
      `data-slide` = "prev",
      htmltools::span(class = "carousel-control-prev-icon", `aria-hidden` = "true"),
      htmltools::span(class = "sr-only", "Previous")
    ),
    htmltools::tags$a(
      class = "carousel-control-next",
      href = paste0("#", id), 
      role = "button", 
      `data-slide` = "next",
      htmltools::span(class = "carousel-control-next-icon", `aria-hidden` = "true"),
      htmltools::span(class = "sr-only", "Next")
    )
  )
  
  # main tag
  carouselTag <- htmltools::tags$div(
    class = "rounded shadow-lg overflow-hidden",
    htmltools::tags$div(
      class = "carousel slide",
      id = id,
      `data-ride` = "carousel",
      carouselNav,
      carouselContent,
      carouselControls
    )
  )
  
  # column wrapper
  argonColumn(width = width, carouselTag)
}




#' Create a carousel item
#'
#' Build an argon carousel item
#' 
#' @param src Image url or path.
#' @param active Whether the item is active or not. 
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCarouselItem <- function(src = NULL, active = FALSE) {
  htmltools::tags$div(
    class = if (active) "carousel-item active" else "carousel-item",
    htmltools::img(src = src, class = "img-fluid")
  )
}