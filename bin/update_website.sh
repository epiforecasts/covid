#!/bin/bash


## Update national reports
Rscript utils/update_report_templates.R

## Update the paper
Rscript utils/update_paper.R

## Update all posts
Rscript utils/update_posts.R

## Copy paper figures into root directory
cp -r _paper/figures figures/

## Update the website
Rscript -e "rmarkdown::render_site()"

## Clean up nowcast folders
Rscript utils/clean_built_site.R

## Remove paper figures from root
rm -r -f figures