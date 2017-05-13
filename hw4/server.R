library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output) {
  
  #loading the selected file
  filedata <- reactive({
    infile <- input$select_meths
    read.csv(file.path(getwd(),'methods',infile), header = T, sep = ',')
  })

  output$plot <- renderPlot({
      
    
     
  })
    
  output$display_text <- renderText({
    paste(input$select_meths)
  })
  output$method_content <- renderTable({
    filedata()
  })

}

# getSensitivity <- function()
# {
#   
#   
# }