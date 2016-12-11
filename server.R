library(shiny)

disc <- function(a,b,c) b^2-4*a*c

x <- function(a,b,c) -b/(2*a)
x1 <- function(a,b,c) (-b + sqrt(b^2-4*a*c))/(2*a)
x2 <- function(a,b,c) (-b - sqrt(b^2-4*a*c))/(2*a)

shinyServer(
  function(input, output) {
    output$graph <- renderPlot({
      xr <- input$xr
      yr <- input$yr
      a <- input$a
      b <- input$b
      c <- input$c
      x <- seq(-xr,xr, by = 1/xr)
      y <- a*(x^2) + b*x + c
      plot(x, y, type = "l", ylim=c(-yr, yr))
      grid()
    })
    
    output$dis <- renderText({
      if (input$a == 0)"It's not a quadratic function"
      else input$b^2-4*input$a*input$c})
    
    output$res1 <- renderText({
      if (input$a == 0) "It's not a quadratic function"
      else if (disc(input$a, input$b, input$c)<0) "no solutions!!!"
      else if (disc(input$a, input$b, input$c) == 0) x(input$a, input$b, input$c)
      else x1(input$a, input$b, input$c)
    })
    
    output$res2 <- renderText({
      if (input$a == 0) "It's not a quadratic function"
      else if (disc(input$a, input$b, input$c)<0) "no solutions!!!"
      else if (disc(input$a, input$b, input$c) == 0) x(input$a, input$b, input$c)
      else x2(input$a, input$b, input$c)
    })
    
  }
)
