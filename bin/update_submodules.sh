#!bin/bash

## Move into global repo
cd _nowcasts/covid-global

## Update master with then new results
git add --all
git commit -m "Updated nowcasts"
git push origin HEAD:master

## Move into regional issues
cd ../covid-regional

## Update master with then new results
git add --all
git commit -m "Updated nowcasts"
git push origin HEAD:master
