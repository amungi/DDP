#
# This is the user-interface definition of a Shiny web application - mtcars Data Explorer. 
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

library(markdown)
data("mtcars")

shinyUI(navbarPage("mtcars Data Explorer",
                   tabPanel("Regression",
                            sidebarLayout(
                              sidebarPanel(
                                checkboxGroupInput("checkGroup", label = h3("Choose Predictors:"), 
                                                   choices = list("Transmission (am)" = "am", "Weight / 1000 lb (wt)" = "wt", 
                                                                  "1/4 mile time (qsec)" = "qsec", "Cylinders (cyl)" = "cyl"
                                                                  ), 
                                                   selected = "am"),

                                hr(),
                                fluidRow(verbatimTextOutput("value"))
                              ),
                              mainPanel(
                                verbatimTextOutput("mvr")
                              )
                            )
                   ),
                   tabPanel("Summary",
                            verbatimTextOutput("summary")
                   ),
                   tabPanel("Raw Data",
                            DT::dataTableOutput("table")
                   ),
                   tabPanel("About",
                            includeMarkdown("about.Rmd")
                   )
        )
)