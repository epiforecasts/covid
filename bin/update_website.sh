#!/bin/bash

## Make sure the repo is up to date
git pull

## Make sure all submodules are up to date
git submodule update --init --recursive

## Make sure all dependencies are up to date and installed
Rscript -e "devtools::install_dev_deps()"

## Reset the data cache
Rscript -e "NCoVUtils::reset_cache()"

## Update global nowcasts
cd _nowcasts/covid-global
bash update_nowcasts.sh
cd ../..

## Update regional breakdowns
cd _nowcasts/covid-regional
bash update_nowcasts.sh
cd ../..

## Update national reports
Rscript utils/update_report_templates.R

## Update all posts
Rscript utils/update_posts.R

## Update the website
Rscript -e "rmarkdown::render_site()"

## Clean up nowcast folders
Rscript utils/clean_built_site.R

## Update the submodule gits
bash bin/update_submodules.sh

## Update the git repo with new results
git add --all && git commit -m "Updated website" && git push

## Deploy the website to gh-pages
bash bin/deploy_website.sh
