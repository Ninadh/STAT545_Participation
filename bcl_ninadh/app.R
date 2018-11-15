

library("shiny")
library(tidyr)
bcl <- read.csv("~/Desktop/STAT545/STAT545_Participation/bcl_ninadh/bcl-data.csv", stringsAsFactors = FALSE)


ui <- fluidPage(
  titlePanel("BC Liquor price app", 
             windowTitle = "BCL app"),
  sidebarLayout(
    sidebarPanel(sliderInput("priceInput", "Select your desired price range.",
                             min = 0, max = 100, value = c(15, 30), pre="$"),
                 radioButtons("typeInput", "Select your beverage price range", 
                              choices = c("Beer", "Refreshment", "Spirit", "Wine"),
                              selected = "Wine")
    ),
    mainPanel(
      plotOutput("price_hist"),
      tableOutput("BCL_data")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  observe(print(input$priceInput))
  bcl_filtered <-  reactive({
    bcl %>%
      filter(Price < input$priceInput[2],
             Price > input$priceInput[1],
             Type == input$typeInput)
  })
  output$price_hist <- renderPlot({
    bcl_filtered() %>%
      ggplot(aes(Price)) +
      geom_histogram ()
  })
  output$price_hist <- renderTable({
    bcl_filtered()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

