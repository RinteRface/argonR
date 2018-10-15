#' Create a Boostrap 4 profile card
#'
#' Build an argon profile card
#'
#' @param ... Any element.
#' @param title Profile title.
#' @param subtitle Profile subtitle.
#' @param src Profile image path or url.
#' @param url Main url.
#' @param url_1 First social link.
#' @param url_2 Second social link.
#' @param stats Stats items. See \link{argonProfileStats}.
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonProfile <- function(..., title = NULL, subtitle = NULL, src = NULL, url = NULL,
                         url_1 = NULL, url_2 = NULL, stats) {
  htmltools::tags$div(
    class = "card card-profile shadow mt--300",
    htmltools::tags$div(
      class = "px-4",
      # header
      htmltools::tags$div(
        class = "row justify-content-center",
        # profile image
        htmltools::tags$div(
          class = "col-lg-3 order-lg-2",
          htmltools::tags$div(
            class = "card-profile-image",
            htmltools::a(
              href = NULL,
              htmltools::img(src = src, class = "rounded-circle")
            )
          )
        ),
        # button
        htmltools::tags$div(
          class = "col-lg-4 order-lg-3 text-lg-right align-self-lg-center",
          htmltools::tags$div(
            class = "card-profile-actions py-4 mt-lg-0",
            htmltools::a(href = url_1, class = "btn btn-sm btn-info mr-4", "Link 1"),
            htmltools::a(href = url_2, class = "btn btn-sm btn-default float-right", "Link 2")
          )
        ),
        # stat items
        stats
      ),
      
      # Title
      htmltools::tags$div(
        class = "text-center mt-5",
        htmltools::h3(title),
        htmltools::tags$div(class = "h6 font-weight-300", subtitle)
      ),
      
      # Content
      htmltools::tags$div(
        class = "mt-5 py-5 border-top text-center",
        htmltools::tags$div(
          class = "row justify-content-center",
          htmltools::tags$div(
            class = "col-lg-9",
            htmltools::p(...),
            htmltools::a(href = url, "More")
          )
        )
      )
    )
  )
}



#' Create a Boostrap 4 profile card stats container
#'
#' Build an argon profile card stats container
#'
#' @param ... Slot for \link{argonProfileStat}.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonProfileStats <- function(...) {
  htmltools::tags$div(
    class = "col-lg-4 order-lg-1",
    htmltools::tags$div(
      class = "card-profile-stats d-flex justify-content-center",
      ...
    )
  )
}


#' Create a Boostrap 4 profile card stat item
#'
#' Build an argon profile card stat item
#'
#' @param value Stat value.
#' @param description Stat description.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonProfileStat <- function(value, description) {
  htmltools::tags$div(
    htmltools::span(class = "heading", value),
    htmltools::span(class = "description", description)
  )
}