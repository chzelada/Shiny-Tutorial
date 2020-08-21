
library(shiny)


shinyServer(function(input, output) {


    
    output$`slider-io` <- renderText({
        paste0( c('Output Slider input: ',input$`Slider-input`),
               collapse='')
    })
    
    output$slider_io_2 <- renderText({
        input$slider_input2
    })
    
    output$select_io <- renderText({
        as.character(input$select_input)
    })
    
    output$select_io_multi <- renderText({
        selections<-paste0(input$select_input_2,collapse = ', ')
        paste0(c("Seleccciones del UI: ", selections),collapse = '')
    }
    )
    
    output$date_io <- renderText({
        as.character(input$date_input)
        })
    
    output$range_io <- renderText({
        as.character(input$`date-range`)
    })
    
})
