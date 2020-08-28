
library(shiny)
library(ggplot2)
library(dplyr)
library(DT)


shinyUI(fluidPage(

    
    titlePanel("Old Faithful Geyser Data"),

    fluidRow(column(6,DT::dataTableOutput('tabla1')), 
               column(6,
                      h2("Seleccion multiple"),
                      DT::dataTableOutput("tabla2"),
                      verbatimTextOutput("texto2"))),
    fluidRow(column(6,
                    h2("Seleccion unica"),
                    DT::dataTableOutput("tabla3"),
                    verbatimTextOutput("texto3")
                    ),
             column(6,h2("Seleccion Columna"),
                    DT::dataTableOutput('tabla4'),
                    verbatimTextOutput("texto4"))),
    fluidRow(column(6,
                    h2("Seleccion de Celda"),
                    DT::dataTableOutput('tabla5'),
                    verbatimTextOutput("texto5")
                    ),
             column(6,
                    h2("Seleccion Fila y Columna"),
                    DT::dataTableOutput('tabla6'),
                    verbatimTextOutput('texto6')
                    ))
    
))
