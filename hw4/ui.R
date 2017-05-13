library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram

meths <- list.files('./methods/')

fluidPage(
  
  # Application title
  titlePanel("DataScience HW4!"),
  
  # Sidebar with methods of options
  sidebarLayout(
    sidebarPanel(
      radioButtons('select_meths', 'Select methods to display', 
                         choices = meths)
      # chekcboxGroupInput('select_target')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      # plotOutput("distPlot"),
      textOutput("display_text"),
      tableOutput("method_content")
      
      
    )
  )
)