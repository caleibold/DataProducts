library(shiny)
data(mtcars)

model <- lm(mpg ~ hp + cyl + wt, data=mtcars)

mpg <- function(hp, cyl, wt) {
  model$coefficients[1] + model$coefficients[2] * hp + 
    model$coefficients[3] * cyl + model$coefficients[4] * wt
}

shinyServer(
  function(input, output) {
    adjusted_weight <- reactive({input$wt/1000})
    predicted_mpg <- reactive({mpg(input$hp, as.numeric(input$cyl), adjusted_weight())})
    output$inputValues <- renderPrint({paste(input$cyl, "cylinders, ",
                                             input$hp, "horsepower, ",
                                             input$wt, "lbs")})
    output$prediction <- renderPrint({paste(round(predicted_mpg(), 2), "miles per gallon")})
    output$plots <- renderPlot({
      par(mfrow = c(1, 3))
      # (1, 1)
      with(mtcars, plot(hp, mpg,
                        xlab='Horsepower',
                        ylab='MPG',
                        main='MPG vs Horsepower'))
      points(input$hp, predicted_mpg(), col='blue', cex=3)                 
      # (1, 2)
      with(mtcars, plot(cyl, mpg,
                        xlab='Cylinders',
                        ylab='MPG',
                        main='MPG vs Cylinders'))
      points(as.numeric(input$cyl), predicted_mpg(), col='blue', cex=3)  
      # (1, 3)
      with(mtcars, plot(wt, mpg,
                        xlab='Weight (lb/1000)',
                        ylab='MPG',
                        main='MPG vs weight'))
      points(adjusted_weight(), predicted_mpg(), col='blue', cex=3)  
    })
  }
)