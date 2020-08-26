
library(shiny)
library(readr)


shinyServer(function(input, output) {


    
    
    upload_file <- reactive({
        browser()
        file_content <- input$upload_file
    })
    
    
    
    
    
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
    
    output$numeric_io <- renderText({
        input$numeric_input
    })
    
    output$single_box_io <- renderText({
        input$single_box
    })
    
    output$multiple_box_io <- renderText({
        input$group_box
    })
    
    output$text_io <- renderText({
        input$text_input
    })
    
    output$text_area_io <- renderText({
        input$text_area
    })
    
    output$action_bt_io <- renderText({
          input$action_button
    })
    
    output$action_link_io <- renderText({
        input$action_link
    })
    
})
