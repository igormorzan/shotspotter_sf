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

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("darkly"),
                
                tabsetPanel(
                  
                  tabPanel(
                    
                    # Application title
                    titlePanel("Locations of Gunfire incidents in San Francisco, CA (2013 - 2015)"),
                    
                    # Sidebar with a brief explanation of the plot 
                    sidebarLayout(
                      sidebarPanel(
                        div("This plot shows incidents of multiple gunshots detected by the ShotSpotter program in San Francisco.")
                      )
                    ),      
                    # Show a plot of the generated distribution
                    mainPanel(
                      width = 7,
                      imageOutput("map_sf")
                    )
                  ),
                  
                  tabPanel("About", textOutput("message"))
                  
                ))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$map_sf <- renderImage({
    list(src = "sf.gif",
         contentType = "image/gif")
  }, 
  deleteFile = FALSE)
  
  output$message <- renderText({"This project was made with data from the ShotSpotter project, thanks to the Justice Tech Lab.
    Our code for this project can be found at https://github.com/imorzan/shotspotter_sf."
  })
  
  }

# Run the application 
shinyApp(ui = ui, server = server)

