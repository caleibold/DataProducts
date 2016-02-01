---
title       : Data Products Project
subtitle    : MPG Prediction
author      : Chris Leibold
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Deliverables

Application

> * https://caleibold.shinyapps.io/MPGPredictor/

Presentation

> * 

---

## Source

MTCars Dataset

> * The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).

---

## Model

Linear regression of MPG against horsepower, number of cylinders, and weight

> * data(mtcars)

> * model <- lm(mpg ~ hp + cyl + wt, data=mtcars)

> * mpg <- function(hp, cyl, wt) {model$coefficients[1] + model$coefficients[2] * hp + 
    model$coefficients[3] * cyl + model$coefficients[4] * wt
    
---

---

## Inputs

> * Horsepower: min = 50, max = 330, step = 10

> * Cylinders: 4, 6, or 8

> * Weight: min = 1500, max = 5500, step = 100

---










