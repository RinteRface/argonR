#' Create a Boostrap 4 argon page
#'
#' Build an argon page
#'
#' @param ... Body content
#' @param navbar Navbar.
#' @param footer Footer.
#' @param title App title.
#' @param author Author.
#' @param description Purpose.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonPage <- function(..., title = NULL, description = NULL, author = NULL, 
                      navbar = NULL, footer = NULL){
  
  htmltools::tags$html(
    # head: need to use takeHeads from htmltools to extract all head elements
    htmltools:::takeHeads(
      htmltools::tags$head(
        htmltools::tags$meta(charset = "utf-8"),
        htmltools::tags$meta(
          name = "viewport",
          content = "width=device-width, initial-scale=1, shrink-to-fit=no"
        ),
        htmltools::tags$meta(name = "description", content = description),
        htmltools::tags$meta(name = "author", content = author),
        htmltools::tags$title(title),
        
        # web dependencies CSS
        htmltools::tags$link(href = "inst/assets/img/brand/favicon.png", rel = "icon", type = "image/png"),
        htmltools::tags$link(href = "https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/nucleo/css/nucleo.css", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/font-awesome/css/font-awesome.min.css", rel = "stylesheet"),
        htmltools::tags$link(type = "text/css", href = "inst/assets/css/argon.min.css", rel = "stylesheet")
        
      )
    ),
    # Body
    htmltools::tags$body(
      htmltools::tags$header(class = "header-global", navbar),
      htmltools::tags$main(...),
      footer,
      
      # Core -->
      htmltools::tags$script(src = "inst/assets/vendor/jquery/jquery.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/popper/popper.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/bootstrap/bootstrap.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/headroom/headroom.min.js"),
      # Optional JS -->
      #htmltools::tags$script(src = "inst/assets/vendor/onscreen/onscreen.min.js"),
      #htmltools::includeScript(path = "./assets/vendor/nouislider/js/nouislider.min.js"),
      #htmltools::includeScript(path = "./assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"),
      
      # Argon JS -->
      htmltools::tags$script(src = "inst/assets/js/argon.min.js")
    )
  )
}




#' Create an HTML version of the argonPage
#'
#' @param filename HTML filename for instance, index.html.
#' @param path Where to store the saved file. By default, getwd().
#' @param argonPage Slot for \link{argonPage}.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonPageTemplate <- function(filename = "index.html", path = getwd(), argonPage) {
  # add DOCTYPE html before the page
  argonPage <- paste0("<!DOCTYPE html>", as.character(argonPage), collapse = "\n")
  file.create(paste0(path, "/", filename, ".html"))
  utils::write.table(
    argonPage,
    file = paste0(path, "/", filename, ".html"),
    quote = FALSE,
    col.names = FALSE,
    row.names = FALSE
  )
}