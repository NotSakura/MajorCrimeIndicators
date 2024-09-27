#### Preamble ####
# Purpose: Simulates Shelter occupancy data
# Author: Shreya Sakura Noskor
# Date: 09-18-2024
# Contact: sakura.noskor@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

install.packages("webshot2")
install.packages(c("dplyr", "sf", "leaflet"))


#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]



#### Save data ####

# get package
package <- show_package("major-crime-indicators")
package

# get all resources for this package
resources <- list_package_resources("major-crime-indicators")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c("csv", "geojson"))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number() == 1) %>% get_resource()
data

## don't run as it already exists in repository
# write_csv(
#   x = data,
#   file = "data/raw_data/MCI_rates.csv"
# )
