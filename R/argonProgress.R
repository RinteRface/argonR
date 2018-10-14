#' Create a progress bar
#'
#' Build an argon progress bar
#' 
#' @param value Progress value between 0 and 100.
#' @param text Label text.
#' @param status Progress status color.  
#' 
#' @examples 
#' if (interactive()) {
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonProgress <- function(value, text = "Task completed", status = "primary") {
  
  stopifnot(value < 100)
  
  progressWrapper <- htmltools::tags$div(class = "progress-wrapper")
  progressTag <- htmltools::tags$div(class = "progress-info")
  progressLabel <- htmltools::tags$div(
    class = "progress-label",
    htmltools::tags$span(text)
  )
  progressPercent <- htmltools::tags$div(class = "progress-percentage", paste0(value, "%"))
  progressBar <- htmltools::tags$div(
    class = "progress",
    htmltools::tags$div(
      class = paste0("progress-bar bg-", status),
      role = "progressbar",
      `aria-valuenow` = value,
      `aria-valuemin` = "0",
      `aria-valuemax` = "100",
      style= "width: 60%;"
    )
  )
  
  progressTag <- htmltools::tagAppendChildren(
    progressTag,
    progressLabel,
    progressPercent,
    progressBar
  )
  
  htmltools::tagAppendChild(progressWrapper, progressTag)
  
  
}