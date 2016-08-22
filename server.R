#
# This is the server logic of a Shiny web application - "mtcars Data Explorer". 
# This web application is created for the course project: Coursera - Developing Data Products
#
# Author: Ashish Mungi
#
# You can run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$value <- renderPrint({ input$checkGroup })
  
  output$mvr <- renderPrint({
    choiceVector <- as.vector(input$checkGroup)
    
    if(("am" %in% choiceVector) && !("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && ("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ wt, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && !("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ qsec, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && !("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ cyl, data = mtcars))
    }
    else if (("am" %in% choiceVector) && ("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+wt, data = mtcars))
    }
    else if (("am" %in% choiceVector) && !("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+qsec, data = mtcars))
    }
    else if (("am" %in% choiceVector) && !("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+cyl, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && ("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ wt+qsec, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && ("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ wt+cyl, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && !("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ qsec+cyl, data = mtcars))
    }
    else if (("am" %in% choiceVector) && ("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && !("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+wt+qsec, data = mtcars))
    }
    else if (("am" %in% choiceVector) && ("wt" %in% choiceVector) && !("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+wt+cyl, data = mtcars))
    }
    else if (("am" %in% choiceVector) && !("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+qsec+cyl, data = mtcars))
    }
    else if (!("am" %in% choiceVector) && ("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ wt+qsec+cyl, data = mtcars))
    }
    else if (("am" %in% choiceVector) && ("wt" %in% choiceVector) && ("qsec" %in% choiceVector) && ("cyl" %in% choiceVector)){
      summary(lm(mpg ~ am+wt+qsec+cyl, data = mtcars))
    }
    else {
      summary(lm(mpg ~ ., data = mtcars))
    }
  })
  
  output$summary <- renderPrint({
    summary(mtcars)
  })
  
  output$table <- DT::renderDataTable({
    DT::datatable(mtcars, options = list(orderClasses = TRUE))
  })
  
})
