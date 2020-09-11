
library(shiny)


shinyServer(function(input, output, session) {

    observeEvent(input$min, {
        updateSliderInput(session,'slider_ex',min = input$min)
    })
    
    observeEvent(input$max, {
        updateSliderInput(session,'slider_ex',max = input$max)
    })
    
    observeEvent(input$reset, {
        updateSliderInput(session,'s1',value = 0)
        updateSliderInput(session,'s2',value = 0)
        updateSliderInput(session,'s3',value = 0)
    })
    
    
    observeEvent(input$n,{
        label <- paste0('Correr ', input$n, ' veces')
        updateActionButton(session, 'correr',label = label)
    })
    
    observeEvent(input$nvalue, {
        updateNumericInput(session, 'nvalue', value = input$nvalue+1)
    })
    
    observeEvent(input$temp_c, {
        f <- round(input$temp_c*9/5+32) 
        updateNumericInput(session, 'temp_f',value=f)
    })
    
    observeEvent(input$temp_f, {
        c <- round((input$temp_f-32)*5/9) 
        updateNumericInput(session, 'temp_c',value=c)
    })
    
})
