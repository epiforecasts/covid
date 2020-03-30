---
title: "National and Subnational estimates for the United States of America"
description: |
  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting both nationally and subnationally in the United States of America.
bibliography: library.bib
output:
  distill::distill_article:
    self_contained: true
    toc: true
    toc_depth: 2
---









## Expected daily cases by region

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body-outset">
<img src="united-states_files/figure-html5/map-1.png" width="3840" />

</div>


<br>
*Figure 1: The results of the latest reproduction number estimates (based on estimated cases with a date of infection on the 2020-03-20) in the United States of America, stratified by state, can be summarised by whether cases are likely increasing or decreasing. This represents the strength of the evidence that the reproduction number in each region is greater than or less than 1, respectively.*

## National summary

<div class="layout-chunk" data-layout="l-body">


</div>









<div class="layout-chunk" data-layout="l-body">


</div>


### Summary (estimates as of the 2020-03-20)

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
   <td style="text-align:left;"> New infections </td>
   <td style="text-align:left;"> 21148 (14653 -- 39569) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Expected change in daily cases </td>
   <td style="text-align:left;"> Increasing </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Effective reproduction no. </td>
   <td style="text-align:left;"> 1.5 (1 -- 2.1) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Doubling time (days) </td>
   <td style="text-align:left;"> 8.5 (4.7 -- 22) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Adjusted R-squared </td>
   <td style="text-align:left;"> 0.78 (0.31 -- 0.95) </td>
  </tr>
</tbody>
</table>

</div>


<br>
*Table 1: Latest estimates (as of the 2020-03-20) of the number of cases by date of infection, the expected change in daily cases, the effective reproduction number, the doubling time, and the adjusted R-squared of the exponential fit. The mean and 90% credible interval is shown for each numeric estimate.*

### Reported and estimated cases by date of onset and time-varying reproduction number estimates

<div class="layout-chunk" data-layout="l-body">
<img src="/home/seabbs/covid/_posts/global/nowcast/national/United States of America/latest/rt_cases_plot.png" width="90%" />

</div>


<br>
*Figure 2: A.) Cases by date of report (bars) and estimated cases by date of infection. B.) Time-varying estimate of the effective reproduction number. Light grey ribbon = 90% credible interval. Estimates are shown until the 2020-03-20.Dark grey ribbon = 50% credible interval. Confidence in the estimated values is indicated by shading with reduced shading corresponding to reduced confidence.*

### Time-varying rate of spread and doubling time

<div class="layout-chunk" data-layout="l-body">
<img src="/home/seabbs/covid/_posts/global/nowcast/national/United States of America/latest/rate_spread_plot.png" width="90%" />

</div>


<br>
*Figure 3: A.) Time-varying estimate of the rate of spread, B.) Time-varying estimate of the doubling time in days (note that when the rate of spread is negative the doubling time is assumed to be infinite), C.) The adjusted R-squared estimates indicating the goodness of fit of the exponential regression model (with values closer to 1 indicating a better fit).  Estimates are shown until the 2020-03-20. Light grey ribbon = 90% credible interval; dark grey ribbon = the 50% credible interval. Confidence in the estimated values is indicated by shading with reduced shading corresponding to reduced confidence.*



## Regional Breakdown

### Data availability

* Case counts by date, stratified by region, were downloaded from a publically available source  curated by Johns Hopkins University [@jhu_2019_2020; @NCoVUtils].
* Case onset dates were estimated using case counts by date of report and a distribution of reporting delays fitted to a publically available line-list of international cases [@kraemer2020epidemiological; @NCoVUtils].

### Limitations

* Line-list data to inform a State specific estimates of the reporting delay were not available. 


<div class="layout-chunk" data-layout="l-body">


</div>






### Summary of latest reproduction number and case count estimates

<div class="layout-chunk" data-layout="l-body">
<img src="/home/seabbs/covid/_posts/regional-breakdowns/united-states/nowcast/regional-summary/summary_plot.png" width="90%" />

</div>


<br>
*Figure 4: Cases with date of infection on the 2020-03-20 and the time-varying estimate of the effective reproduction number (bar = 90% credible interval). Regions are ordered by the number of expected daily cases and shaded based on the expected change in daily cases. The dotted line indicates the target value of 1 for the effective reproduction no. required for control and a single case required for elimination.*

### Reproduction numbers over time in the six regions with the most cases currently

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/seabbs/covid/_posts/regional-breakdowns/united-states/nowcast/regional-summary/high_cases_rt_plot.png" width="90%" />

</div>


