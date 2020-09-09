#!bin/bash

## Check everything up to date
git pull

## Update the website
bash bin/update_website.sh

## Update github and deploy website
bash bin/update_github.sh