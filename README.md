
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rmatch

<!-- badges: start -->
<!-- badges: end -->

Rmatch is a package that aims to assist you in any matching task that
involves two datasets and (approximate) string matching

## Installation

You can install the development version of Rmatch like so:

``` r
# devtools::install_github("https://github.com/MatthiasUckert/Rmatch")
```

## Example (Step-by-Step)

Basic usage using build-in datasets. Check out the vignette for full
specification

``` r
library(Rmatch); library(kableExtra); library(tidyverse)
#> -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.6     v dplyr   1.0.7
#> v tidyr   1.1.4     v stringr 1.4.0
#> v readr   2.1.1     v forcats 0.5.1
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter()     masks stats::filter()
#> x dplyr::group_rows() masks kableExtra::group_rows()
#> x dplyr::lag()        masks stats::lag()
```

Match Data: You need 2 datasets, a source table (data you want to match)
and a target table (data you want to match against).

``` r
tab_source <- table_source
tab_target <- table_target
```

First, make sure your datasets are correcly formatted.

``` r
check_data(tab_source, tab_target)
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 14px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Check
</th>
<th style="text-align:center;">
Source
</th>
<th style="text-align:center;">
Target
</th>
<th style="text-align:center;">
Matrix
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Column: ‘id’ exists
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Column: ‘id’ is unique
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘id’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘name’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘iso3’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘city’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">1</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">11</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘address’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">3</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">27</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘name’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">0
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">0
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘iso3’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">2,406
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">4,657
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘city’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">1,520
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">3,282
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘address’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">73
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">688
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Elements in Dataframe/Matrix
</td>
<td style="text-align:center;">
2,426
</td>
<td style="text-align:center;">
4,671
</td>
<td style="text-align:center;">
11,331,846
</td>
</tr>
<tr>
<td style="text-align:left;">
Estimated memory allocation
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
1,813 MB
</td>
</tr>
</tbody>
</table>

Standardizing columns won’t harm

``` r
cols_match <- c("name", "iso3", "city", "address")
tab_source <- standardize_data(tab_source, cols_match)
tab_target <- standardize_data(tab_target, cols_match)
```

Check again

``` r
check_data(tab_source, tab_target)
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 14px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Check
</th>
<th style="text-align:center;">
Source
</th>
<th style="text-align:center;">
Target
</th>
<th style="text-align:center;">
Matrix
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Column: ‘id’ exists
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Column: ‘id’ is unique
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
<span
style=" font-weight: bold;    color: green !important;">TRUE</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘id’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘name’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘iso3’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">0</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘city’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">1</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">11</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check NAs for column: ‘address’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">3</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">27</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘name’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">0
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">0
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘iso3’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">2,406
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">4,657
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘city’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">1,522
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">3,293
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Check (cumulative) duplicates for column(s): ‘address’
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">85
(0)</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    color: green !important;">723
(0)</span>
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
</tr>
<tr>
<td style="text-align:left;">
Elements in Dataframe/Matrix
</td>
<td style="text-align:center;">
2,426
</td>
<td style="text-align:center;">
4,671
</td>
<td style="text-align:center;">
11,331,846
</td>
</tr>
<tr>
<td style="text-align:left;">
Estimated memory allocation
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
</td>
<td style="text-align:center;">
1,813 MB
</td>
</tr>
</tbody>
</table>

Let’s match the two dataframes

