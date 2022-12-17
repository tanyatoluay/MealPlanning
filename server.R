library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    observeEvent(input$button, {
        output$menu.table <- renderTable({
            # base set of meals 
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
            
            # Users can input their recipes
            if (input$user.recipes != "") {
                new.recipes <- unlist(strsplit(input$user.recipes, "[,\n]"))
                recipes <- c(recipes, new.recipes)}
            
            # Sample the list
            if (input$req.days <= length(recipes)) {
                menu <- sample(recipes, input$req.days, replace=FALSE)
            }
            
            # Random sampling without replacement
            else {
                menu <- c()
                repeat {
                    menu <- c(menu, sample(recipes, length(recipes), replace=FALSE))
                    remaining <- input$req.days - length(menu) # how many days do we still need to plan?
                    if(remaining < length(recipes)) {
                        menu <- c(menu, sample(recipes, remaining, replace = FALSE))
                        break
                    }
                }
            }
            
            # Generate days
            menu.days <- format(seq(as.Date(Sys.Date()),as.Date(Sys.Date()+length(menu)-1), "days"), "%a, %b %d")
            data.frame(Day = menu.days, Meal = menu)
        })
    })
    output$all.recipes <- renderText(
        print(recipes)
    )
    
    
})