
library(shiny)
library(lubridate)


shinyUI(fluidPage(

   
    titlePanel("Inputs en Shiny"),

    tabsetPanel(tabPanel("Inputs Examples", 
                         
                         sidebarLayout(
                             sidebarPanel(
                                 sliderInput("Slider-input",
                                             "Number of bins:",
                                             value=50,
                                             min = 0,
                                             max = 100,
                                             step = 10,
                                             post = '%',animate = TRUE),
                                 sliderInput("slider_input2",
                                             "Seleccione un rango",
                                             value = c(0,200),
                                             min=0,
                                             max=200,
                                             step=10,
                                             animate=TRUE),
                                 selectInput('select_input',"Seleccione un auto:",
                                             choices = rownames(mtcars),
                                             selected ="Camaro Z28",
                                             multiple = FALSE ),
                                 selectizeInput('select_input_2',"Seleccione autos:",
                                                choices = rownames(mtcars),
                                                selected ="Camaro Z28",
                                                multiple = TRUE ),
                                 dateInput('date_input',"Ingrese la fecha:",
                                           value = today(),
                                           min = today()-60,
                                           max = today()+30,
                                           language = 'es',
                                           weekstart = 1),
                                 dateRangeInput("date-range","Ingrese Fechas",
                                                start =today()-7,
                                                end = today(),separator = 'a'),
                                 numericInput("numeric_input", "Ingrese un numero: ",
                                              value = 10,min = 0, max = 100,step = 1 ),
                                 checkboxInput("single_box","Seleccione si verdadero:",value = FALSE),
                                 checkboxGroupInput("group_box", "Seleccione opciones:",
                                                    choices = LETTERS[1:5]),
                                 textInput("text_input","ingrese texto:"),
                                 textAreaInput("text_area","Ingrese Parrafo"),
                                 actionButton("action_button","ok"),
                                 actionLink("action_link","Siguiente"),
                                 submitButton(text = "reprocesar")
                             ),
                             
                             mainPanel(
                                 h2("Slider input sencillo"),
                                 verbatimTextOutput("slider-io"),
                                 h2("Slider input rango"),
                                 verbatimTextOutput("slider_io_2"),
                                 h2("Select input"),
                                 verbatimTextOutput("select_io"),
                                 h2("Select Input Multiple"),
                                 verbatimTextOutput("select_io_multi"),
                                 h2("Fecha"),
                                 verbatimTextOutput('date_io'),
                                 h2('Rango de fechas'),
                                 verbatimTextOutput('range_io'),
                                 h2('Numeric Input'),
                                 verbatimTextOutput('numeric_io'),
                                 h2('single Checkbox'),
                                 verbatimTextOutput('single_box_io'),
                                 h2('Grouped checkbox'),
                                 verbatimTextOutput('multiple_box_io'),
                                 h2('Texto'),
                                 verbatimTextOutput("text_io"),
                                 h2('Parrafo'),
                                 verbatimTextOutput("text_area_io"),
                                 h2('Action Button'),
                                 verbatimTextOutput("action_bt_io"),
                                 h2('Action Link'),
                                 verbatimTextOutput("action_link_io")
                                 
                             )
                         )
                         ),
                tabPanel("tab2",
                         sidebarLayout(
                           sidebarPanel(
                             h2("Subir Archivo al app"),
                             fileInput("upload_file","Seleccionar")
                                        ),
                           mainPanel("main"
                                     )
                         )
                         
                         ))
    
))
