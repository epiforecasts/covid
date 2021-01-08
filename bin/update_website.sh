#!/bin/bash

## Get latest estimates
git submodule update --init --depth 1
cd covid-rt-estimates
git fetch --all
git reset --hard origin/master
cd ..

## Update national reports
Rscript utils/update_report_templates.R

## Update the paper
Rscript utils/update_paper.R

## Manually force a UK page update
Rscript -e 'rmarkdown::render("_posts/national/united-kingdom/united-kingdom.Rmd")'

## Update all posts
Rscript utils/update_posts.R

## Clean up after page update
Rscript utils/clean_page_update.R

## Copy paper figures into root directory
cp -r _paper/figures figures/

## Update the website
mv README.md _README.md
Rscript -e "rmarkdown::render_site()"
mv _README.md README.md
## Clean up nowcast folders
Rscript utils/clean_built_site.R

## Remove paper figures from root
rm -r -f figures
