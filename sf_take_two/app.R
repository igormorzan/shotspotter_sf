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

# Define UI for application - we picked a nice theme because themes are cool! 
# We also gave the tabs their own titles and centered things because that looks clean. 

ui <- fluidPage(theme = shinytheme("journal"),
                
                tabsetPanel(
                  
                  tabPanel("Plot",

                    mainPanel(
                      h1("Locations of Gunfire incidents in San Francisco, CA (2013 - 2015)",
                      imageOutput("img"),
                      align = "center"
                    ),
                    h5("Simone Chu and Igor Morzan",
                       align = "center"))),
                  
                  tabPanel("About", textOutput("message"))
                ))
                

# Defining server logic
# We made the gif in our .Rmd file so that the server would load more quickly. 
server <- function(input, output) {
  
  output$img <- renderImage({
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

