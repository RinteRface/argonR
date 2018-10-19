#' Create a muted text
#'
#' Apply the class muted to a text
#' 
#' @param ... Any text.
#'
#' @examples
#' if (interactive()) {
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonMuted <- function(...) {
  htmltools::tags$small(class = "text-muted", ...)
}



#' Create a custim h1 tag
#'
#' A custom h1 tag
#' 
#' @param ... Any text.
#' @param display value between 1 and 4.
#'
#' @examples
#' if (interactive()) {
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonH1 <- function(..., display) {
  htmltools::tags$h1(class = paste0("display-", display), ...)
}



#' Create a custim p tag
#'
#' A custom p tag
#' 
#' @param ... Any text.
#'
#' @examples
#' if (interactive()) {
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonLead <- function(...) {
  htmltools::tags$p(class = "lead", ...)
}




#' Create a quotation tag
#'
#' A custom quotation tool
#' 
#' @param ... Any text.
#' @param footer Footer content, if any.
#' @param source Source if any.
#' @param align Text alignement. "center", "right" or "left".
#' 
#' @examples
#' if (interactive()) {
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonQuote <- function(..., footer = NULL, source = NULL, align = "center") {
  
  quoteCl <- "blockquote"
  if (!is.null(align)) quoteCl <- paste0(quoteCl, " text-", align)
  
  htmltools::tags$blockquote(
    class = quoteCl,
    htmltools::p(class = "mb-0", ...),
    if (!is.null(footer)) {
      htmltools::tags$footer(
        class = "blockquote-footer",
        footer,
        htmltools::tags$cite(title = "Source Title", source)
      )
    }
  )
}




#' Add a custom color to a text
#'
#' A custom color fo your text
#' 
#' @param tag Any tag containing text.
#' @param color Text color.
#' 
#' @examples
#' if (interactive()) {
#'  library(argonR)
#'  library(htmltools)
#'  argonTextColor(
#'   tag = h1("test"),
#'   color = "success"
#'  )
#' }
#'
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonTextColor <- function(tag, color) {
  tag$attribs$class <- paste0(tag$attribs$class, " text-", color)
  return(tag)
}




#' Change tag margins 
#'
#'
#' @param tag Tag to be treated.
#' @param orientation Margin side. See \url{https://getbootstrap.com/docs/4.1/utilities/spacing/}.
#' @param value Margin value, negative or positive. See \url{https://getbootstrap.com/docs/4.1/utilities/spacing/}.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonMargin(tag = h1("test"), orientation = "t", value = -1)
#'  argonMargin(tag = h1("test"), orientation = "x", value = 7)
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonMargin <- function(tag, orientation, value) {
  tag$attribs$class <- paste0(tag$attribs$class, " m", orientation, "-", value)
  return(tag)
}



#' Change tag padding 
#'
#'
#' @param tag Tag to be treated.
#' @param orientation Padding side. See \url{https://getbootstrap.com/docs/4.1/utilities/spacing/}.
#' @param value Padding value. See \url{https://getbootstrap.com/docs/4.1/utilities/spacing/}.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonPadding(tag = h1("test"), orientation = NULL, value = 5)
#'  argonPadding(tag = h1("test"), orientation = "x", value = 2)
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonPadding <- function(tag, orientation, value) {
  tag$attribs$class <- paste0(tag$attribs$class, " p", orientation, "-", value)
  return(tag)
}



#' Create a boostrap 4 container 
#'
#'
#' @param ... Tag to be embedded.
#' @param size Container size. NULL or "lg".
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#' 
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonContainer <- function(..., size = NULL) {
  
  containerCl <- "container"
  if (!is.null(size)) containerCl <- paste0(containerCl, " container-", size)
  htmltools::tags$div(class = containerCl, ...)
}



#' Create a boostrap 4 tooltip 
#'
#' @param tag Tag to be documented.
#' @param position Where to display the toolptip: "top", "right", "bottom" or "left".
#' @param title Tooltip title.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#' 
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonTooltip <- function(tag, position, title = NULL) {
  # add tooltip attributes to the tag
  tag$attribs[["data-toggle"]] <- "tooltip"
  tag$attribs[["data-placement"]] <- position
  tag$attribs[["title"]] <- title
  return(tag)
}



# #' Create a boostrap 4 code container 
# #'
# #' @param ... Any code
# #' @param language Code language.
# #' 
# #' @examples 
# #' if (interactive()) {
# #'  library(argonR)
# #' 
# #' }
# #' 
# #' @author David Granjon, \email{dgranjon@@ymail.com}
# #'
# #' @export
# argonCode <- function(..., language = NULL) {
#   htmltools::tags$div(
#     class = "highlight",
#     #htmltools::tags$pre(
#       htmltools::tags$code(
#         class = paste0("language-", language),
#         `data-lang` = language,
#         ...
#       )
#     #)
#   )
# }# 