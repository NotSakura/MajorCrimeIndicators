#### Preamble ####
# Purpose: Simulates Shelter occupancy data
# Author: Shreya Sakura Noskor
# Date: 09-18-2024
# Contact: sakura.noskor@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <-
  read_csv(
    "data/raw_data/MCI_rates.csv",
    show_col_types = FALSE
  )


cleaned_data <- raw_data %>%
  select(REPORT_DATE, OCC_DATE, DIVISION, LOCATION_TYPE, MCI_CATEGORY, HOOD_158) %>%
  mutate(
    REPORT_DATE = as.Date(REPORT_DATE),
    OCC_DATE = as.Date(OCC_DATE),
    DATE_DIFF = as.integer(REPORT_DATE - OCC_DATE)
  ) %>%
  drop_na()


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/cleaned_data.csv")
