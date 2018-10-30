#' Create a Boostrap 4 argon navbar
#'
#' Build an argon navbar
#'
#' @param ... Slot for \link{argonNavMenu}.
#' @param src Brand image path or url. 
#' @param id Navbar toggle unique id.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonNavbar <- function(..., src = NULL, id) {
  
  # brand
  navBrand <- htmltools::tags$a(
    class = "navbar-brand mr-lg-5",
    href= "#",
    htmltools::tags$img(src = src)
  )
  
  # toggler
  navbarToggler <- htmltools::tags$button(
    class="navbar-toggler collapsed",
    type="button",
    `data-toggle` = "collapse",
    `data-target` = paste0("#", id),
    `aria-controls` = id,
    `aria-expanded` = "false",
    `aria-label` = "Toggle navigation",
    htmltools::tags$span(class = "navbar-toggler-icon")
  )
  
  # collapse wrapper
  navbarCollapse <- htmltools::tags$div(
    class = "navbar-collapse collapse",
    id = id,
    style = NA,
    htmltools::tags$div(
      class="navbar-collapse-header",
      htmltools::tags$div( 
        class="row",
        htmltools::tags$div(
          class="col-6 collapse-brand",
          htmltools::tags$a(href="#", htmltools::tags$img(src = src))
        ),
        htmltools::tags$div( 
          class="col-6 collapse-close",
          htmltools::tags$button(
            type = "button", 
            class = "navbar-toggler", 
            `data-toggle` = "collapse", 
            `data-target` = paste0("#", id), 
            `aria-controls` = id, 
            `aria-expanded` = "false", 
            `aria-label`="Toggle navigation",
            htmltools::tags$span(),
            htmltools::tags$span()
          )
        )
      )
    ),
    ...
  )
  
  # wrapper
  htmltools::tags$nav(
    class = "navbar navbar-main navbar-expand-lg navbar-transparent navbar-light",
    id = "navbar-main",
    htmltools::tags$div(
      class = "container",
      navBrand,
      navbarToggler,
      navbarCollapse
    )
  )
}




#' Create a Boostrap 4 argon navbar menu
#'
#' Build an argon navbar menu
#'
#' @param ... Slot for \link{argonNavItem} and \link{argonDropdown}.
#' @param side Nav menu side. "left by default" but can also be "right".
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonNavMenu <- function(..., side = "left") {
  
  navMenuCl <- if (side == "left") {
    "navbar-nav navbar-nav-hover align-items-lg-center"
  } else if (side == "right") {
    "navbar-nav align-items-lg-center ml-lg-auto"
  }
  
  htmltools::tags$ul(class = navMenuCl, ...)
}



#' Create a Boostrap 4 argon navbar item
#'
#' Build an argon navbar item
#'
#' @param name Item name.
#' @param src HTML target page.
#' @param icon Item icon of any.
#' @param tooltip Text to display when the item is hovered.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonNavItem <- function(name = NULL, src = NULL, icon = NULL, tooltip = NULL) {
  htmltools::tags$li(
    class = "nav-item",
    htmltools::tags$a(
      class = "nav-link nav-link-icon", 
      href = src,
      target = "_blank",
      `data-toggle` = "tooltip",
      title = "",
      `data-original-title` = tooltip,
      htmltools::tags$i(class = paste0("fa fa-", icon)),
      htmltools::tags$span(class = "nav-link-inner--text d-lg-none", name)
    )
  )
}


#' Create a Boostrap 4 argon dropdown menu
#'
#' Build an argon dropdown menu
#'
#' @param ... Slot for \link{argonDropdownItem}.
#' @param name Dropdown menu name.
#' @param size Dropdown size: NULL or "xl".
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonDropdown <- function(..., name, size = NULL) {
  
  dropdownCl <- "dropdown-menu"
  if (!is.null(size)) dropdownCl <- paste0(dropdownCl, " dropdown-menu-", size)
  
  htmltools::tags$li(
    class = "nav-item dropdown",
    # button
    htmltools::tags$a(
      href = "#",
      class = "nav-link",
      `data-toggle` = "dropdown",
      role = "button",
      htmltools::tags$i(class="ni ni-ui-04 d-lg-none"),
      htmltools::tags$span(class="nav-link-inner--text", name)
    ),
    # inner menu
    htmltools::tags$div(
      class = dropdownCl,
      htmltools::tags$div(class = "dropdown-menu-inner", ...)
    )
  )
}



#' Create a Boostrap 4 argon dropdown item
#'
#' Build an argon dropdown item
#' 
#' @param name Item name.
#' @param description Item description if any.
#' @param src HTML target page.
#' @param icon Item icon of any.
#' @param status Icon and name color status. See \url{https://demos.creative-tim.com/argon-design-system/docs/foundation/colors.html}.
#'
#' @examples
#' if(interactive()){
#'  library(argonR)
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
argonDropdownItem <- function(name = NULL, description = NULL, src = NULL, 
                              icon = NULL, status = NULL) {
  htmltools::tags$a(
    class = "media d-flex align-items-center",
    href = src,
    # icon if any
    if (!is.null(icon)) {
      argonIconWrapper(
        iconTag = argonIcon(icon, color = "white"),
        gradient_color = status,
        circle = TRUE,
        size = NULL,
        status = status,
        shadow = FALSE, 
        hover_shadow = FALSE
      )
    },
    htmltools::tags$div(
      class = "media-body ml-3",
      htmltools::tags$h6(class = paste0("heading text-", status, " mb-md-1"), name),
      htmltools::tags$p(class = "description d-none d-md-inline-block mb-0", description)
    )
  )
}