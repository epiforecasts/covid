#!bin/bash

## Update the submodule gits
bash bin/update_submodules.sh

## Update the git repo with new results
git add --all && git commit -m "Updated website" && git push

