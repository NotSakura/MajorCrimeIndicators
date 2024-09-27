#### Preamble ####
# Purpose: Simulates Shelter occupancy data
# Author: Shreya Sakura Noskor
# Date: 09-18-2024
# Contact: sakura.noskor@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
set.seed(304) # For reproducibility

# Define parameters
n <- 1000 # Number of records
start_date <- as.Date("2020-01-01")
end_date <- as.Date("2023-12-31")

# Generate random report and occurrence dates
report_dates <- sample(seq(start_date, end_date, by = "day"), n, replace = TRUE)
occurrence_dates <- report_dates - sample(1:30, n, replace = TRUE) # Occurrence date can be up to 30 days before report date

# Define police divisions (20 unique divisions)
police_divisions <- paste("Division", LETTERS[1:20]) # estimate of divisions

# Define MCI categories
mci_categories <- c(
  "Assault", "Robbery", "Break and Enter", "Auto Theft", "Homicide",
  "Theft", "Harassment"
) # what i think the MCIs are

# Simulate neighborhoods (100 unique neighborhoods)
neighborhoods <- paste("Neighborhood", 1:100) # estimate of neighbourhoods

# Create the data frame
simulated_data <- data.frame(
  REPORT_DATE = report_dates,
  OCC_DATE = occurrence_dates,
  DIVISION = sample(police_divisions, n, replace = TRUE),
  MCI_CATEGORY = sample(mci_categories, n, replace = TRUE),
  HOOD_158 = sample(neighborhoods, n, replace = TRUE)
)

# Display the first few rows of the simulated dataset
head(simulated_data)
