
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products Project'),
  sidebarPanel(
    h3('Instructions'),
    p('Enter the horsepower, number of cylinders, and weight of the 
      car below.  The predicted MPG will be shown to the right.'),
    h3('Please enter predictors below.'),
    numericInput('hp', 'Gross horsepower:', 140, min = 50, max = 330, step = 10), # example of numeric input
    radioButtons('cyl', 'Number of cylinders:', c('4' = 4, '6' = 6, '8' = 8), selected = '4'), # example of radio button input
    numericInput('wt', 'Weight (lbs):', 3200, min = 1500, max = 5500, step = 100)
    ),
  mainPanel(
    h3('MPG Prediction'),
    h4('Horsepower, Cylinder, and Weight Inputs:'),
    verbatimTextOutput("inputValues"),
    h4('Predicted MPG:'),
    verbatimTextOutput("prediction"),
    plotOutput('plots'),
    h3('Method'),
    p('I fit a linear model using the mtcars dataset, modeling MPG as a function of 
      horsepower, number of cylinders, and weight. I used radio buttons to limit the
      possible number of cylinders to 4, 6, and 8. Reactive() is used to convert the 
      user input weight into lb/1000. A pre-set function using the linear model 
      predicts the mpg based on the user inputs.')
    )
  ))
