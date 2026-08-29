library(tidyverse)
library(gtsummary)

# read in the cleaned data saved by clean-data.R
majors_cats <- read_rds(here::here("data", "clean", "majors_clean.rds"))

# descriptive table stratified by gender composition of the major
table1 <- tbl_summary(
  majors_cats,
  by = women_cat,
  include = c(Median, unempl_pct, Total),
  label = list(
    Median ~ "Median earnings (USD)",
    unempl_pct ~ "Unemployment rate (%)",
    Total ~ "Number of graduates"
  ),
  missing_text = "Missing")|>
  
  # test whether the two groups differ
  add_p(test = all_continuous() ~ "t.test")|>
  bold_labels() |>
  
  # rename and bold the first and last column headers
  modify_header(label = "**Characteristic**", p.value = "**P-value**") |>
  
  # add a title
  modify_caption("**Table 1. Characteristics of undergraduate majors, by gender composition**") 
  
table1
