#' Create a Boostrap 4 row
#'
#' Build an argon row
#'
#' @param ... Any UI element.
#' @param center Whether to center row elements or not. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonRow(
#'   argonColumn(
#'     width = 6,
#'     argonH1(
#'       display = 3, 
#'       "ArgonR, HTML static template for R", 
#'       htmltools::span("completed with examples")
#'     ) %>% argonTextColor(color = "white"),
#'     argonLead(
#'       "Argon is a great free UI package based on Bootstrap 
#'               4 that includes the most important components and features"
#'     ) %>% argonTextColor(color = "white")
#'   ),
#'   argonColumn(
#'     width = 6,
#'     argonImage(
#'       src = "inst/images/imac.svg",
#'       floating = TRUE
#'     ) %>% argonPersp(side = "right")
#'     %>% argonBlur()
#'   )
#'  )
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonRow <- function(..., center = FALSE) {
  rowCl <- "row"
  if (center) rowCl <- paste0(rowCl, " align-items-center justify-content-center")
  
  htmltools::tags$div(class = rowCl, ..., htmltools::tags$br())
}