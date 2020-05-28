#installation du packet 
install.packages("sparklyr")

#load du packet
library(sparklyr)

#installation de la version de spark
spark_install()

#connexion à spark en local
sc <- spark_connect(master = "local", version = "2.4.3")

#import dans spark local du json transformée en data table spark 
options(sparklyr.sanitize.column.names = TRUE)

options(checkColumnDUplication)

import_data <- spark_read_json(sc, path = "data/openfoodfacts-products.jsonl", options = c("multiline",  "true"))

import_data <- spark_read_json(sc, path = "data/openfoodfacts-products.jsonl", options =checkColumnNameDuplication = F)

import_data <- spark_read_json(sc, path = "data/openfoodfacts-products <- .jsonl", options =checkColumnNameDuplication = F)


# Erreur : org.apache.spark.sql.AnalysisException: Found duplicate column(s) in the data schema: `ingredients_text_es`, `product_name_es`, `generic_name_es`;


# another attemp ----------------------------------------------------------

# creation d'un fichier temporaire jsonl
f <- tempfile(fileext = ".jsonl")

writeLines(fpeek::peek_head("data/openfoodfacts-products.jsonl", 1, intern = TRUE), f)

spark_read_json(sc, name = "foo", path = f)

install.packages("fpeek")

library(fpeek)

library(jsonlite)

con<-"data/openfoodfacts-products.jsonl"

mydata <- as.data.frame(readLines(con, n = 100))

n <- fpeek::peek_count_lines("data/openfoodfacts-products.jsonl")

#with the small file 

spark_read_json(sc, name = "foo1", path = "data/small.jsonl")

# 1359960 nrow 

library(sparklyr)
f <- tempfile(fileext = ".jsonl")
writeLines('
{"noproblem": 17}
{"problem": 1, "problem": 2}
', f)
spark_read_json(sc, name = "foo", path = f)


#flatten collect, deux fonctions à regarder 

stats <- flt$aggregate(
  '[{"$group":{"_id":"$carrier", "count": {"$sum":1}, "average":{"$avg":"$distance"}}}]',
  options = '{"allowDiskUse":true}'
)
