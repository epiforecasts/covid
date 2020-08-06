---
title: "National and Subnational estimates for the United Kingdom"
description: |
  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting both nationally and subnationally in the United Kingdom. These results are impacted by changes in testing effort, increases and decreases in testing effort will increase and decrease reproduction number estimates respectively (see Methods or our [paper](https://wellcomeopenresearch.org/articles/5-112/) for further explanation).
bibliography: library.bib
output:
  distill::distill_article:
    self_contained: true
    toc: true
    toc_depth: 2
categories:
  - "Subnational estimates"
  - "Europe"
---




<div class="layout-chunk" data-layout="l-body">


</div>


*Using data available up to the:* 2020-08-13

*Note that it takes time for infection to cause symptoms, to get tested for SARS-CoV-2 infection, for a positive test to return and ultimately to enter the case data presented here. In other words, today’s case data are only informative of new infections about two weeks ago. This is reflected in the plots below, which are by date of infection.*

## Expected daily confirmed cases by region

<div class="layout-chunk" data-layout="l-body-outset">
<img src="united-kingdom_files/figure-html5/map-1.png" width="70%" />

</div>


<br>
*Figure 1: The results of the latest reproduction number estimates (based on estimated confirmed cases with a date of infection on the 2020-08-13) in the United Kingdom, stratified by region, can be summarised by whether confirmed cases are likely increasing or decreasing. This represents the strength of the evidence that the reproduction number in each region is greater than or less than 1, respectively (see the [methods](https://epiforecasts.io/covid/methods.html) for details).*


## National summary









<div class="layout-chunk" data-layout="l-body">


</div>


### Summary (estimates as of the 2020-08-13)


*Table 1: Latest estimates (as of the 2020-08-13) of the number of confirmed cases by date of infection, the expected change in daily confirmed cases, the effective reproduction number, the growth rate, and the doubling time (when negative this corresponds to the halving time). The median and 90% credible interval is shown for each numeric estimate.*
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
   <td style="text-align:left;"> 1005 (149 -- 2476) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Expected change in daily cases </td>
   <td style="text-align:left;"> Unsure </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Effective reproduction no. </td>
   <td style="text-align:left;"> 1.1 (0.6 -- 1.7) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rate of growth </td>
   <td style="text-align:left;"> 0.02 (-0.12 -- 0.19) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Doubling/halving time (days) </td>
   <td style="text-align:left;"> 39 (3.6 -- -6) </td>
  </tr>
</tbody>
</table>

</div>



### Confirmed cases, their estimated date of report, date of infection, and time-varying reproduction number estimates

<div class="layout-chunk" data-layout="l-body">
<img src="/home/epinow2/covid/covid-rt-estimates/national/cases/national/United Kingdom/latest/summary_plot.png" width="90%" />

</div>


<br>
*Figure 2: A.) Confirmed cases by date of report (bars) and their estimated date of report. B.) Confirmed cases by date of report (bars) and their estimated date of infection. C.) Time-varying estimate of the effective reproduction number. Light ribbon = 90% credible interval; dark ribbon = the 50% credible interval. Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*




## Regional Breakdown

### Data availability

* Case counts by date, stratified by region, were downloaded from a public curated dataset [@noauthor_coronavirus_2020; @white_coronavirus_2020; @covidregionaldata].
* Case onset dates were estimated using confirmed case counts by date of report and a distribution of reporting delays fitted to an international line-list [@kraemer2020epidemiological; @covidregionaldata].

### Limitations

* Line-list data to inform a United Kingdom specific estimate of the reporting delay was not available. This means that we could also not account for any regional differences.

<div class="layout-chunk" data-layout="l-body">


</div>






### Summary of latest reproduction number and confirmed case count estimates by date of infection

<div class="layout-chunk" data-layout="l-body">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/summary_plot.png" width="95%" />

</div>


<br>
*Figure 3: Confirmed cases with date of infection on the 2020-08-13 and the time-varying estimate of the effective reproduction number (light bar = 90% credible interval; dark bar = the 50% credible interval.). Regions are ordered by the number of expected daily confirmed cases and shaded based on the expected change in daily confirmedcases. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control and a single case required for elimination.*

### Reproduction numbers over time in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/high_rt_plot.png" width="95%" />

</div>


<br>
*Figure 4: Time-varying estimate of the effective reproduction number (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases. Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of infection in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/high_infections_plot.png" width="95%" />

</div>


<br>
*Figure 5: Confirmed cases by date of report (bars) and their estimated date of infection (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases.  Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only.  Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of report in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/high_reported_cases_plot.png" width="95%" />

</div>


<br>
*Figure 6: Confirmed cases by date of report (bars) and their estimated date of report (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases.  Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only.  Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*


<div class="layout-chunk" data-layout="l-body">


</div>





### Reproduction numbers over time in all regions

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/rt_plot.png" width="95%" />

</div>


<br>
*Figure 7: Time-varying estimate of the effective reproduction number (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of infection in all regions


<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/infections_plot.png" width="90%" />

</div>


*Figure 8: Confirmed cases by date of report (bars) and their estimated date of infection (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of report in all regions


<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/united-kingdom/cases/summary/reported_cases_plot.png" width="90%" />

</div>


*Figure 9: Confirmed cases by date of report (bars) and their estimated date of report (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-08-13 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*





### Latest estimates (as of the 2020-08-13)


*Table 2: Latest estimates (as of the 2020-08-13) of the number of confirmed cases by date of infection, the effective reproduction number, the rate of growth, and the doubling time (when negative this corresponds to the halving time) in each region. The median and 90% credible interval is shown.*
<br>
<div class="layout-chunk" data-layout="l-body-outset">
<!--html_preserve--><div id="htmlwidget-ebf13d845f7334827601" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-ebf13d845f7334827601">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12"],["East Midlands","East of England","London","North East","North West","Northern Ireland","Scotland","South East","South West","Wales","West Midlands","Yorkshire and The Humber"],["125 (29 -- 314)","52 (4 -- 142)","136 (57 -- 230)","14 (1 -- 45)","366 (73 -- 758)","0 (0 -- 1)","46 (0 -- 192)","78 (12 -- 148)","85 (25 -- 177)","8 (0 -- 33)","89 (10 -- 216)","273 (49 -- 629)"],["Unsure","Unsure","Likely increasing","Unsure","Unsure","Likely decreasing","Unsure","Unsure","Likely increasing","Likely decreasing","Unsure","Unsure"],["1.1 (0.6 -- 1.8)","0.9 (0.4 -- 1.6)","1.1 (0.8 -- 1.3)","1 (0.4 -- 1.8)","1.1 (0.6 -- 1.6)","0.5 (0 -- 1)","1 (0.3 -- 1.8)","1 (0.6 -- 1.3)","1.2 (0.9 -- 1.7)","0.5 (0.1 -- 1)","0.9 (0.4 -- 1.5)","1.2 (0.7 -- 1.9)"],["0.03 (-0.12 -- 0.19)","-0.02 (-0.19 -- 0.16)","0.02 (-0.05 -- 0.09)","0.01 (-0.16 -- 0.22)","0.03 (-0.12 -- 0.16)","-0.15 (-0.38 -- 0)","0.01 (-0.22 -- 0.22)","-0.01 (-0.12 -- 0.1)","0.06 (-0.03 -- 0.18)","-0.15 (-0.32 -- 0.03)","-0.02 (-0.18 -- 0.13)","0.06 (-0.1 -- 0.23)"],["21.4 (3.7 -- -5.8)","-33.9 (4.3 -- -3.7)","32.3 (7.5 -- -14.2)","95.9 (3.1 -- -4.2)","27.1 (4.3 -- -6)","-4.6 (286.2 -- -1.8)","72.3 (3.2 -- -3.2)","-113.8 (7.1 -- -5.7)","11.2 (3.8 -- -22.5)","-4.6 (26.7 -- -2.2)","-39 (5.2 -- -4)","11.8 (3 -- -7)"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Region<\/th>\n      <th>New confirmed cases by infection date<\/th>\n      <th>Expected change in daily cases<\/th>\n      <th>Effective reproduction no.<\/th>\n      <th>Rate of growth<\/th>\n      <th>Doubling/halving time (days)<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"order":[],"autoWidth":false,"orderClasses":false,"columnDefs":[{"orderable":false,"targets":0}]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

</div>


<div class="layout-chunk" data-layout="l-body">


</div>




