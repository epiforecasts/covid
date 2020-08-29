#!bin/bash

## Update the git repo with new results
git add --all && git commit -m "Updated website" && git push

## Deploy the website to gh-pages
git subtree split --squash --prefix docs -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages