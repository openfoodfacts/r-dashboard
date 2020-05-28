# libraries ---------------------------------------------------------------
library(tidyverse)
library(shiny)
library(shinydashboard)
library(dashboardthemes) 
library(plotly)
library(ggplot2)

# load data ---------------------------------------------------------------

load(file = "data/raw_data_mutate/f.rds")

# server ------------------------------------------------------------------

shinyServer(function(input, output) {


# key infobox ----------------------------------------------------------------

output$infobox_n_2020 <- renderInfoBox({
       
    p <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        nrow()
    
    p_fr <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        filter(countries_lc == "fr") %>% 
        nrow()
    
    p_en <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        filter(countries_lc == "en") %>% 
        nrow()
    
    p_na <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        filter(is.na(countries_lc)) %>% 
        nrow()
    
    
    infoBox(
        "nombre de produits enregistré depuis le début de l'année", 
        paste(p, "dont :", p_en, "(en)", p_fr, "(fra)", p_na, ("NA")), 
        icon = icon("utensils"),
            color = "blue"
        )
        
})
    
    
# key graph ---------------------------------------------------------------
        
output$scans_n_graph <- renderPlotly({

    g <- ggplot(f %>%
                    group_by(scans_n, entry_dates_tags) %>%
                    summarise() %>%
                    drop_na(),
                aes(y = scans_n, x = entry_dates_tags)) + 
        geom_line(size = 0.2) 
    
    ggplotly(g)

    })
    
    
output$scans_n_graph_fr <- renderPlotly({
    
    g <- ggplot(f %>%
                    group_by(scans_n, entry_dates_tags, countries_lc) %>%
                    # filter(countries_lc == "fr") %>% 
                    summarise() %>%
                    drop_na(),
           aes(y = scans_n, x = entry_dates_tags)) + 
        geom_line(size = 0.2, alpha = .5) +
        facet_wrap(~ countries_lc)

    ggplotly(g)
    
})

output$creator_top <- renderTable({
    
    f %>%
        group_by(creator, countries_lc) %>%
        summarise(n = n()) %>% 
        drop_na() %>% 
        arrange(desc(n)) %>% 
        head(10)

})

})

