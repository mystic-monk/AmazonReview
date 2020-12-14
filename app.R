#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shinythemes)

#source('ModelRun.R', local = TRUE)
model <- readRDS(file = "model.rds")

#source(model <- readRDS(file = "model.rds"))
shinyApp(
    ui = tagList(
        #shinythemes::themeSelector(),
        shinythemes::shinytheme("journal"),
        navbarPage(
            # theme = "cerulean",  # <--- To use a theme, uncomment this
            "Amazon Product Reviews Analysis",
            tabPanel("Navbar 1",
                     sidebarPanel(
                         fileInput("file1", "File input:"),
                         # textInput("txt", "Text input:", "general"),
                         # sliderInput("slider", "Slider input:", 1, 100, 30),
                         #tags$h5("Default actionButton:"),
                         #actionButton("action", "Search"),
                         
                         #tags$h5("actionButton with CSS class:"),
                         actionButton(inputId = "input_action", "Action button", class = "btn-primary")
                     ),
                     mainPanel(
                         tabsetPanel(
                             tabPanel("Tab 1",
                                      h4("Table"),
                                      tableOutput("table"),
                                      #h4("Verbatim text output"),
                                      #verbatimTextOutput("txtout"),
                                      h1("Header 1"),
                                      h2("Header 2"),
                                      h3("Header 3"),
                                      h4("Header 4"),
                                      h5("Header 5")
                             ),
                             tabPanel("Tab 2", "This panel is intentionally left blank"),
                             tabPanel("Tab 3", "This panel is intentionally left blank")
                         )
                     )
            ),
            tabPanel("Navbar 2", "This panel is intentionally left blank"),
            tabPanel("Navbar 3", "This panel is intentionally left blank")
        )
    ),
    server = function(input, output, session) {
#        function(input, output, session){
#            output$table <- renderTable(reviewanalysis(input$file))
#        }
#        output$txtout <- renderText({
#            paste(input$txt, input$slider, format(input$date), sep = ", ")
#        })
#        output$table <- renderTable({
#            head(cars, 4)
#        })
        
        
        observeEvent(input$input_action,{
            
            
            
            output$table <- renderTable({
                inFile <- input$file1
                
                if (is.null(inFile))
                    return(NULL)
                filedata <- read.csv(inFile$datapath)
                preds <- predict(model, filedata)
                head(model$results, 4)
                #results <- reviewanalysis(inFile$name)
                #fileData <- reactiveFile(1000, session, file=file$datapath, read.csv)
                #read.csv(file)
                #head(results, 4)
                #reviewanalysis(file)
            })
            #output$table <- renderTable({
            #    head(result, 4)
            #})
        })

        
    }
)
