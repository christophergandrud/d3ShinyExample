library(shiny)

shinyUI(fluidPage(

    # Load d3.js
    tags$head(
        tags$script(src = 'http://d3js.org/d3.v3.min.js')
    ),

    # Application title
    titlePanel('d3Network Shiny Example'),
    p('This is an example of using',
    a(href = 'http://christophergandrud.github.io/d3Network/', 'd3Network'),
        'with',
        a(href = 'http://shiny.rstudio.com/', 'Shiny', 'web apps.')
    ),

    # Sidebar with a slider input for node opacity
    sidebarLayout(
        sidebarPanel(
            sliderInput('slider', label = 'Choose node opacity',
                min = 0, max = 1, step = 0.01, value = 0.5
            )
    ),

    # Show network graph
    mainPanel(
        htmlOutput('networkPlot')
    )
  )
))
