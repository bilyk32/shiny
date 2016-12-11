library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Solution quadratic function"),
  sidebarPanel(h1("ax^2 + bx + c"),
               
               numericInput('a', 'a coefficient',value=1, min = -10, max = 10, step =1),
               numericInput('b', 'b coefficient',value=2,min = -10, max = 10, step =1),
               numericInput('c', 'c coefficient',value=-3,min = -10, max = 1, step =1),
               sliderInput('xr','x-range',value = 10, min=5, max=20, step=1),
               sliderInput('yr','y-range',value = 10, min=5, max=20, step=1),
               
               submitButton('Complete')
               
  ),
  mainPanel(
    plotOutput('graph'),
    
    h2("Discriminant"),
    verbatimTextOutput('dis'),
    
    h2("The roots of the equation"),
    
    h4("X1="),
    verbatimTextOutput('res1'),
    
    h4("X2="),
    verbatimTextOutput('res2')
    
  )
))
