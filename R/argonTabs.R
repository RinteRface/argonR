#' Create a Boostrap 4 tabs
#'
#' Build an argon tabs
#'
#' @param ... Slot for \link{argonTab}.
#' @param id argonTabs id. Should be unique. 
#' @param card_wrapper Whether to embed tab content in a card. FALSE by default.
#' @param horizontal Whether to display tabs horizontally. TRUE by default.
#' @param circle Whether to display circled design. FALSE by default.
#' @param size Tabs size. "sm" by default. "md", "lg".
#' @param width Tabs width. Between 1 and 12.
#' @param iconList A list of argonIcon such as list("atom", "cloud-upload-96"). 
#' The lenght must have the same length as the number of tabs. NULL by default.
#' 
#' @examples 
#' if (interactive()) {
#'  library(argonR)
#'  argonTabSet(
#'   id = "tab-1",
#'   card_wrapper = TRUE,
#'   horizontal = TRUE,
#'   circle = FALSE,
#'   size = "sm",
#'   width = 6,
#'   iconList = list("cloud-upload-96", "bell-55", "calendar-grid-58"),
#'   argonTab(
#'     tabName = "Tab 1",
#'     active = FALSE,
#'     tabText1
#'   ),
#'   argonTab(
#'     tabName = "Tab 2",
#'     active = TRUE,
#'     tabText2
#'   ),
#'   argonTab(
#'     tabName = "Tab 3",
#'     active = FALSE,
#'     tabText3
#'   )
#'  )
#' }
#' 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonTabSet <- function(..., id, card_wrapper = FALSE, horizontal = TRUE, circle = FALSE,
                      size = "sm", width = 6, iconList = NULL) {
  
  tabCl <- "nav nav-pills nav-fill flex-column"
  if (horizontal) {
    if (!is.null(size)) tabCl <- paste0(tabCl, " flex-", size, "-row")
  } 
  if (circle) tabCl <- paste0(tabCl, " nav-pills-circle")
  
  tabItems <- list(...)
  len_items <- length(tabItems)
  
  found_active <- FALSE
  
  # generate the menu
  tabMenu <- htmltools::tags$div(
    class = "nav-wrapper",
    htmltools::tags$ul(
      class = tabCl,
      id = paste0(id, "-menu"),
      role = "tablist",
      lapply(X = 1:len_items, FUN = function(i) {
        current_item <- tabItems[[i]]
        current_item_name <- current_item[[1]]
        current_item_tag <- current_item[[2]]
        
        current_item_cl <- current_item_tag$attribs$class
        current_item_id <- current_item_tag$attribs$id
        current_item_label <- paste0(current_item_id, "-tab")

        # make sure that if the user set 2 tabs active at the same time, 
        # only the first one is selected
        if (!found_active) {
          active <- sum(grep(x = current_item_cl, pattern = "show active")) == 1
          if (active) found_active <<- TRUE
          # if there is already an active panel, set all other to inactive
        } else {
          active <- FALSE
        }
        
        htmltools::tags$li(
          class = "nav-item",
          htmltools::a(
            class = if (active) "nav-link mb-sm-3 mb-md-3 active" else "nav-link mb-sm-3 mb-md-3",
            id = current_item_label,
            `data-toggle` = "tab",
            href = paste0("#", current_item_id), 
            role = "tab",
            `aria-controls` = current_item_id,
            `aria-selected` = "true",
            if (!is.null(iconList)) argonIcon(name = iconList[[i]]),
            current_item_name
          )
        )
      })
    )
  )
  
  # generate the container
  tabContent <- htmltools::tags$div(
    class = "tab-content",
    id = id,
    lapply(X = 1:len_items, FUN = function(i) tabItems[[i]][[2]])
  )
  
  tabWrapper <- if (card_wrapper) {
    htmltools::tags$div(
      class = "card shadow",
      htmltools::tags$div(class = "card-body", tabContent)
    )
  } else {
    tabContent
  }
  
  argonColumn(width = width, tabMenu, tabWrapper)
  
}




#' Create a Boostrap 4 tab item
#'
#' Build an argon tab item
#'
#' @param ... Tab content
#' @param tabName Tab name: it will be also passed as the id argument. Should be unique.
#' @param id Defaults to NULL. If provided, it will override tabName as the id.
#' @param active Whether the tab is active or not. FALSE bu default. 
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonTab <- function(..., tabName, id = NULL, active = FALSE) {
  
  tabCl <- if (active) "tab-pane fade show active" else "tab-pane fade"
  
  if (is.null(id)) {
    id <- tabName
    # handle punctuation
    id <- gsub(x = id, pattern = "[[:punct:]]", replacement = "")
    # handle tab names with space
    id <- gsub(x = id, pattern = " ", replacement = "")
  }

  tabTag <- htmltools::tags$div(
    class = tabCl,
    role = "tabpanel",
    id = id,
    `aria-labelledby` = paste0(id, "-tab"),
    ...
  )
  
  return(list(tabName, tabTag))
  
}
