#!bin/bash

## Update the git repo with new results
git add --all && git commit -m "Updated website" && git push

## Deploy the website to gh-pages
cp -r docs ../docs
git checkout--orphan -b  gh-pages
rm -f -r *
cp -r ../docs/. .
git push -f origin gh-pages:gh-pages
git branch -D gh-pages