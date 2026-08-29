#installing and loading packages
install.packages("tidyverse")
library(tidyverse)

#reading in raw data
majors <- read_csv(here::here("data", "raw", "recent_grads.csv"))

#create two groups from the ShareWomen category to stratify tables
majors_cats <- majors |>
  mutate(women_cat = factor(ShareWomen >= 0.5,
                            labels = c("Under 50% women", "50% or more women")))

# check to make sure coding is correct
count(majors_cats, women_cat)
# save the cleaned data
write_rds(majors_cats, here::here("data", "clean", "majors_clean.rds"))
