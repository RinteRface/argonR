#' Create a Boostrap 4 section container
#'
#' Build an argon section container
#'
#' @param ... Any UI element.
#' @param size Section size. NULL by default.
#' @param status Section status. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' @param gradient Section gradient effect. FALSE by default.
#' @param separator Section bottom separator. FALSE by default.
#' @param separator_color Separator color. "secondary" by default. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#' @param shape Whether to include shape in the background. FALSE by default.
#' @param cascade Whether to enable a cascade effect. FALSE by default.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonSection(
#'   size = "lg",
#'   status = "default",
#'   gradient = TRUE,
#'   separator = TRUE,
#'   separator_color = "white",
#'   shape = TRUE,
#'   argonColumn(
#'     argonRow(
#'       argonColumn(
#'         width = 6,
#'         argonH1(
#'           display = 3, 
#'           "ArgonR, HTML static template for R", 
#'           htmltools::span("completed with examples")
#'         ) %>% argonTextColor(color = "white"),
#'         argonLead(
#'           "Argon is a great free UI package based on Bootstrap 
#'           4 that includes the most important components and features"
#'         ) %>% argonTextColor(color = "white")
#'         ),
#'       argonColumn(
#'         width = 6,
#'         argonImage(
#'           src = "inst/images/imac.svg",
#'           floating = TRUE
#'         ) %>% argonPersp(side = "right")
#'         %>% argonBlur()
#'       )
#'       )
#'   )
#'  )
#' }
#' 
#' @note Do not use with the argonDash package. Only for argonR.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonSection <- function(..., size = NULL, status = "default", gradient = FALSE, 
                         separator = FALSE, separator_color = "secondary", shape = FALSE,
                         cascade = FALSE) {
  
  #if (shape) {
  #  if (status != "default" || status != "primary" || status != "dark") status <- "default"
  #} 
  
  sectionCl <- "section"
  if (!is.null(size)) sectionCl <- paste0(sectionCl, " section-", size)
  if (gradient) {
    if (!is.null(status) && !shape) sectionCl <- paste0(sectionCl, " bg-gradient-", status)
  } else {
    if (!shape && !is.null(status)) sectionCl <- paste0(sectionCl, " bg-", status)
  }
  if (shape) sectionCl <- paste0(sectionCl, " section-shaped pb-250")
  if (cascade) sectionCl <- paste0(sectionCl, " section-nucleo-icons pb-250")
  
  htmltools::tags$section(
    class = sectionCl,
    if (shape) {
      htmltools::tags$div(
        class = paste0("shape shape-style-1 shape-", status),
        htmltools::HTML(
          paste0(
            '<span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            '
          )
        )
      )
    }, 
    htmltools::tags$div(
      class = if (shape) "container py-lg-md d-flex" else "container",
      ...
    ),
    if (separator) {
      htmltools::tags$div(
        class = "separator separator-bottom separator-skew zindex-100",
        htmltools::HTML(
          paste0(
            '<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-', separator_color, '" points="2560 0 2560 100 0 100"></polygon>
            </svg>
            '
          )
        )
      )
    }
  )
  
}