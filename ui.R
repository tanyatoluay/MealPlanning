library(shiny)
library(bslib)
library(shinycssloaders)

recipes <- c(
    "Dolma",
    "Chicken Tikka Masala",
    "Beef Fried Rice",
    "Orman Kebabı",
    "Chicken Parmesan and Noodles",
    "Pizza",
    "Vegetables with Rice",
    "Meatballs and Potatoes",
    "Fish and Salad",
    "Goulash and Dumplings",
    "Steak with Veggies",
    "Stir Fry",
    "Risotto",
    "Pasta Carbonara",
    "Schnitzel with Potatoes",
    "Pasta Napoletana",
    "Club Sandwich",
    "Creamy Mushroom"
)


shinyUI(fluidPage(
    
    
    navbarPage(""),
    
    titlePanel(
        fluidRow(
            column(9, "Meal Planner"), 
            column(3, list(tags$head(tags$style()), 
                           HTML('<img src="data:image/png;base64,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",
             height="100px" style="float:right"/>','<p style="color:black"></p>')))
        )
    ),
    
    
    
    theme = bs_theme(version = 4, bootswatch = "flatly"),
    tabsetPanel(
        tabPanel(
            title="Planning",
            icon = icon("pizza-slice"),
            fluid = TRUE,
            sidebarLayout(
                sidebarPanel(numericInput("req.days",
                                          "Number of days:",
                                          value = 7,
                                          min = 1,
                                          max = 30,
                                          step = 1,
                                          width = '150px'),
                             textAreaInput("user.recipes", 
                                           "Add your own meal ideas (csv/tsv):",
                                           value = ""),
                             actionButton("button", "Plan!", icon("cutlery")) 
                    ),
                    
                # Tabs
                mainPanel(
                    tableOutput("menu.table")
                ) #main panel
            ) #sidebarLayout
        ), #tabPanel
        tabPanel("Options", icon = icon("hamburger"),
                 h4("Out of ideas?"),
                 p("Don't be! Click on the links to check these channels:"),
                              actionButton("youtube",
                              label = "Gennaro Contaldo",
                              icon = icon("youtube"),
                              onclick = sprintf("window.open('%s')", "https://www.youtube.com/c/gennarocontaldo")),
                 actionButton("youtube",
                              label = "Refika Birgül",
                              icon = icon("youtube"),
                              onclick = sprintf("window.open('%s')", "https://www.youtube.com/c/refikaninmutfagi")),
                 actionButton("youtube",
                              label = "Jamie Oliver",
                              icon = icon("youtube"),
                              onclick = sprintf("window.open('%s')", "https://www.youtube.com/c/jamieoliver")),
                 actionButton("youtube",
                              label = "Twisted",
                              icon = icon("youtube"),
                              onclick = sprintf("window.open('%s')", "https://www.youtube.com/channel/UCay2P72vJn22IdJ7Mh25ccg")),
                 br(),
                 br(),
                 p("This app is made with hate ♥ ฅ(^◕ᴥ◕^)ฅ "
                   ),
        )
    ) #tabsetPanel
)) #fluidPage
