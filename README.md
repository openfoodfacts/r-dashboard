# project structure

* data
  * raw_data 
    * bson 
      * products.bson (download the .bson file at this address : https://static.openfoodfacts.org/data/openfoodfacts-mongodbdump.tar.gz)
  * raw_data_mutate (sample in Rdata, made from _raw_data_transformation.R_)
  * raw_data_transformation.R (script to transform .bson data)
  * raw_data_transformation_personnalnote.R (another script, not used)
* example (other work)
* rsconnect (needed for web deployment)
* server.R 
* ui.R
* ui_1.R
* ui_2.R

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

* (1) data acquisition > library(mongolite)::find()
* (2) data reduction > library(tidyverse)
* (3) r shiny design & structure > library(shiny)
* (4) r shiny deployment dev (shinyapps.io server)

# to do

## (1) data acquisition 

- [x] increase step by step the sample (currently 10k lines)
- [ ] might have scallable issue

## (2) data reduction

- [ ] better understanding of the data scheme
- [ ] unnest and better actions on data
- [ ] increase of the number of variable for better insight

## (3) r shiny design & structure

- [x] skeleton
- [x] implementation shinydasboard theme
- [ ] right organisation for a better understanding 
- [ ] geographical reading (leaflet)
