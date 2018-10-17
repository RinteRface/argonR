# argonR
> R interface to argon HTML design

## I am still WIP
Use it carefully since it is work in progress

## ArgonR philosophy
ArgonR primarily aims at building static webpages, without the need of shiny or server part. However,
it can be also used within shiny packages such as argonDash, a bootstrap4 shiny dashboard.
See [here](https://github.com/RinteRface/argonDash) for more details.

## Getting Started

Below is an example of a very basic HTML page:

```r
library(argonR)
library(htmltools)
library(magrittr)
example <- argonPage(
  title = "Argon Static Template",
  author =  "Divad Nojnarg",
  description = "Static Template",
  navbar = argonNavbar(
    id = "main-navbar",
    src = "https://demos.creative-tim.com/argon-design-system/assets/img/brand/white.png",
    # left menu
    argonNavMenu(
      argonDropdown(
        name = "Components",
        size = "lg",
        argonDropdownItem(
          name = "Getting Started",
          description = "Learn how to use Argon compiling Scss, change brand colors and more.",
          src = "test.html",
          icon = "spaceship",
          status = "primary"
        ),
        argonDropdownItem(
          name = "Foundation",
          description = "Learn more about colors, typography, icons and the grid system we used for Argon.",
          src = "",
          icon = "palette",
          status = "warning"
        ),
        argonDropdownItem(
          name = "Components",
          description = "Browse our 50 beautiful handcrafted components offered in the Free version.",
          src = "",
          icon = "ui-04",
          status = "success"
        )
      )
    ),
    # right menu
    argonNavMenu(
      side = "right",
      argonNavItem(
        name = "facebook",
        src = "https://www.facebook.com",
        icon = "facebook-square",
        tooltip = "Like us on Facebook"
      ),
      argonNavItem(
        name = "instagram",
        src = "https://www.instagram.com",
        icon = "instagram",
        tooltip = "Follow us on Instagram"
      ),
      argonNavItem(
        name = "twitter",
        src = "https://www.twitter.com",
        icon = "twitter-square",
        tooltip = "Follow us on Twitter"
      ),
      argonNavItem(
        name = "github",
        src = "https://www.github.com",
        icon = "github",
        tooltip = "Star us on Github"
      )
    )
  ),
  footer = argonFooter(
    has_card = FALSE,
    argonContainer(
      size = "lg",
      argonRow(
        argonColumn(
          width = 6,
          argonIconWrapper(
            iconTag = argonIcon("atom"),
            size = "lg",
            status = "success",
            shadow = TRUE,
            hover_shadow = TRUE
          ),
          argonH1(
            display = 3,
            "Insert anything in the footer"
          ),
          argonLead(
            "The Arctic Ocean freezes every winter and much of 
            the sea-ice then thaws every summer, and that process 
            will continue whatever"
          )
        ),
        argonColumn(
          width = 6,
          argonCarousel(
            id = "carousel1",
            argonCarouselItem(
              src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/img-1-1200x1000.jpg",
              active = TRUE
            ),
            argonCarouselItem(
              src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/img-2-1200x1000.jpg",
              active = FALSE
            )
          ) %>% argonPersp(side = "right")
        )
      )
    )
  ) %>% argonMargin(orientation = "t", value = 20),
  # main content
  argonSection(
    size = "lg",
    status = "default",
    gradient = TRUE,
    separator = TRUE,
    separator_color = "white",
    shape = TRUE,
    argonColumn(
      argonRow(
        argonColumn(
          width = 6,
          argonH1(
            display = 3, 
            "A beautiful Design System", 
            htmltools::span("completed with examples")
          ) %>% argonTextColor(color = "white"),
          argonLead(
            "The design system comes with four pre-built 
             pages to help you get started faster. You 
             can change the text and images and you are good to go."
          ) %>% argonTextColor(color = "white")
        )
      )
    ) %>% argonPadding(orientation = "x", value = 0)
  ),
  argonSection(
    size = "lg",
    status = NULL,
    gradient = FALSE,
    separator = FALSE,
    separator_color = NULL,
    shape = FALSE,
    argonRow(
      argonColumn(
        width = 4,
        argonCard(
          status = "primary",
          width = 12,
          title = "Card 1",
          hover_lift = TRUE,
          shadow = TRUE,
          icon = "check-bold",
          src = "#",
          "Argon is a great free UI package based on Bootstrap 4 
          that includes the most important components and features"
        )
      ),
      argonColumn(
        width = 4,
        argonCard(
          status = "success",
          width = 12,
          title = "Card 2",
          hover_lift = TRUE,
          shadow = TRUE,
          icon = "istanbul",
          src = "#",
          "Argon is a great free UI package based on Bootstrap 4 
          that includes the most important components and features"
        )
      ),
      argonColumn(
        width = 4,
        argonCard(
          status = "warning",
          width = 12,
          title = "Card 3",
          hover_lift = TRUE,
          shadow = TRUE,
          icon = "planet",
          src = "#",
          "Argon is a great free UI package based on Bootstrap 4 
          that includes the most important components and features"
        )
      )
    )
  ) %>% argonMargin(orientation = "t", value = -200)
  %>% argonPadding(orientation = "t", value = 0)
)


argonPageTemplate(filename = "example", path = getwd(), example)
```

While the first part is responsible for creating the page skeleton, 
the `argonPageTemplate()` provides additional treatments to make it run without shiny.

## How to host it?
This is very simple:
* test it locally: after having generated your HTML page as described previously, 
copy the inst folder of this package, which contains all necessary assets, in the
same folder as your HTML page and open the HTML page with any web browser
* On apache or nginx server: copy example.html and the inst folder to the root of your
web server. Enter the web server adress in the web browser.
* On shiny-server: copy example.html and the inst folder to the root of your
shiny-server (usually /srv/shiny-server). Enter the web server adress in the web browser

## Use with shiny

Coming soon...

## Aknowledgements
Many thanks to CreativeTim for creating argon HTML.