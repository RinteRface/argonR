library(argonR)
library(htmltools)
library(magrittr)
app_test <- argonPage(
  title = "ArgonR Static Template",
  author =  "Divad Nojnarg",
  description = "HTML Static Template",
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
          description = "BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla",
          src = "test.html",
          icon = "spaceship",
          status = "primary"
        ),
        argonDropdownItem(
          name = "Foundation",
          description = "BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla",
          src = "",
          icon = "palette",
          status = "warning"
        ),
        argonDropdownItem(
          name = "Components",
          description = "BlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBlaBla",
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
  footer = argonFooter() %>% argonMargin(orientation = "t", value = 20),
  # main content
  argonSection(
    size = "lg",
    status = "default",
    gradient = TRUE,
    separator = TRUE,
    separator_color = "white",
    shape = TRUE,
    argonColumn(
      width = 12,
      argonCarousel(
        width = 12,
        floating = TRUE, 
        hover_lift = FALSE,
        id = "carousel2",
        argonCarouselItem(
          src = "http://130.60.24.205/dreamRs_ratp/",
          active = TRUE,
          mode = "iframe"
        ),
        argonCarouselItem(
          src = "http://130.60.24.205/Lorenz_parameters/",
          active = FALSE,
          mode = "iframe"
        ),
        argonCarouselItem(
          src = "http://130.60.24.205/argonDash/",
          active = FALSE,
          mode = "iframe"
        )
      ) %>% argonPersp(side = "right")
    )
  ) %>% argonMargin(orientation = "y", value = 300)
)

argonPageTemplate(filename = "app_test", path = "/Users/macdavidgranjon/Desktop/", app_test)