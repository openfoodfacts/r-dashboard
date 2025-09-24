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

# Initial aim 

* Give insights for the board of Open Food Facts.

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

### Third party applications

* Feel [free to open a PR to add your application in this list](https://github.com/openfoodfacts/r-dashboard/edit/master/REUSERS.md).
* Please get in touch at reuse@openfoodfacts.org
* We are very interested in learning what the Open Food Facts data is used for. It is not mandatory, but we would very much appreciate it if you tell us about your re-uses (https://forms.gle/hwaeqBfs8ywwhbTg8) so that we can share them with the Open Food Facts community. You can also fill this form to get a chance to get your app featured: https://forms.gle/hwaeqBfs8ywwhbTg8


## Discuss
* We have a R channel to discuss: https://openfoodfacts.slack.com/archives/C2CR356NR

## Authors
