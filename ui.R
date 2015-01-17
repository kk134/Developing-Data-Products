shinyUI(pageWithSidebar(
  headerPanel("Automobile Information"),
  sidebarPanel(
    h4('Instructions'),
    h5('To update the information, please select the following information'),
    radioButtons(inputId = "cyl",
                 label = "Number of Cylinders",
                 choices = list("4" = "4", "6" = "6", "8" = "8")),
    verbatimTextOutput('mySummary')
    
  ),
  mainPanel(
    plotOutput('myHist'),
    plotOutput('myPlot')
  )
))
