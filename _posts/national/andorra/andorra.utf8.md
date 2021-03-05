---
title: "Estimates for Andorra"
description: |
 Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting in Andorra. These results are impacted by changes in testing effort, increases and decreases in testing effort will increase and decrease reproduction number estimates respectively.
bibliography: library.bib
output:
 distill::distill_article:
   self_contained: true
   toc: true
   toc_depth: 2
categories:
 - 'Europe'
---


*Using data available up to the:* 2021-03-05

*Note that it takes time for infection to cause symptoms, to get tested for SARS-CoV-2 infection, for a positive test to return and ultimately to enter the case data presented here. In other words, today’s case data are only informative of new infections about two weeks ago. This is reflected in the plots below, which are by date of infection.*

*Estimates are available to download [here](https://dataverse.harvard.edu/dataverse/covid-rt).*

*See our see [Methods](https://epiforecasts.io/covid/methods) or our [paper](https://wellcomeopenresearch.org/articles/5-112/) for an explanation of how these estimates are derived.*











<div class="layout-chunk" data-layout="l-body">


</div>












<div class="layout-chunk" data-layout="l-body">


</div>


### Summary (estimates as of the 2021-03-03)


*Table 1: Latest estimates (as of the 2021-03-03) of the number of confirmed cases by date of infection, the expected change in daily confirmed cases, the effective reproduction number, the growth rate, and the doubling time (when negative this corresponds to the halving time). The median and 90% credible interval is shown for each numeric estimate.*
<br>
<div class="layout-chunk" data-layout="l-body">
<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> Estimate </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> New confirmed cases by infection date </td>
   <td style="text-align:left;"> 17 (7 -- 42) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Expected change in daily cases </td>
   <td style="text-align:left;"> Likely decreasing </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Effective reproduction no. </td>
   <td style="text-align:left;"> 0.92 (0.67 -- 1.3) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rate of growth </td>
   <td style="text-align:left;"> -0.021 (-0.097 -- 0.073) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Doubling/halving time (days) </td>
   <td style="text-align:left;"> -32 (9.4 -- -7.1) </td>
  </tr>
</tbody>
</table>

</div>



### Confirmed cases, their estimated date of report, date of infection, and time-varying reproduction number estimates

<div class="layout-chunk" data-layout="l-body">
<img src="/Users/seb/code/covid/covid-rt-estimates/national/cases/national/Andorra/latest/summary_plot.png" width="90%" />

</div>


<br>
*Figure 1: A.) Confirmed cases by date of report (bars) and their estimated date of report. B.) Confirmed cases by date of report (bars) and their estimated date of infection. C.) Time-varying estimate of the effective reproduction number (lightest ribbon = 90% credible interval; darker ribbon = the 50% credible interval, darkest ribbon = 20% credible interval). Estimates from existing data are shown up to the 2021-03-03 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation. Uncertainty has been curtailed to a maximum of ten times the maximum number of reported cases for plotting purposes.*



```{.r .distill-force-highlighting-css}
```

```{.r .distill-force-highlighting-css}
```
