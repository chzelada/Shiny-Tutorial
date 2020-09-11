
library(shiny)


shinyUI(fluidPage(
tabsetPanel(
    tabPanel('Ejemplo 1',
             numericInput("min","Minimo",value = 0),
             numericInput("max",'Maximo',value = 5),
             sliderInput('slider_ex','Update slider',min=0, max=5, value=2)
             ),
    tabPanel('Ejemplo 2',
             sliderInput('s1','s1',value = 0, min=-5, max=5),
             sliderInput('s2','s2',value = 0, min=-5, max=5),
             sliderInput('s3','s3',value = 0, min=-5, max=5),
             actionButton('reset','reset')
             ),
    tabPanel('Ejemplo 3',
             numericInput('n',"Corridas",value = 20),
             actionButton('correr','Correr')
             ),
    tabPanel('Ejemplo 4',
             numericInput('nvalue','valor',0)
             ),
    tabPanel('Ejemplo 5',
             numericInput("temp_c", 'Celsius', value = NA , step=1),
             numericInput("temp_f", 'Farenheit', value = NA , step=1)
             )
)
))
