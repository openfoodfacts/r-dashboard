dashboardPage(
    dashboardHeader(title = "DASHOFF"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("menu 1", tabName = "menu_1", icon = icon("dashboard")),
            menuItem("menu 2", tabName = "menu_2", icon = icon("th"))
    )),
    
    
    dashboardBody(
        
            tabItems(
            tabItem(tabName = "menu_1",
                
                source("ui_1.R", encoding = "UTF-8", local = TRUE)$value),
            
            tabItem(tabName = "menu_2",
                
                source("ui_2.R", encoding = "UTF-8", local = TRUE)$value))

        
    )
)
