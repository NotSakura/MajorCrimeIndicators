#### Preamble ####
# Purpose: Simulates Shelter occupancy data
# Author: Shreya Sakura Noskor
# Date: 09-18-2024
# Contact: sakura.noskor@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####

#### Clean data ####
data <-
  read_csv(
    "data/analysis_data/cleaned_data.csv",
    show_col_types = FALSE
  )


all(!is.na(data$REPORT_DATE)) # Check for no NA values
test_case_5 <- data$REPORT_DATE |> min() >= as.Date("2014-01-01")
test_case_6 <- data$REPORT_DATE |> max() <= as.Date("2014-12-31")

# Check OCC_DATE for correct date range
all(!is.na(data$OCC_DATE)) # Check for no NA values
class(data$OCC_DATE) == "Date"

## check if same number of data
sum(!is.na(data[["REPORT_DATE"]])) == sum(!is.na(data[["OCC_DATE"]]))
sum(!is.na(data[["REPORT_DATE"]])) == sum(!is.na(data[["DIVISION"]]))
sum(!is.na(data[["REPORT_DATE"]])) == sum(!is.na(data[["HOOD_158"]]))
