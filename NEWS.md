# argonR 0.2.0
- Fix #9: remove close button from `argonModal()`. Thanks @Morais14
- change the icon parameter of `argonTabSet()`, `argonCard()`, `argonAlert()`,
`argonDropdownItem()`, `argonNavItem()`, `argonButton()` and `argonSocialButton()`
Now you can use `icon("cogs")` from shiny or `argonIcon()` as usual
- add offset arg to `argonColumn()`
- Add btn_text argument to `argonCard()`
- Fix #1: headroom.js and add the corresponding argument to `argonNavbar()`
- Fix #7 introduced with #4
- `argonProgress()` text arg has been set to NULL by default
- Fix #4: prefix all `argonTabs()` by the namespace of their `argonTabSet()` container
Thanks @shawnlinxl!
- Fix #2: setting background_color in `argonCard()` make the background title
transparent
- add width argument to `argonImage()`
- bug fix: `argonImage()` link was missing when card_mode is FALSE in `argonImage()`
- add hex
- add a view argument to `argonPageTemplate()`
- add analytics argument to `argonPage()`
- add href argument to `argonNavbar()`
- add src_collapsed arg to `argonNavbar()` so that brand logo are displayed on small screens
- add `argonContact()`
- add favicon argument to `argonPage()` and update assets folder accordingly
- add src argument to `argonButton()`
- add `argonSocialButton()`

# argonR 0.1.0
- first release