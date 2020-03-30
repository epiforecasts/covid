#!bin/bash


## Deploy the website to gh-pages
git subtree split --squash --prefix docs -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages