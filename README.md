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

**IMPORTANT**
Step 3 must run before step 4, if you change the raw data and only re-render
your edit will not appear.

##AI note
The only use of AI for this assignment was to find the code to remove 
scientific notation
Figure.R file on line 11, 
**prompt**
"I coded a ggplot and the output has scientific notation on the y-axis
how do i change this so it displays the full numbers instead"