<br>
*Figure 5: Time-varying estimate of the effective reproduction number (light grey ribbon = 90% credible interval; dark grey ribbon = 50% credible interval) in the regions expected to have the highest number of incident cases. Estimates are shown up to the 2020-03-20. Confidence in the estimated values is indicated by shading with reduced shading corresponding to reduced confidence. The dotted line indicates the target value of 1 for the effective reproduction no. required for control.*

### Cases with date of onset on the day of report generation in the six regions with the most cases currently

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/seabbs/covid/_posts/regional-breakdowns/united-states/nowcast/regional-summary/high_cases_plot.png" width="90%" />

</div>


<br>
*Figure 6:  Cases by date of report (bars) and estimated cases by date of infection (light grey ribbon = 90% credible interval; dark grey ribbon = 50% credible interval) in the regions expected to have the highest number of incident cases.  Estimates are shown up to the 2020-03-20.Confidence in the estimated values is indicated by shading with reduced shading corresponding to reduced confidence.*

### Reproduction numbers over time in all regions

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/seabbs/covid/_posts/regional-breakdowns/united-states/nowcast/regional-summary/rt_plot.png" width="90%" />

</div>


<br>
*Figure 7: Time-varying estimate of the effective reproduction number (light grey ribbon = 90% credible interval; dark grey ribbon = 50% credible interval) in all regions. Estimates are shown up to the 2020-03-20. Confidence in the estimated values is indicated by shading with reduced shading corresponding to reduced confidence. The dotted line indicates the target value of 1 for the effective reproduction no. required for control.*


### Cases with date of onset on the day of report generation in all regions

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/seabbs/covid/_posts/regional-breakdowns/united-states/nowcast/regional-summary/cases_plot.png" width="90%" />

</div>


*Figure 8:  Cases by date of report (bars) and estimated cases by date of infection (light grey ribbon = 90% credible interval; dark grey ribbon = 50% credible interval) in all regions. Estimates are shown up to the 2020-03-20. Confidence in the estimated values is indicated by shading with reduced shading corresponding to reduced confidence.*

### Latest estimates (as of the 2020-03-20)

