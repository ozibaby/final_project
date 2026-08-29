library(tidyverse)
library(gtsummary)

# read in the cleaned data saved by clean-data.R
majors_cats <- read_rds(here::here("data", "clean", "majors_clean.rds"))


#linear model 
linear_model <- lm(Median ~ women_pct + unempl_pct,
                   data = majors_cats)

#regression table
table2 <- tbl_regression(
  linear_model,
  intercept = TRUE,
  label = list(
    women_pct ~ "Women (%)",
    unempl_pct ~ "Unemployment rate (%)"
               )
) |>
  bold_labels() |>
  modify_caption("**Table 2. Linear regression of median earnings**")

table2
