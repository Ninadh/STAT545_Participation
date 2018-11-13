library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  "test.",
  "more text.",
  tags$h1("level 1 header"),
  h1("level 1 header, part 2"),
  HTML("<h1>level 1 header part 3 <h1>"),
  h1(em("level 1 header, part 2")),
  br(),
  h2("exploring what this is"),
  p("exploring what this is part 2"),
  a(href="http://stat545.com/Classroom/", "Link to STAT545")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
}

# Run the application 
shinyApp(ui = ui, server = server)

