#!/bin/bash

## Make sure the repo is up to date
git pull

## Make sure all dependencies are up to date and installed
Rscript -e "devtools::install_all_dev_deps()"

## Reset the data cache
Rscript -e "NCoVUtils::reset_cache()"

## Update nowcasts
Rscript utils/update_nowcasts.R

## Update all posts
Rscript utils/update_posts.R

## Update the website
Rscript -e "rmarkdown::render_site()"

## Clean up nowcast folders
Rscript utils/clean_nowcasts.R

## Update the git repo with new results
git add --all && git commit -m "Updated nowcasts" && git push

## Deploy the website to gh-pages
git subtree split --squash --prefix docs -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages
