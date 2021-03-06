#!/bin/bash

## Get latest estimates
## Rscript utils/update_estimates.R

## Symlink estimates into this repository
## ln -s ../covid-rt-estimates covid-rt-estimates

## Update national reports
Rscript utils/update_report_templates.R

## Update the paper
Rscript utils/update_paper.R

## Manually force a UK page update
Rscript -e 'rmarkdown::render("_posts/national/united-kingdom/united-kingdom.Rmd")'

## Update all Rscript
Rscript utils/update_posts.R

## Clean up after page update
Rscript utils/clean_page_update.R

## Copy paper figures into root directory
## cp -r _paper/figures figures/

## Update the website
mv README.md _README.md
Rscript -e "rmarkdown::render_site()"
mv _README.md README.md
## Clean up nowcast folders
Rscript utils/clean_built_site.R

## Remove paper figures from root
## rm -r -f figures
