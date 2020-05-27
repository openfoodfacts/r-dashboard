# aim 

Give insight for the bureau administration of Openfoodfacts.

# technology & method

R & R Shiny.
The raw data is a .bson drop (NOSQL). Use of an asynchrone method : generation of a .rds file from .bson to be read in R Shiny. 

# main variable used

* creator > id creator
* countries_lc > id country
* scans_n > tally scan
* created_t > date 
* categories_hierarchy > categorie tag product >>> need to unnest
* nutrition_grades > nutrition grade product >>> need to be unnest

# roadmap 

* data acquisition > library(mongolite)::find()
* data reduction > library(tidyverse)
* r shiny design & structure > library(shiny)
* r shiny deployment dev (shinyapps.io server)

# to do

**** data acquisition

- [x] increase step by step the sample (currently 10k lines)
- [ ] might have scallable issue

**** data reduction

- [ ] better understanding of the data scheme
- [ ] unnest and better actions on data
- [ ] increase of the number of variable for better insight

**** r shiny design & structure

- [x] skeleton
- [x] implementation shinydasboard theme
- [ ] right organisation for a better understanding 
- [ ] geographical reading (leaflet)