<div class="layout-chunk" data-layout="l-body-outset">
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> State </th>
   <th style="text-align:left;"> New infections </th>
   <th style="text-align:left;"> Expected change in daily cases </th>
   <th style="text-align:left;"> Effective reproduction no. </th>
   <th style="text-align:left;"> Doubling time (days) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:left;"> 860 (216 -- 1570) </td>
   <td style="text-align:left;"> Unsure </td>
   <td style="text-align:left;"> 1.8 (0.7 -- 2.9) </td>
   <td style="text-align:left;"> 7.3 (2.6 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Alaska </td>
   <td style="text-align:left;"> 149 (50 -- 408) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.8 (0.9 -- 3.2) </td>
   <td style="text-align:left;"> 6 (2.7 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arizona </td>
   <td style="text-align:left;"> 896 (515 -- 1673) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.8 (1.4 -- 2.2) </td>
   <td style="text-align:left;"> 5.1 (3.4 -- 9.4) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arkansas </td>
   <td style="text-align:left;"> 905 (483 -- 2376) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.2 (1.1 -- 3.9) </td>
   <td style="text-align:left;"> 4 (2.4 -- 110) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> California </td>
   <td style="text-align:left;"> 5103 (4076 -- 6851) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.4 (1.3 -- 1.7) </td>
   <td style="text-align:left;"> 8 (4.9 -- 62) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colorado </td>
   <td style="text-align:left;"> 2879 (1175 -- 4311) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.2 -- 3.1) </td>
   <td style="text-align:left;"> 4.9 (2.9 -- 14) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Connecticut </td>
   <td style="text-align:left;"> 1957 (578 -- 3989) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.9 (0.8 -- 3.1) </td>
   <td style="text-align:left;"> 5.4 (2.6 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Delaware </td>
   <td style="text-align:left;"> 291 (180 -- 433) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.9 (1.4 -- 2.3) </td>
   <td style="text-align:left;"> 4.8 (3.2 -- 11) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> District of Columbia </td>
   <td style="text-align:left;"> 414 (186 -- 849) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.7 (0.9 -- 2.6) </td>
   <td style="text-align:left;"> 6.3 (3.2 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Florida </td>
   <td style="text-align:left;"> 4690 (2422 -- 6059) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.8 (1.2 -- 2.4) </td>
   <td style="text-align:left;"> 5.6 (3.6 -- 21) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Georgia </td>
   <td style="text-align:left;"> 3062 (1813 -- 4774) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.2 -- 2.7) </td>
   <td style="text-align:left;"> 6.3 (3.1 -- 28) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Guam </td>
   <td style="text-align:left;"> 97 (45 -- 186) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.3 -- 2.8) </td>
   <td style="text-align:left;"> 4.9 (3 -- 16) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hawaii </td>
   <td style="text-align:left;"> 173 (86 -- 285) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.6 (0.9 -- 2.1) </td>
   <td style="text-align:left;"> 6.1 (3.5 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Idaho </td>
   <td style="text-align:left;"> 343 (147 -- 746) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.2 (1 -- 5) </td>
   <td style="text-align:left;"> 5.1 (2.2 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Illinois </td>
   <td style="text-align:left;"> 3471 (2434 -- 4727) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.2 -- 2.1) </td>
   <td style="text-align:left;"> 6.8 (4.2 -- 31) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Indiana </td>
   <td style="text-align:left;"> 1617 (1046 -- 2418) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.2 (1.4 -- 2.8) </td>
   <td style="text-align:left;"> 4.1 (2.6 -- 8.6) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Iowa </td>
   <td style="text-align:left;"> 362 (209 -- 633) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.1 (1.2 -- 3.4) </td>
   <td style="text-align:left;"> 4.5 (2.3 -- 10) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kansas </td>
   <td style="text-align:left;"> 368 (118 -- 1279) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.2 -- 3.4) </td>
   <td style="text-align:left;"> 5.1 (2.4 -- 28) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kentucky </td>
   <td style="text-align:left;"> 482 (209 -- 803) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.2 -- 2.9) </td>
   <td style="text-align:left;"> 5.8 (2.7 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Louisiana </td>
   <td style="text-align:left;"> 3652 (1329 -- 5084) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.6 (0.8 -- 2) </td>
   <td style="text-align:left;"> 8.2 (3.8 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maine </td>
   <td style="text-align:left;"> 312 (163 -- 574) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.3 -- 3) </td>
   <td style="text-align:left;"> 4.8 (2.9 -- 15) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maryland </td>
   <td style="text-align:left;"> 1272 (528 -- 2116) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.8 (0.5 -- 2.7) </td>
   <td style="text-align:left;"> 5.6 (2.6 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Massachusetts </td>
   <td style="text-align:left;"> 3886 (3212 -- 4661) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.9 (1.6 -- 2.3) </td>
   <td style="text-align:left;"> 5.3 (4 -- 8.8) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Michigan </td>
   <td style="text-align:left;"> 5426 (3556 -- 10171) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.9 (1.2 -- 2.8) </td>
   <td style="text-align:left;"> 4.6 (3 -- 13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Minnesota </td>
   <td style="text-align:left;"> 635 (344 -- 1856) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.1 -- 4) </td>
   <td style="text-align:left;"> 6 (2.5 -- 67) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mississippi </td>
   <td style="text-align:left;"> 1052 (606 -- 1934) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.5 -- 2.8) </td>
   <td style="text-align:left;"> 4.5 (2.8 -- 8.6) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Missouri </td>
   <td style="text-align:left;"> 1058 (278 -- 1502) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 2 (0.6 -- 2.6) </td>
   <td style="text-align:left;"> 4.9 (2.6 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Montana </td>
   <td style="text-align:left;"> 162 (51 -- 378) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.8 (1 -- 2.9) </td>
   <td style="text-align:left;"> 5.7 (2.1 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nebraska </td>
   <td style="text-align:left;"> 136 (61 -- 205) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.4 (1 -- 1.7) </td>
   <td style="text-align:left;"> 13 (5.1 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nevada </td>
   <td style="text-align:left;"> 796 (503 -- 1482) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.1 -- 2.7) </td>
   <td style="text-align:left;"> 6.3 (3.3 -- 23) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New Hampshire </td>
   <td style="text-align:left;"> 234 (122 -- 338) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.6 (1 -- 2.3) </td>
   <td style="text-align:left;"> 6.5 (3.1 -- 32) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New Jersey </td>
   <td style="text-align:left;"> 14060 (8768 -- 20043) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.1 (1.4 -- 3.6) </td>
   <td style="text-align:left;"> 4.4 (2.4 -- 8.3) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New Mexico </td>
   <td style="text-align:left;"> 287 (211 -- 575) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.1 (1.4 -- 3.8) </td>
   <td style="text-align:left;"> 5.1 (2.9 -- 24) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New York </td>
   <td style="text-align:left;"> 66926 (44466 -- 101688) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.8 (1.5 -- 2.2) </td>
   <td style="text-align:left;"> 5.1 (3.7 -- 7.6) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> North Carolina </td>
   <td style="text-align:left;"> 1230 (724 -- 2635) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.8 (0.8 -- 2.7) </td>
   <td style="text-align:left;"> 5.8 (2.8 -- 35) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> North Dakota </td>
   <td style="text-align:left;"> 103 (53 -- 193) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.9 (1.1 -- 2.7) </td>
   <td style="text-align:left;"> 5.6 (3.1 -- 38) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ohio </td>
   <td style="text-align:left;"> 1441 (524 -- 3671) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.6 (1.1 -- 2.6) </td>
   <td style="text-align:left;"> 6.4 (3.2 -- 76) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oklahoma </td>
   <td style="text-align:left;"> 548 (403 -- 1224) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.2 (1.5 -- 2.8) </td>
   <td style="text-align:left;"> 3.9 (2.4 -- 7.7) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oregon </td>
   <td style="text-align:left;"> 626 (401 -- 936) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.8 (1.2 -- 2.5) </td>
   <td style="text-align:left;"> 5.5 (3.4 -- 12) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pennsylvania </td>
   <td style="text-align:left;"> 2908 (1653 -- 4591) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.9 (1.2 -- 2.6) </td>
   <td style="text-align:left;"> 5.3 (3.2 -- 16) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Puerto Rico </td>
   <td style="text-align:left;"> 196 (50 -- 377) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.5 (1 -- 3.8) </td>
   <td style="text-align:left;"> 3.8 (2.1 -- 16) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rhode Island </td>
   <td style="text-align:left;"> 285 (131 -- 533) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.8 (1.2 -- 2.8) </td>
   <td style="text-align:left;"> 5.8 (3.6 -- 24) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> South Carolina </td>
   <td style="text-align:left;"> 1082 (661 -- 2647) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.5 -- 3.1) </td>
   <td style="text-align:left;"> 4.7 (2.9 -- 13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> South Dakota </td>
   <td style="text-align:left;"> 88 (34 -- 193) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.7 (0.9 -- 2.5) </td>
   <td style="text-align:left;"> 5.9 (2.9 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tennessee </td>
   <td style="text-align:left;"> 1792 (897 -- 3969) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2 (1.1 -- 4.1) </td>
   <td style="text-align:left;"> 5.3 (2.7 -- 72) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Texas </td>
   <td style="text-align:left;"> 2262 (1514 -- 3383) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.3 -- 2.1) </td>
   <td style="text-align:left;"> 6 (3.8 -- 13) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Utah </td>
   <td style="text-align:left;"> 677 (239 -- 1146) </td>
   <td style="text-align:left;"> Likely increasing </td>
   <td style="text-align:left;"> 1.7 (0.8 -- 2.6) </td>
   <td style="text-align:left;"> 7.1 (3.2 -- Cases decreasing) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vermont </td>
   <td style="text-align:left;"> 239 (163 -- 313) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.9 (1.2 -- 2.3) </td>
   <td style="text-align:left;"> 5.6 (3.2 -- 17) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Virginia </td>
   <td style="text-align:left;"> 789 (435 -- 1185) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.2 -- 2.3) </td>
   <td style="text-align:left;"> 6.5 (3.4 -- 38) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Washington </td>
   <td style="text-align:left;"> 4476 (3340 -- 6731) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.4 (1.2 -- 1.8) </td>
   <td style="text-align:left;"> 9.1 (5.2 -- 26) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> West Virginia </td>
   <td style="text-align:left;"> 124 (39 -- 204) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 2.1 (1 -- 2.9) </td>
   <td style="text-align:left;"> 4.5 (2.3 -- 140) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wisconsin </td>
   <td style="text-align:left;"> 1262 (914 -- 1772) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.6 (1.2 -- 1.9) </td>
   <td style="text-align:left;"> 5.7 (3.8 -- 11) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wyoming </td>
   <td style="text-align:left;"> 100 (49 -- 163) </td>
   <td style="text-align:left;"> Increasing </td>
   <td style="text-align:left;"> 1.7 (1.1 -- 2.2) </td>
   <td style="text-align:left;"> 5.6 (3.1 -- Cases decreasing) </td>
  </tr>
</tbody>
</table>

</div>


<br>
*Table 2: Latest estimates (as of the 2020-03-20) of the number of cases by date of infection, the effective reproduction number, and the doubling time in each region. The mean and 90% credible interval is shown.*


<div class="layout-chunk" data-layout="l-body">


</div>





