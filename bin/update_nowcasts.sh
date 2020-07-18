#!/bin/bash

## Make sure the repo is up to date
git pull

## Make sure all submodules are up to date
git submodule update --init --recursive

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

## Update regional breakdowns 2
cd _nowcasts/covid-regional-2
bash update_nowcasts.sh
cd ../..
