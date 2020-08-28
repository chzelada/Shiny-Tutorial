
library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {

output$tabla1 <- DT::renderDataTable({
    DT::datatable(diamonds,
                  extensions = 'Buttons',
                  options = list(pageLength = 5,
                                 lengthMenu = c(5, 10, 15),
                                 dom = 'Bfrtip',
                                 buttons = c('csv')),
                  filter = 'bottom'
                  
                  ) %>% 
        formatCurrency(columns = 'price',currency = '$') 
})


output$tabla2 <- DT::renderDataTable({
    mtcars %>% datatable()
})


output$texto2 <- renderPrint({
  input$tabla2_rows_selected
})


output$tabla3 <- DT::renderDataTable({
  mtcars %>% datatable(selection='single')
})

output$texto3 <- renderPrint({
  input$tabla3_rows_selected
})


output$tabla4 <- DT::renderDataTable({
  mtcars %>% datatable(selection = list(mode='multiple',target='column'))
})

output$texto4 <- renderPrint({
  input$tabla4_columns_selected
})


output$tabla5 <- DT::renderDataTable({
  mtcars %>% datatable(selection = list(mode='single',target='cell'))
})

output$texto5 <- renderPrint({
  input$tabla5_cells_selected
})


output$tabla6 <- DT::renderDataTable({
  mtcars %>% datatable(selection = list(mode='multiple',target='row+column'))
})



output$texto6 <- renderPrint({
  filas <- "Filas seleccionadas: "
  sel_filas <- paste0(input$tabla6_rows_selected,collapse = ',')
  paste0(filas,sel_filas,collapse = '') %>% print()
  col <- "Columnas seleccionadas: "
  sel_col <- paste0(input$tabla6_columns_selected,collapse = ',')
  paste0(col,sel_col,collapse = '') %>% print()
  
})




})