``` r
cols_join <- c("name", "iso3")
cols_exact <- "iso3"
method <- "soundex"
tab_match <- match_data(
  .source = tab_source,
  .target = tab_target,
  .cols_match = cols_match,
  .cols_join = c("name", "iso3"),
  .cols_exact = cols_exact,
  .method = method,
)
#> Calculating Block: 003-028
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 12px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:center;">
id_s
</th>
<th style="text-align:center;">
id_t
</th>
<th style="text-align:center;">
all_s
</th>
<th style="text-align:center;">
all_t
</th>
<th style="text-align:center;">
sim_name
</th>
<th style="text-align:center;">
sim_iso3
</th>
<th style="text-align:center;">
sim_city
</th>
<th style="text-align:center;">
sim_address
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:center;">
52BE07D5
</td>
<td style="text-align:center;">
F671078F
</td>
<td style="text-align:center;">
52BE07D5
</td>
<td style="text-align:center;">
F671078F
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0.9642857
</td>
</tr>
<tr>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
</tr>
<tr>
<td style="text-align:center;">
6E20553A
</td>
<td style="text-align:center;">
E8E307AE
</td>
<td style="text-align:center;">
6E20553A
</td>
<td style="text-align:center;">
E8E307AE
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0.0000000
</td>
</tr>
<tr>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
</tr>
<tr>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
</tr>
<tr>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
</tr>
</tbody>
</table>

Let’s calculate the best matches

``` r
tab_score <- scores_data(
  .matches = tab_match,
  .source = tab_source,
  .target = tab_target,
  .cols_match = cols_match,
  .cols_exact = cols_exact
  )
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 12px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:center;">
id_s
</th>
<th style="text-align:center;">
id_t
</th>
<th style="text-align:center;">
all_s
</th>
<th style="text-align:center;">
all_t
</th>
<th style="text-align:center;">
sim_name
</th>
<th style="text-align:center;">
sim_iso3
</th>
<th style="text-align:center;">
sim_city
</th>
<th style="text-align:center;">
sim_address
</th>
<th style="text-align:center;">
sms
</th>
<th style="text-align:center;">
smw
</th>
<th style="text-align:center;">
smc
</th>
<th style="text-align:center;">
sss
</th>
<th style="text-align:center;">
ssw
</th>
<th style="text-align:center;">
ssc
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:center;">
52BE07D5
</td>
<td style="text-align:center;">
F671078F
</td>
<td style="text-align:center;">
52BE07D5
</td>
<td style="text-align:center;">
F671078F
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0.9642857
</td>
<td style="text-align:center;">
0.9880952
</td>
<td style="text-align:center;">
0.6816429
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0.9766156
</td>
<td style="text-align:center;">
0.6737237
</td>
<td style="text-align:center;">
0
</td>
</tr>
<tr>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.6256599
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.6256599
</td>
<td style="text-align:center;">
0
</td>
</tr>
<tr>
<td style="text-align:center;">
6E20553A
</td>
<td style="text-align:center;">
E8E307AE
</td>
<td style="text-align:center;">
6E20553A
</td>
<td style="text-align:center;">
E8E307AE
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0.0000000
</td>
<td style="text-align:center;">
0.6666667
</td>
<td style="text-align:center;">
0.4563230
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0.6666667
</td>
<td style="text-align:center;">
0.4563230
</td>
<td style="text-align:center;">
0
</td>
</tr>
<tr>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
0.6898555
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
0.6898555
</td>
<td style="text-align:center;">
0
</td>
</tr>
<tr>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.6256599
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.6256599
</td>
<td style="text-align:center;">
0
</td>
</tr>
<tr>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
0.6844846
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
1.0000000
</td>
<td style="text-align:center;">
0.6844846
</td>
<td style="text-align:center;">
0
</td>
</tr>
</tbody>
</table>

Finally Deduplicate Matches, DONE(ish)

