
library(shiny)
library(ggplot2)
library(dplyr)

out_click<- NULL
out_hover<-NULL

shinyServer(function(input, output) {

output$grafica_base_r <- renderPlot({
    plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="Miler per Galon")
})

output$grafica_ggplot <- renderPlot({
    diamonds %>% 
        ggplot(aes(x=carat,y=price, color=color))+
        geom_point()+
        ylab("Precio")+
        xlab("Kilates")+
        ggtitle("Precio diamantes")
})


output$click_base_plot <- renderPlot({
    plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="Miler per Galon")
    
})

output$click_base_plot_xy <- renderPrint({
    c(input$plot_click$x, input$plot_click$y)
})


output$click_ggplot <- renderPlot({
    diamonds %>% 
        ggplot(aes(x=carat,y=price, color=color))+
        geom_point()+
        ylab("Precio")+
        xlab("Kilates")+
        ggtitle("Precio diamantes")
    })

output$ggplot_click_xy <- renderPrint({
    c(input$ggplot_click$x, input$ggplot_click$y)
})

output$plot_click_option <- renderPlot({
    plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="Miler per Galon") 
})


output$all_click_options <- renderPrint({
    if(!is.null(input$clk$x)){
        click <- paste0(c('(',round(input$clk$x,2),',',round(input$clk$y,2),')'),collapse = '')
        click <- paste0("Coordenada del click : ", click,collapse='')
    } else {click<-NULL}
    
    
    if(!is.null(input$dblclick$x)){
        dblclick <- paste0(c('(',round(input$dblclick$x,2),',',round(input$dblclick$y,2),')'),collapse = '')
        dblclick <- paste0("Coordenada del doble click : ", dblclick,collapse='')
        
    } else{dblclick<-NULL}
    
    
    if(!is.null(input$hover$x)){
        hover <- paste0(c('(',round(input$hover$x,2),',',round(input$hover$y,2),')'),collapse = '')
        hover <- paste0("Coordenada del cursor : ", hover,collapse='')
        
    } else {hover=NULL}
    
    
    if(!is.null(input$brush$xmin)){
        brushx <- paste0(c('(',round(input$brush$xmin,2),',',round(input$brush$xmax,2),')'),collapse = '')
        brushy <- paste0(c('(',round(input$brush$ymin,2),',',round(input$brush$ymax,2),')'),collapse = '')
        brush <- cat('\t rango en x: ', brushx,'\n','\t rango en y: ', brushy)
        
    } else {brush<-NULL}
 
cat( click,dblclick,hover,brush,sep = "\n" )
})


puntos <- reactive({
    if(!is.null(input$click_plot_tarea$x)){
        df<-nearPoints(mtcars,input$click_plot_tarea,xvar='wt',yvar='mpg')
        out <- df %>% 
            select(wt,mpg)
        out_click <<- rbind(out_click,out) %>% distinct()
        return(out)
    }
    if(!is.null(input$hover_plot_tarea$x)){
        df<-nearPoints(mtcars,input$hover_plot_tarea,xvar='wt',yvar='mpg')
        out <- df %>% 
            select(wt,mpg)
        out_hover <<- out
        return(out_hover)
    }
    
    if(!is.null(input$dblclck_plot_tarea$x)){
        df<-nearPoints(mtcars,input$dblclck_plot_tarea,xvar='wt',yvar='mpg')
        out <- df %>% 
            select(wt,mpg)
        out_click <<- setdiff(out_click,out)
        return(out_hover)
    }
    
    if(!is.null(input$brush_plot_tarea)){
        df<-brushedPoints(mtcars,input$brush_plot_tarea,xvar='wt',yvar='mpg')
        out <- df %>% 
            select(wt,mpg)
        out_click <<- rbind(out_click,out) %>% dplyr::distinct()
        return(out_hover)
    }
    
    
    
})


mtcars_plot <- reactive({
    plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="Miles per Galon")
    puntos <-puntos()
    if(!is.null(out_hover)){
        points(out_hover[,1],out_hover[,2],
               col='gray',
               pch=16,
               cex=2)}
    if(!is.null(out_click)){
    points(out_click[,1],out_click[,2],
              col='green',
              pch=16,
           cex=2)}
    
    
    
    
   
    
})

output$plot_tarea <- renderPlot({
    
    mtcars_plot()
})


click_table <- reactive({
    input$click_plot_tarea$x
    input$dblclck_plot_tarea$x
    input$brush_plot_tarea
    out_click
})

output$tarea_dt <- DT::renderDataTable({
    click_table() %>% DT::datatable()
})

})
