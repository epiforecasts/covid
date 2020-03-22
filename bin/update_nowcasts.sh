#!/bin/bash

## Make sure the repo is up to date
git pull

## Make sure all dependencies are up to date and installed
Rscript -e "devtools::install_all_dev_deps()"

## Reset the data cache
Rscript -e "NCoVUtils::reset_cache()"

## Update the global nowcast
Rscript -e "_posts/global/nowcast/update_nowcasts.R"

## Update regional nowcasts
Rscript -e "_posts/italy/nowcast/update_nowcasts.R"

## Update the website
Rscript -e "rmarkdown::render_site()"

## Update the git repo with new results
git add --all && git commit -m "Updated nowcasts"

## Deploy the website to gh-pages
git subtree push --prefix docs origin gh-pages