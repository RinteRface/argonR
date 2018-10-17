argonPage(
  title = "Argon Static Template",
  author =  "Divad Nojnarg",
  description = "Static Template",
  navbar = argonNavbar(
    id = "main-navbar",
    src = "#",
    # left menu
    argonNavMenu(
      argonDropdown(
        name = "Components",
        size = "lg",
        argonDropdownItem(
          name = "Getting Started",
          description = "Learn how to use Argon compiling Scss, change brand colors and more.",
          src = "",
          icon = "spaceship",
          status = "danger"
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
        icon = "facebook-square",
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
    has_card = TRUE,
    argonRow(
      argonColumn(
        width = 6,
        argonPersp(
          side = "right",
          argonImage(
            url = "https://www.google.com",
            src = "https://demos.creative-tim.com/argon-design-system/assets/img/theme/promo-1.png",
            floating = TRUE,
            card_mode = TRUE,
            hover_lift = FALSE
          )
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
        ) %>% argonPersp(side = "left")
      )
    )
  ),
  # main content
  
)