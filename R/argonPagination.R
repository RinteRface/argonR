#' Build an argon pagination container
#'
#' @param ... Slot for \link{argonPaginationItem}.
#' @param size Pagination size: NULL, "sm" or "lg".
#' @param align Pagination alignement. NULL (left), "center" or "end" (right).
#'
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#'  argonPagination(
#'   size = "lg",
#'   align = "center",
#'   argonPaginationItem(
#'     name = 1,
#'     src = "test.html"
#'   ),
#'   argonPaginationItem(
#'     name = 2,
#'     src = "https://www.google.com"
#'   )
#'  )
#' }
#' 
#' @note align will not work if you embed the argonPagination in an argonRow.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonPagination <- function(..., size = NULL, align = NULL) {
  
  items <- list(...)
  len <- length(items)
  
  # handle item and add the active class to the first one
  paginationItems <- lapply(X = 1:len, FUN = function(i) {
    if (i == 1) {
      items[[i]] <- htmltools::tagAppendChild(
        items[[1]],
        htmltools::tags$span(class = "sr-only", "(current)")
      )
    }
    htmltools::tags$li(
      class = if (i == 1) "page-item active" else "page-item",
      items[[i]]
    )
  })
  
  paginationCl <- "pagination"
  if (!is.null(size)) paginationCl <- paste0(paginationCl, " pagination-", size)
  if (!is.null(align)) paginationCl <- paste0(paginationCl, " justify-content-", align)
  
  prevBttn <- htmltools::tags$li(
    class = "page-item",
    htmltools::tags$a(
      class = "page-link", 
      href = "#",
      `aria-label` = "Previous",
      htmltools::tags$i(class = "fa fa-angle-left"),
      htmltools::tags$span(class = "sr-only", "Previous")
    )
  )
  
  nextBttn <- htmltools::tags$li(
    class = "page-item",
    htmltools::tags$a(
      class = "page-link", 
      href = "#",
      `aria-label` = "Previous",
      htmltools::tags$i(class = "fa fa-angle-right"),
      htmltools::tags$span(class = "sr-only", "Next")
    )
  )
  
  htmltools::tags$nav(
    `aria-label` = "Page navigation example",
    htmltools::tags$ul(
      class = paginationCl,
      prevBttn,
      paginationItems,
      nextBttn
    )
  )
  
}



#' Build an argon pagination item
#'
#' @param name Item name. Better to use numerics such as 1, 2, 3, ...
#' @param src Item target. Another html page for instance.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonPaginationItem <- function(name, src = NULL) {
  htmltools::tags$a(class = "page-link", href= src, name)
}