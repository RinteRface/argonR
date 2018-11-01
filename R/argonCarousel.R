#' Create a carousel
#'
#' Build an argon carousel
#' 
#' @param ... Slot for \link{argonCarouselItem}.
#' @param id Carousel unique id.
#' @param floating Whether to apply a floating effect. FALSE by default.
#' @param hover_lift Whether to apply a lift effect on hover. FALSE by default.
#' Not compatible with floating. Only if card_mode is TRUE.
#' @param width Carousel width.
#'
#' @examples
#' if (interactive()) {
#'  library(argonR)
#'  argonCarousel(
#'   id = "carousel2",
#'   argonCarouselItem(
#'     src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/img-1-1200x1000.jpg",
#'     active = TRUE
#'   ),
#'   argonCarouselItem(
#'     src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/img-2-1200x1000.jpg",
#'     active = FALSE
#'   )
#'  )
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCarousel <- function(..., id, floating = FALSE, hover_lift = FALSE, width = 6) {
  
  if (hover_lift) floating <- FALSE
  
  carouselCl <- if (hover_lift) {
    "rounded card-lift--hover shadow-lg overflow-hidden"
  } else {
    if (floating) {
      "rounded floating shadow-lg overflow-hidden"
    } else {
      "rounded shadow-lg overflow-hidden"
    }
  }
  
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
  carouselContent <- htmltools::tags$div(class = "carousel-inner embed-responsive embed-responsive-4by3", ...)
  
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
    class = carouselCl,
    htmltools::tags$div(
      class = "carousel slide",
      id = id,
      `data-ride` = "carousel",
      carouselNav,
      carouselContent#,
      #carouselControls
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
#' @param mode Item mode: "img" by default but also "iframe" or "video".
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonCarouselItem <- function(src = NULL, active = FALSE, mode = "img") {
  htmltools::tags$div(
    class = if (active) {
      "carousel-item active embed-responsive-item"
    } else {
      "carousel-item embed-responsive-item"
    },
    switch (mode,
      "img" = htmltools::img(src = src, class = "img-fluid"),
      "iframe" = htmltools::tags$iframe(src = src),
      "video" = htmltools::tags$iframe(
        src = src,
        frameborder="0",
        allow = "accelerometer; 
                 autoplay; encrypted-media; 
                 gyroscope; picture-in-picture",
        allowfullscreen = NA
      )
    )
  )
}