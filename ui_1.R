fluidRow(
  
  infoBoxOutput("infobox_n_2020"),
  
  box(
      tags$h4("évolution du n. de scan"),
      plotly::plotlyOutput("scans_n_graph")
  ),
  box(
      tags$h4("évolution du n. de scan par pays"),
      plotly::plotlyOutput("scans_n_graph_fr")
  ),
  box(tags$h4("creator top 20"),
      tableOutput("creator_top"))

  
    
  
)