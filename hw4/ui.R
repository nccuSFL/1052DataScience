library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram

meths <- list.files('./methods/')

fluidPage(
  
  # Application title
  titlePanel("DataScience HW4!"),
  
  # Sidebar with options
  sidebarLayout(
    sidebarPanel(
      radioButtons('select_target', 'Select target', 
                   choices = c('Male'='male', 'Female'='female')),
      checkboxGroupInput('select_plot', 'Select methods to plot', 
                         choices = c("Method 1" = "method1.csv", "Method 2" = "method2.csv", 
                                        "Method 3" = "method3.csv", "Method 4" = "method4.csv", 
                                        "Method 5" = "method5.csv", "Method 6" = "method6.csv", 
                                        "Method 7" = "method7.csv", "Method 8" = "method8.csv", 
                                        "Method 9" = "method9.csv", "Method 10" = "method10.csv")),
      radioButtons('select_meths', 'Select methods to display content', 
                         choices = meths)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("display_plot"),
      textOutput("display_text"),
      tableOutput("method_content")
      
    )
  )
)