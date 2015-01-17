data(mtcars)

shinyServer(
  function(input, output) {
    output$myHist <- renderPlot({
      cyl <- as.numeric(input$cyl)  
      
      mpg <- mtcars[mtcars$cyl==cyl,]$mpg
      disp <- mtcars[mtcars$cyl==cyl,]$disp
      hp <- mtcars[mtcars$cyl==cyl,]$hp
      
      hist(mpg, xlab='mpg', col='lightblue',main=paste('Histogram \n mpg for cars with ', cyl, 'cylinders', sep=' '))
    })
    output$myPlot <- renderPlot({
      cyl <- as.numeric(input$cyl)  
      
      disp <- mtcars[mtcars$cyl==cyl,]$disp
      hp <- mtcars[mtcars$cyl==cyl,]$hp
      
      reg1 <- lm(hp~disp)
      par(cex=.8)
      plot(hp~disp, xlab='displacement', main=paste('Horse Power v.s. hp\n for cars with ', cyl, 'cylinders', sep=' '))
      abline(reg1)
    })
    output$mySummary <- renderPrint({
      cyl <- as.numeric(input$cyl)
      
      dt <- mtcars[mtcars$cyl==cyl,c(-2)]
      s<-matrix(rownames(dt), ncol=1)
      colnames(s) <- 'Vehicle'
      s
    })
    
  }
)
