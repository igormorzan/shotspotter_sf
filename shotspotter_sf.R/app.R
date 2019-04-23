#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI with cool theme
ui <- fluidPage(theme = shinytheme("darkly"), tabsetPanel(
  
  tabPanel(
   
   # Application title
   titlePanel("Locations of Gunfire incidents in San Francisco, CA (2013 - 2015)"),
   
   # Sidebar with a brief explanation of the plot 
   sidebarLayout(
      sidebarPanel(
        div(style="text-align:left","This plot shows incidents of",br(), "multiple gunshots",br(),
            "detected by the ShotSpotter",br(),"program in San Francisco.")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        width = 7,
        imageOutput("plot1")
      ))
),

  tabPanel("About", textOutput("about"))

))

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
   
   output$message <- renderText(br(),
    "This project was made with data from the ShotSpotter project, thanks to the Justice Tech Lab.",
    br(),
    "Our code for this project can be found here:",
    )
}

# Run the application 
shinyApp(ui = ui, server = server)

