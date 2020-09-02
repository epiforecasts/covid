#!bin/bash

## Update the git repo with new results
git add --all && git commit -m "Updated website" && git push

## Deploy the website to gh-pages
cp -r docs/. ../docs
git checkout --orphan gh-pages
rm -f -r *
cp -r ../docs/. .
rm -r ../docs
rm .gitnore
rm -r .github
rm .Rbuildignore
touch .gitignore
cat .gitignore .Rproj.user
git add --all
git commit -m "deploy site"
git push -f origin gh-pages:gh-pages
git checkout master
git branch -D gh-pages