# argonR <img src="http://www.rinterface.com/inst/images/argonR.svg" width=200 align="right" />

[![Travis build status](https://travis-ci.org/RinteRface/argonR.svg?branch=master)](https://travis-ci.org/RinteRface/argonR)
[![CRAN status](https://www.r-pkg.org/badges/version/argonR)](https://cran.r-project.org/package=argonR)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-ff69b4.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Project Status](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![cranlogs](https://cranlogs.r-pkg.org/badges/argonR)](https://cran.r-project.org/package=argonR)
[![total](https://cranlogs.r-pkg.org/badges/grand-total/argonR)](https://www.rpackages.io/package/argonR)

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

See a demonstration [here](http://rinterface.com/shiny/argonR/):

<br>
<a href="http://rinterface.com/shiny/argonR/" target="_blank"><img src="man/figures/argonRDemo.png"></a>

## How to host it?
This is pretty simple:
* test it locally: after having generated your HTML page as described previously, 
open it with any web browser
* On apache or nginx server: copy example.html and the inst folder to the root of your
web server. Enter the web server adress in the web browser.
* On shiny-server: copy example.html and the inst folder to the root of your
shiny-server (usually /srv/shiny-server). Enter the web server adress in the web browser

## Use with shiny

See [argonDash](https://github.com/RinteRface/argonDash).

## Acknowledgements
* Many thanks to CreativeTim for creating argon HTML.
