# argonR <img src="man/figures/argonR_logo.png" width=200 align="right" />

[![Travis build status](https://travis-ci.org/RinteRface/argonR.svg?branch=master)](https://travis-ci.org/RinteRface/argonR)
[![CRAN status](https://www.r-pkg.org/badges/version/argonR)](https://cran.r-project.org/package=argonR)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-ff69b4.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Project Status](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

> R interface to argon HTML design

## ArgonR philosophy
ArgonR primarily aims at building static webpages, without the need of shiny or server part. However,
it can be also used within shiny packages such as argonDash, a bootstrap4 shiny dashboard.
See [here](https://github.com/RinteRface/argonDash) for more details.

## Installation

```r
# from CRAN
install.packages("argonR")
# Latest version
devtools::install_github("RinteRface/argonR")
```

## Demo

See a demonstration [here](http://130.60.24.205/example.html):

<br>
<a href="http://130.60.24.205/example.html" target="_blank"><img src="man/figures/argonRDemo.png"></a>

## How to host it?
This is pretty simple:
* test it locally: after having generated your HTML page as described previously, 
open it with any web browser
* On apache or nginx server: copy example.html and the inst folder to the root of your
web server. Enter the web server adress in the web browser.
* On shiny-server: copy example.html and the inst folder to the root of your
shiny-server (usually /srv/shiny-server). Enter the web server adress in the web browser

## Use with shiny

### Embedded web applications
See [here](http://130.60.24.205/app_test.html)

## Acknowledgements
* Many thanks to CreativeTim for creating argon HTML.