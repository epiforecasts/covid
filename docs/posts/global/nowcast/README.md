
# National (and subnational) estimates

*Warning: This analysis is a work in progress. Breaking changes may occur and the authors cannot guarantee support.*


## Usage


### Update all regional nowcasts and report

All regional nowcasts and the report can be updated by running the following from the package root directory:

```bash
Rscript update_nowcasts.R
```

### Update individual nowcasts

Individual nowcasts can be updated (and their assumptions inspected) in the `nowcasts` folder. Nowcasts are labelled as `region_nowcast.R`. Results from each nowcast are stored in `results/region/nowcast_date`. It is assumed that the user is in the project root for all analysis.

### Inspect results

Use `vignettes/global-report.Rmd` to inspect the results of the analysis interactively. See `vignettes/global-report.md` for a markdown version of the analysis containing all results. See `vignettes/rendered_output` for version of the analysis rendered in other formats.

