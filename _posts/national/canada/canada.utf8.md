---
title: "National and Subnational estimates for Canada"
description: |
  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting both nationally and subnationally in Canada. These results are impacted by changes in testing effort, increases and decreases in testing effort will increase and decrease reproduction number estimates respectively (see Methods or our [paper](https://wellcomeopenresearch.org/articles/5-112/) for further explanation).
bibliography: library.bib
output:
  distill::distill_article:
    self_contained: true
    toc: true
    toc_depth: 2
categories:
  - "Subnational estimates"
  - "Americas"
---




<div class="layout-chunk" data-layout="l-body">


</div>



*Using data available up to the:* 2020-08-03

*Subnational estimates are available to download [here](https://github.com/epiforecasts/covid-rt-estimates/tree/master/subnational/canada/cases/summary) and national estimates are available to download [here](https://github.com/epiforecasts/covid-rt-estimates/tree/master/national/cases/summary).*

## Expected daily confirmed cases by region


<div class="layout-chunk" data-layout="l-body-outset">
<img src="canada_files/figure-html5/map-1.png" width="70%" />

</div>


<br>
*Figure 1: The results of the latest reproduction number estimates (based on estimated confirmed cases with a date of infection on the 2020-08-03) in Canada, stratified by region, can be summarised by whether confirmed cases are likely increasing or decreasing. This represents the strength of the evidence that the reproduction number in each region is greater than or less than 1, respectively (see the [methods](https://epiforecasts.io/covid/methods.html) for details).*

## National summary








<div class="layout-chunk" data-layout="l-body">


</div>


### Summary (estimates as of the 2020-08-03)


*Table 1: Latest estimates (as of the 2020-08-03) of the number of confirmed cases by date of infection, the expected change in daily confirmed cases, the effective reproduction number, the growth rate, and the doubling time (when negative this corresponds to the halving time). The median and 90% credible interval is shown for each numeric estimate.*
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
   <td style="text-align:left;"> 51147520630605120 (17 -- 102823591695955680) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Expected change in daily cases </td>
   <td style="text-align:left;"> Likely increasing </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Effective reproduction no. </td>
   <td style="text-align:left;"> 3.45 (0.91 -- 4.76) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rate of growth </td>
   <td style="text-align:left;"> 0.36 (-0.02 -- 0.43) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Doubling/halving time (days) </td>
   <td style="text-align:left;"> 1.9 (1.6 -- -28) </td>
  </tr>
</tbody>
</table>

</div>



### Confirmed cases, their estimated date of report, date of infection, and time-varying reproduction number estimates

<div class="layout-chunk" data-layout="l-body">
<img src="/home/epinow2/covid/covid-rt-estimates/national/cases/national/Canada/latest/summary_plot.png" width="90%" />

</div>


<br>
*Figure 2: A.) Confirmed cases by date of report (bars) and their estimated date of report. B.) Confirmed cases by date of report (bars) and their estimated date of infection. C.) Time-varying estimate of the effective reproduction number. Light ribbon = 90% credible interval; dark ribbon = the 50% credible interval. Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*




## Regional Breakdown

### Data availability

* Case counts by date, stratified by region, were downloaded from a public curated dataset [@covidregionaldata].
* Case onset dates were estimated using confirmed case counts by date of report and a distribution of reporting delays fitted to an international line-list [@kraemer2020epidemiological; @covidregionaldata].

### Limitations

* Line-list data to inform a Canadian specific estimate of the reporting delay was not available. This means that we could also not account for any regional differences.

<div class="layout-chunk" data-layout="l-body">


</div>






### Summary of latest reproduction number and confirmed case count estimates by date of infection

<div class="layout-chunk" data-layout="l-body">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/summary_plot.png" width="95%" />

</div>


<br>
*Figure 3: Confirmed cases with date of infection on the 2020-08-03 and the time-varying estimate of the effective reproduction number (light bar = 90% credible interval; dark bar = the 50% credible interval.). Regions are ordered by the number of expected daily confirmed cases and shaded based on the expected change in daily confirmedcases. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control and a single case required for elimination.*

### Reproduction numbers over time in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/high_rt_plot.png" width="95%" />

</div>


<br>
*Figure 4: Time-varying estimate of the effective reproduction number (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases. Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of infection in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/high_infections_plot.png" width="95%" />

</div>


<br>
*Figure 5: Confirmed cases by date of report (bars) and their estimated date of infection (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases.  Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only.  Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of report in the six regions expected to have the most new confirmed cases

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/high_reported_cases_plot.png" width="95%" />

</div>


<br>
*Figure 6: Confirmed cases by date of report (bars) and their estimated date of report (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in the regions expected to have the highest number of new confirmed cases.  Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only.  Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*


<div class="layout-chunk" data-layout="l-body">


</div>





### Reproduction numbers over time in all regions

<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/rt_plot.png" width="95%" />

</div>


<br>
*Figure 7: Time-varying estimate of the effective reproduction number (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The horizontal dotted line indicates the target value of 1 for the effective reproduction no. required for control. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of infection in all regions


<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/infections_plot.png" width="90%" />

</div>


*Figure 8: Confirmed cases by date of report (bars) and their estimated date of infection (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*

### Confirmed cases and their estimated date of report in all regions


<div class="layout-chunk" data-layout="l-body-outset">
<img src="/home/epinow2/covid/covid-rt-estimates/subnational/canada/cases/summary/reported_cases_plot.png" width="90%" />

</div>


*Figure 9: Confirmed cases by date of report (bars) and their estimated date of report (light ribbon = 90% credible interval; dark ribbon = the 50% credible interval) in all regions. Estimates from existing data are shown up to the 2020-08-03 from when forecasts are shown. These should be considered indicative only. Estimates based on partial data have been adjusted for right truncation of infections. The vertical dashed line indicates the date of report generation.*





### Latest estimates (as of the 2020-08-03)


*Table 2: Latest estimates (as of the 2020-08-03) of the number of confirmed cases by date of infection, the effective reproduction number, the rate of growth, and the doubling time (when negative this corresponds to the halving time) in each region. The median and 90% credible interval is shown.*
<br>
<div class="layout-chunk" data-layout="l-body-outset">
preserve928010a9ecd5bed1

</div>


<div class="layout-chunk" data-layout="l-body">


</div>




