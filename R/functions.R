library(tidyverse)

# read in the cleaned data saved by clean-data.R
majors_cats <- read_rds(here::here("data", "clean", "majors_clean.rds"))

# summarise any variable passed, with optional split 
# of a grouping variable

summarize_by <- function(data, variable, group = NULL) {
  data |>
    summarise(
      n = sum(!is.na({{ variable }})),
      mean = mean({{ variable }}, na.rm = TRUE),
      sd = sd({{ variable }}, na.rm = TRUE),
      .by = {{ group }}
    )
}

