library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output) {
  
  #loading the selected file
  filedata <- reactive({
    infile <- input$select_meths
    read.csv(file.path(getwd(),'methods',infile), header = T, sep = ',')
  })

  output$display_plot <- renderPlot({
    target <- input$select_target
    files <- input$select_plot
    if(is.null(files)) {
      return()
    }
    
    sens <- c()
    spes <- c()
    
    for(file in files)
    {
      tp = 0
      tn = 0
      fp = 0
      fn = 0
      name<-gsub(".csv", "", basename(file))
      fname <- c(fname, name)
      d<-read.table(file.path(getwd(),'methods',file), header=T,sep=",")
      for(i in 1:dim(d)[1])
      {
        if(target == d[i,2]){
          if(d[i,2] == d[i,3]){
            tp <- tp+1
          }else{
            fp <- fp+1
          }
        }else{
          if(d[i,2] == d[i,3]){
            tn <- tn+1
          }else{
            fn <- fn+1
          }
        }
        i <- i+1
      }
      sensitivity = round(tp/(tp+fn), 2)
      specificity = round(tn/(tn+fp), 2)
      sens <- c(sens, sensitivity)
      spes <- c(spes, specificity)
    }
    specificity <- spes
    sensitivity <- sens
    data <- data.frame(specificity, sensitivity)
    # show(data)
    qplot(specificity, sensitivity, data = data)
    
  })
    
  output$display_text <- renderText({
    paste(input$select_meths)
  })
  output$method_content <- renderTable({
    filedata()
  })

}