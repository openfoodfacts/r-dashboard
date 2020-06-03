fluidRow(
  
  infoBoxOutput("infobox_n_2020"),
  
  infoBoxOutput("infobox_scan_2020"),
  
  box(
      tags$h4("change in the number of scans"),
      plotly::plotlyOutput("scans_n_graph")
  ),
  box(
      tags$h4("change in the number of scans per country"),
      plotly::plotlyOutput("scans_n_graph_fr")
  ),
  box(tags$h4("top 20 contributors"),
      tableOutput("creator_top")),
  
  box(tags$h4("top 50 catergories"),
      tableOutput("categories_hierarchy_top")),
  

  
    
  
)