#### Do once on Page Load ####
# Load packages
library(RCurl)
library(d3Network)

# Load data once
URL <- "https://raw.githubusercontent.com/christophergandrud/d3Network/master/JSONdata/miserables.json"
MisJson <- getURL(URL, ssl.verifypeer = FALSE)

# Convert JSON arrays into data frames
MisLinks <- JSONtoDF(jsonStr = MisJson, array = "links")
MisNodes <- JSONtoDF(jsonStr = MisJson, array = "nodes")

# Create individual ID
MisNodes$ID <- 1:nrow(MisNodes)

#### Shiny ####
shinyServer(function(input, output) {

    output$networkPlot <- renderPrint({
        d3ForceNetwork(Nodes = MisNodes, 
                        Links = MisLinks,  
                        Source = "source", Target = "target", 
                        Value = "value", NodeID = "name", 
                        Group = "group", width = 400, height = 500, 
                        opacity = input$slider, standAlone = FALSE,
                        parentElement = '#networkPlot')
    })
})