``` r
col_score <- "sms"
tab_final1 <- dedup_data(
  .score = tab_score,
  .source = tab_source,
  .target = tab_target,
  .cols_match = cols_match,
  .col_score = col_score
)
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 10px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:center;">
id_s
</th>
<th style="text-align:center;">
id_t
</th>
<th style="text-align:center;">
all_s
</th>
<th style="text-align:center;">
all_t
</th>
<th style="text-align:center;">
score
</th>
<th style="text-align:center;">
name_s
</th>
<th style="text-align:center;">
name_t
</th>
<th style="text-align:center;">
iso3_s
</th>
<th style="text-align:center;">
iso3_t
</th>
<th style="text-align:center;">
city_s
</th>
<th style="text-align:center;">
city_t
</th>
<th style="text-align:center;">
address_s
</th>
<th style="text-align:center;">
address_t
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1000MERCIS
</td>
<td style="text-align:center;">
1000MERCIS
</td>
<td style="text-align:center;">
FRA
</td>
<td style="text-align:center;">
FRA
</td>
<td style="text-align:center;">
PARIS
</td>
<td style="text-align:center;">
PARIS
</td>
<td style="text-align:center;">
28 RUE DE CHATEAUDUN
</td>
<td style="text-align:center;">
28 RUE DE CHATEAUDUN
</td>
</tr>
<tr>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
2G ENERGY AG
</td>
<td style="text-align:center;">
2G ENERGY AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
HEEK
</td>
<td style="text-align:center;">
HEEK
</td>
<td style="text-align:center;">
BENZSTRASSE 3
</td>
<td style="text-align:center;">
BENZSTRASSE 3
</td>
</tr>
<tr>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
2INVEST AG
</td>
<td style="text-align:center;">
2INVEST AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
HEIDELBERG
</td>
<td style="text-align:center;">
HEIDELBERG
</td>
<td style="text-align:center;">
ZIEGELHAUSER LANDSTR 3
</td>
<td style="text-align:center;">
ZIEGELHAUSER LANDSTR 3
</td>
</tr>
<tr>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
3U HOLDING AG
</td>
<td style="text-align:center;">
3U HOLDING AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
MARBURG
</td>
<td style="text-align:center;">
MARBURG
</td>
<td style="text-align:center;">
FRAUENBERGSTRASSE 31 33
</td>
<td style="text-align:center;">
FRAUENBERGSTRASSE 31 33
</td>
</tr>
<tr>
<td style="text-align:center;">
8953E4CF
</td>
<td style="text-align:center;">
566D4EAF
</td>
<td style="text-align:center;">
8953E4CF
</td>
<td style="text-align:center;">
566D4EAF
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
5TH PLANET GAMES A S
</td>
<td style="text-align:center;">
5TH PLANET GAMES A S
</td>
<td style="text-align:center;">
DNK
</td>
<td style="text-align:center;">
DNK
</td>
<td style="text-align:center;">
COPENHAGEN
</td>
<td style="text-align:center;">
COPENHAGEN
</td>
<td style="text-align:center;">
GOTHERSGADE 11
</td>
<td style="text-align:center;">
GOTHERSGADE 11
</td>
</tr>
<tr>
<td style="text-align:center;">
5F1D6968
</td>
<td style="text-align:center;">
3269F9E1
</td>
<td style="text-align:center;">
5F1D6968
</td>
<td style="text-align:center;">
3269F9E1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
7C SOLARPARKEN AG
</td>
<td style="text-align:center;">
7C SOLARPARKEN AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
BAYREUTH
</td>
<td style="text-align:center;">
BAYREUTH
</td>
<td style="text-align:center;">
AN DER FEUERWACHE 15
</td>
<td style="text-align:center;">
AN DER FEUERWACHE 15
</td>
</tr>
</tbody>
</table>

## Example (All-in-One)

``` r
tab_final2 <- match_complete(
  .source = table_source,
  .target = table_target,
  .cols_match = cols_match,
  .cols_join = cols_join,
  .cols_exact = cols_exact,
  .method = method,
  .standardize = TRUE,
  .col_score = col_score
)
#> Calculating Block: 003-028
```

``` r
all.equal(tab_final1, tab_final2)
#> [1] TRUE
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 10px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:center;">
id_s
</th>
<th style="text-align:center;">
id_t
</th>
<th style="text-align:center;">
all_s
</th>
<th style="text-align:center;">
all_t
</th>
<th style="text-align:center;">
score
</th>
<th style="text-align:center;">
name_s
</th>
<th style="text-align:center;">
name_t
</th>
<th style="text-align:center;">
iso3_s
</th>
<th style="text-align:center;">
iso3_t
</th>
<th style="text-align:center;">
city_s
</th>
<th style="text-align:center;">
city_t
</th>
<th style="text-align:center;">
address_s
</th>
<th style="text-align:center;">
address_t
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
975AF234
</td>
<td style="text-align:center;">
67CC2286
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1000MERCIS
</td>
<td style="text-align:center;">
1000MERCIS
</td>
<td style="text-align:center;">
FRA
</td>
<td style="text-align:center;">
FRA
</td>
<td style="text-align:center;">
PARIS
</td>
<td style="text-align:center;">
PARIS
</td>
<td style="text-align:center;">
28 RUE DE CHATEAUDUN
</td>
<td style="text-align:center;">
28 RUE DE CHATEAUDUN
</td>
</tr>
<tr>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
C07A46B5
</td>
<td style="text-align:center;">
775B36DB
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
2G ENERGY AG
</td>
<td style="text-align:center;">
2G ENERGY AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
HEEK
</td>
<td style="text-align:center;">
HEEK
</td>
<td style="text-align:center;">
BENZSTRASSE 3
</td>
<td style="text-align:center;">
BENZSTRASSE 3
</td>
</tr>
<tr>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
FB8EC365
</td>
<td style="text-align:center;">
C7F93EC4
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
2INVEST AG
</td>
<td style="text-align:center;">
2INVEST AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
HEIDELBERG
</td>
<td style="text-align:center;">
HEIDELBERG
</td>
<td style="text-align:center;">
ZIEGELHAUSER LANDSTR 3
</td>
<td style="text-align:center;">
ZIEGELHAUSER LANDSTR 3
</td>
</tr>
<tr>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
9E715D89
</td>
<td style="text-align:center;">
820A46E0
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
3U HOLDING AG
</td>
<td style="text-align:center;">
3U HOLDING AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
MARBURG
</td>
<td style="text-align:center;">
MARBURG
</td>
<td style="text-align:center;">
FRAUENBERGSTRASSE 31 33
</td>
<td style="text-align:center;">
FRAUENBERGSTRASSE 31 33
</td>
</tr>
<tr>
<td style="text-align:center;">
8953E4CF
</td>
<td style="text-align:center;">
566D4EAF
</td>
<td style="text-align:center;">
8953E4CF
</td>
<td style="text-align:center;">
566D4EAF
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
5TH PLANET GAMES A S
</td>
<td style="text-align:center;">
5TH PLANET GAMES A S
</td>
<td style="text-align:center;">
DNK
</td>
<td style="text-align:center;">
DNK
</td>
<td style="text-align:center;">
COPENHAGEN
</td>
<td style="text-align:center;">
COPENHAGEN
</td>
<td style="text-align:center;">
GOTHERSGADE 11
</td>
<td style="text-align:center;">
GOTHERSGADE 11
</td>
</tr>
<tr>
<td style="text-align:center;">
5F1D6968
</td>
<td style="text-align:center;">
3269F9E1
</td>
<td style="text-align:center;">
5F1D6968
</td>
<td style="text-align:center;">
3269F9E1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
7C SOLARPARKEN AG
</td>
<td style="text-align:center;">
7C SOLARPARKEN AG
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
DEU
</td>
<td style="text-align:center;">
BAYREUTH
</td>
<td style="text-align:center;">
BAYREUTH
</td>
<td style="text-align:center;">
AN DER FEUERWACHE 15
</td>
<td style="text-align:center;">
AN DER FEUERWACHE 15
</td>
</tr>
</tbody>
</table>

## Code of Conduct

Please note that the Rmatch project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
