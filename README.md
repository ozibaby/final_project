# EPI 590R Final Project

Analysis of the relationship between the gender composition of undergraduate
majors and early-career earnings.

## How to reproduce

1. Clone this repository and open final_project.Rproj in RStudio. This is
   required so that here::here() resolves file paths correctly.
2. Install the packages used: "tidyverse", "gtsummary", "here", "scales".
3. Run R/clean-data.R first. This reads the raw CSV in the
   data/raw/recent_grads.csv and writes the cleaned file to
   data/clean/majors_clean.rds.
4. Finally, Render analysis.qmd.

**Important:** step 3 must be run before step 4. The analysis reads the cleaned
.rds file, so if you change the raw data and only re-render, your change will
not appear. Re-run R/clean-data.R first.

##AI note
The only use of AI for this assignment was to find the code to remove 
scientific notation
Figure.R file on line 11, 

**prompt**
"This is my code for ggplot 
(earnings_plot <- ggplot(majors_cats,
                        aes(x = women_pct, y = Median,
                            color = Major_category)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "black") +
  labs(x = "Graduates who are women (%)",
       y = "Median earnings (USD)",
       color = "Major category") +
  theme_minimal())
but the output has scientific notation on the y-axis
how do i change this so it displays the full numbers instead"

**prompt result**
Add a scale_y_continuous() layer with labels = scales::comma:

r
earnings_plot <- ggplot(majors_cats,
                        aes(x = women_pct, y = Median,
                            color = Major_category)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "black") +
  scale_y_continuous(labels = scales::comma) +
  labs(x = "Graduates who are women (%)",
       y = "Median earnings (USD)",
       color = "Major category") +
  theme_minimal()

That turns 2e+04 into 20,000.

Other label options from the same package:

scales::dollar → $20,000 — probably better here, since the axis is money
scales::label_number() → 20000, no comma separator
scales::label_dollar(scale = 1/1000, suffix = "K") → $20K, compact if the axis 
feels crowded

For the x-axis it's scale_x_continuous() with the same argument.

If scales isn't installed: install.packages("scales"). 
Writing it as scales::comma rather than loading the library keeps it explicit 
about where the function comes from.

Why this happens: ggplot switches to scientific notation when numbers get large,
based on R's scipen option. You could change that option globally, 
but the scale_* layer is better practice — it's specific to this plot 
and travels with the code, so anyone rendering your document gets the same axis.





