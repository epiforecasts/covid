#!bin/bash

declare -a countries=("spain"
                      "france"
                      "italy"
                      "austria"
                      "norway"
                      "sweden"
                      "united-kingdom"
                      "switzerland"
                      "belgium"
                      "netherlands"
                      "iran"
                      "czechia"
                      "portugal"
                      "qatar"
                      "greece"
                      "slovenia"
                      "finland"
                      "israel"
                      "ireland"
                      "bahrain"
                      "brazil"
                      "estonia"
                      "iceland"
                      "philippines"
                      "pakistan"
                      "estonia"
                      "poland"
                      "romania")

for country in ${countries[@]}; do
  cp man/region-specific-methods/template/europe.md man/region-specific-methods/$country.md
done

