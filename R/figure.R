library(tidyverse)

# read in the cleaned data saved by clean-data.R
majors_cats <- read_rds(here::here("data", "clean", "majors_clean.rds"))

earnings_plot <- ggplot(majors_cats,
                        aes(x = women_pct, y = Median,
                            color = Major_category)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "black") +
  scale_y_continuous(labels = scales::comma) + #to correct the scientific notion
  labs(x = "Graduates who are women (%)",
       y = "Median earnings (USD)",
       color = "Major category"
  ) +
  theme_minimal()

earnings_plot

#saving image to images folder

ggsave(here::here("images", "earning_by_gender.png"),
       earnings_plot, width = 8, height = 5)
