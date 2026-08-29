# EPI 590R Final Project

Analysis of the relationship between the gender composition of undergraduate
majors and early-career earnings.


## How to reproduce

1. Clone repository and open 'final_project.Rproj' in RStudio. 
Required so that 'here::here()' resolves paths correctly.

2. Install packages used: 'tidyverse', 'here', 'gtsummary', 'scales'.

3. Rune 'R/clean/majors_clean.rds first, this reads the raw CSV and writes
'data/clea/majors_clean.rds.
Render 'analysis.qmd'

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






