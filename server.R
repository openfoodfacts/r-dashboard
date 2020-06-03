# libraries ---------------------------------------------------------------
library(tidyverse)
library(shiny)
library(dashboardthemes) 

# load data ---------------------------------------------------------------

load(file = "data/raw_data_mutate/f.rds")

# server ------------------------------------------------------------------

shinyServer(function(input, output) {


# key infobox ----------------------------------------------------------------

output$infobox_n_2020 <- renderInfoBox({
 
    
    p <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        nrow()
    
    p_diff <- f %>% 
        filter(entry_dates_tags >= "2019-01-01" & entry_dates_tags <= "2020-01-01") %>% 
        nrow()
    
    p_fr <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        filter(countries_lc == "fr") %>% 
        nrow()
    
    p_fr_diff <- f %>% 
        filter(entry_dates_tags >= "2019-01-01" & entry_dates_tags <= "2020-01-01") %>% 
        filter(countries_lc == "fr") %>% 
        nrow()
    
    p_en <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        filter(countries_lc == "en") %>% 
        nrow()
    
    p_en_diff <- f %>% 
        filter(entry_dates_tags >= "2019-01-01" & entry_dates_tags <= "2020-01-01") %>% 
        filter(countries_lc == "en") %>% 
        nrow()
    
    p_na <- f %>% 
        filter(entry_dates_tags > "2020-01-01") %>% 
        filter(is.na(countries_lc)) %>% 
        nrow()
    
    p_na_diff <- f %>% 
        filter(entry_dates_tags >= "2019-01-01" & entry_dates_tags <= "2020-01-01") %>% 
        filter(is.na(countries_lc)) %>% 
        nrow()
        
    infoBox(
        "new product in the database since the start of 2020", 
        paste(p, "of which :", p_en, "(en)", p_fr, "(fra)", p_na, ("(na)")), 
        icon = icon("utensils"),
        subtitle = paste("[reminder value 2019]", p_diff, "of which :", p_en_diff, ("(en)"), p_fr_diff, ("(fra)"),p_na_diff, ("(na)")),
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
                    drop_na(countries_lc) %>% 
                    group_by(scans_n, entry_dates_tags, countries_lc) %>%
                    summarise(),
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

output$categories_hierarchy_top <- renderTable({


    g <- f$categories_hierarchy %>%
        compact() %>%
        map( ~ discard(.x, ~ .x %in% "fr")) %>% #keep only en: categories
        unlist() %>%
        as_tibble %>%
        group_by(value)


    g %>% 
        group_by(value) %>% 
        summarise(n = n()) %>% 
        arrange(desc(n)) %>% 
        head(50)



})





# end ---------------------------------------------------------------------

})

