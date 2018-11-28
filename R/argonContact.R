#' Create a Boostrap 4 argon contact form
#'
#' Build an argon contact form
#'
#' @param title Form title.
#' @param subtitle Form subtitle.
#' @param name Contact name.
#' @param mail Contact mail.
#' @param subject Message subject.
#' @param message For message
#' @param mailto Adress to which send the form.
#' @param width Form width. Between 1 and 12.
#' 
#' @note Need to have an active formspree.io account.
#' See \url{https://formspree.io}. Only works on web-server!
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonContact <- function(title = NULL, subtitle = NULL, name = "Your name", 
                         mail = "Email Adress", subject = "Subject", 
                         message, mailto, width = 8) {
  
  
  formTag <- htmltools::tags$form(
    action = paste0("https://formspree.io/", mailto),
    method = "POST",
    argonMargin(
      orientation = "y", 
      value = 2,
      argonRow(
        center = TRUE,
        argonMargin(
          orientation = "y",
          value = 2,
          argonColumn(
            width = 3,
            center = TRUE,
            htmltools::tags$input(
              class = "input-group input-group-alternative",
              type = "text", 
              name ="name", 
              placeholder = name
            ) 
          )
        ),
        argonMargin(
          orientation = "y",
          value = 2,
          argonColumn(
            width = 3, 
            center = TRUE,
            htmltools::tags$input(
              class = "input-group input-group-alternative", 
              type = "email", 
              name = "email", 
              placeholder = mail
            ) 
          )
        ),
        argonMargin(
          orientation = "y",
          value = 2,
          argonColumn(
            width = 3,
            center = TRUE,
            htmltools::tags$input(
              class = "input-group input-group-alternative", 
              type = "text", 
              name = "_subject", 
              placeholder = subject
            ) 
          )
        )
      )
    ),
    argonMargin(
      orientation = "y", 
      value = 2,
      argonColumn(
        width = 12,
        center = TRUE,
        htmltools::tags$textarea(
          class = "input-group input-group-alternative", 
          name = "message", 
          placeholder = message,
          rows = "8"
        )
      ) 
    ),
    htmltools::tags$input(type = "text", name = "_gotcha", style = "display:none"),
    htmltools::tags$input(type = "hidden", name = "_next", value = "/"),
    argonRow(
      center = TRUE,
      argonColumn(
        center = TRUE, 
        width = 6, 
        argonMargin(
          orientation = "y", 
          value = 2,
          htmltools::tags$input(
            class = "btn btn-default btn-round btn-block btn-lg", 
            type = "submit", 
            value = "Send"
          ) 
        )
      ) 
    )
  )
  
  # card wrapper
  mainTag <- htmltools::tags$div(
    class = "card bg-gradient-secondary shadow",
    htmltools::tags$div(
      class = "card-body p-lg-5",
      htmltools::h4(class = "mb-1", title),
      htmltools::p(class = "mt-0", subtitle),
      formTag
    )
  )
  
  # column wrapper
  if (!is.null(width)) {
    argonColumn(
      width = width,
      center = TRUE,
      mainTag
    )
  }
  
  
}

