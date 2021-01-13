#!bin/bash

## Check everything up to date
git pull -X theirs

## Update the website
bash bin/update_website.sh

## Update github and deploy website
bash bin/update_github.sh