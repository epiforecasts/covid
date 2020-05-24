#!/bin/bash


## Update national reports
Rscript utils/update_report_templates.R

## Update the paper
Rscript utils/update_paper.R

## Update all posts
Rscript utils/update_posts.R

## Update the website
Rscript -e "rmarkdown::render_site()"

## Clean up nowcast folders
Rscript utils/clean_built_site.R

