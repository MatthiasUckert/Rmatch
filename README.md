
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rmatch

<!-- badges: start -->
<!-- badges: end -->

Rmatch is a package that aims to assist you in any matching task that
involves two datasets and (approximate) string matching

## Installation

You can install the development version of Rmatch like so:

``` r
# devtools::install_github("https://github.com/MatthiasUckert/Rmatch)
```

## Example

Basic usage using build-in datasets. Check out the vignette for full
specification

``` r
library(Rmatch); library(kableExtra)
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
<span style=" font-weight: bold;    ">2,426</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">4,671</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">11,331,846</span>
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
<span style=" font-weight: bold;    ">1,813 MB</span>
</td>
</tr>
</tbody>
</table>

Standardizing columns won’t harm

``` r
cols <- c("name", "iso3", "city", "address")
tab_source <- standardize_data(tab_source, cols)
tab_target <- standardize_data(tab_target, cols)
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
<span style=" font-weight: bold;    ">2,426</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">4,671</span>
</td>
<td style="text-align:center;">
<span style=" font-weight: bold;    ">11,331,846</span>
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
<span style=" font-weight: bold;    ">1,813 MB</span>
</td>
</tr>
</tbody>
</table>

Let’s match the two dataframes

``` r
tab_match <- match_data(
  .source = tab_source,
  .target = tab_target,
  .cols = c("name", "iso3", "city", "address"),
  .min_sim = .2,
  .progress = FALSE
)
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 12px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
id_s
</th>
<th style="text-align:left;">
id_t
</th>
<th style="text-align:right;">
sim_name
</th>
<th style="text-align:right;">
sim_iso3
</th>
<th style="text-align:right;">
sim_city
</th>
<th style="text-align:right;">
sim_address
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
1147DBEB
</td>
<td style="text-align:right;">
1.0000000
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
1.0000000
</td>
<td style="text-align:right;">
1.0000000
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
ECBDC99C
</td>
<td style="text-align:right;">
0.8095238
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
0.0769231
</td>
<td style="text-align:right;">
0.4166667
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
7E438459
</td>
<td style="text-align:right;">
0.8000000
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0.0000000
</td>
<td style="text-align:right;">
0.0000000
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
737B2D6D
</td>
<td style="text-align:right;">
0.7500000
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0.0000000
</td>
<td style="text-align:right;">
0.0000000
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
2E6064E6
</td>
<td style="text-align:right;">
0.7500000
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0.1818182
</td>
<td style="text-align:right;">
0.1666667
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
68EBF61D
</td>
<td style="text-align:right;">
0.7391304
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
0.3333333
</td>
<td style="text-align:right;">
0.1904762
</td>
</tr>
</tbody>
</table>

Let’s calculate the best matches

``` r
tab_score <- scores_data(tab_match)
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 12px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
id_s
</th>
<th style="text-align:left;">
id_t
</th>
<th style="text-align:right;">
score_mean
</th>
<th style="text-align:right;">
score_square
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
1147DBEB
</td>
<td style="text-align:right;">
1.0000000
</td>
<td style="text-align:right;">
1.0000000
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
ECBDC99C
</td>
<td style="text-align:right;">
0.5757784
</td>
<td style="text-align:right;">
0.4587143
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
7E438459
</td>
<td style="text-align:right;">
0.2000000
</td>
<td style="text-align:right;">
0.1600000
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
737B2D6D
</td>
<td style="text-align:right;">
0.1875000
</td>
<td style="text-align:right;">
0.1406250
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
2E6064E6
</td>
<td style="text-align:right;">
0.2746212
</td>
<td style="text-align:right;">
0.1558339
</td>
</tr>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
68EBF61D
</td>
<td style="text-align:right;">
0.5657350
</td>
<td style="text-align:right;">
0.4234265
</td>
</tr>
</tbody>
</table>

Finally Deduplicate Matches, DONE(ish)

``` r
tab_final <- dedup_data(
  .score = tab_score,
  .source = tab_source,
  .target = tab_target,
  .col = "score_square"
)
```

<table class=" lightable-paper table table-condensed" style="font-family: &quot;Arial Narrow&quot;, arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 8px; font-family: Times New Roman; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
id_s
</th>
<th style="text-align:left;">
id_t
</th>
<th style="text-align:right;">
score
</th>
<th style="text-align:left;">
name_s
</th>
<th style="text-align:left;">
name_t
</th>
<th style="text-align:left;">
iso3_s
</th>
<th style="text-align:left;">
iso3_t
</th>
<th style="text-align:left;">
city_s
</th>
<th style="text-align:left;">
city_t
</th>
<th style="text-align:left;">
address_s
</th>
<th style="text-align:left;">
address_t
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
291C5CB8
</td>
<td style="text-align:left;">
1147DBEB
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
ASM INTERNATIONAL NV
</td>
<td style="text-align:left;">
ASM INTERNATIONAL NV
</td>
<td style="text-align:left;">
NLD
</td>
<td style="text-align:left;">
NLD
</td>
<td style="text-align:left;">
ALMERE
</td>
<td style="text-align:left;">
ALMERE
</td>
<td style="text-align:left;">
VERSTERKERSTRAAT 8
</td>
<td style="text-align:left;">
VERSTERKERSTRAAT 8
</td>
</tr>
<tr>
<td style="text-align:left;">
2767155A
</td>
<td style="text-align:left;">
A1148A8D
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
ATLAS COPCO AB
</td>
<td style="text-align:left;">
ATLAS COPCO AB
</td>
<td style="text-align:left;">
SWE
</td>
<td style="text-align:left;">
SWE
</td>
<td style="text-align:left;">
NACKA
</td>
<td style="text-align:left;">
NACKA
</td>
<td style="text-align:left;">
SICKLA INDUSTRIVAG 19
</td>
<td style="text-align:left;">
SICKLA INDUSTRIVAG 19
</td>
</tr>
<tr>
<td style="text-align:left;">
69F3F1BD
</td>
<td style="text-align:left;">
BAB3BD1B
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
BASF SE
</td>
<td style="text-align:left;">
BASF SE
</td>
<td style="text-align:left;">
DEU
</td>
<td style="text-align:left;">
DEU
</td>
<td style="text-align:left;">
LUDWIGSHAFEN AM RHEIN
</td>
<td style="text-align:left;">
LUDWIGSHAFEN AM RHEIN
</td>
<td style="text-align:left;">
CARL BOSCH STRASSE 38
</td>
<td style="text-align:left;">
CARL BOSCH STRASSE 38
</td>
</tr>
<tr>
<td style="text-align:left;">
BB6D2999
</td>
<td style="text-align:left;">
18162F6F
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
DAIMLER AG
</td>
<td style="text-align:left;">
DAIMLER AG
</td>
<td style="text-align:left;">
DEU
</td>
<td style="text-align:left;">
DEU
</td>
<td style="text-align:left;">
STUTTGART
</td>
<td style="text-align:left;">
STUTTGART
</td>
<td style="text-align:left;">
MERCEDESSTRASSE 120
</td>
<td style="text-align:left;">
MERCEDESSTRASSE 120
</td>
</tr>
<tr>
<td style="text-align:left;">
DF7D66DF
</td>
<td style="text-align:left;">
332C8FDD
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
KONINKLIJKE KPN NV
</td>
<td style="text-align:left;">
KONINKLIJKE KPN NV
</td>
<td style="text-align:left;">
NLD
</td>
<td style="text-align:left;">
NLD
</td>
<td style="text-align:left;">
ROTTERDAM
</td>
<td style="text-align:left;">
ROTTERDAM
</td>
<td style="text-align:left;">
WILHELMINAKADE 123
</td>
<td style="text-align:left;">
WILHELMINAKADE 123
</td>
</tr>
<tr>
<td style="text-align:left;">
A6DD9B9C
</td>
<td style="text-align:left;">
BED2CB75
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
BAYER AG
</td>
<td style="text-align:left;">
BAYER AG
</td>
<td style="text-align:left;">
DEU
</td>
<td style="text-align:left;">
DEU
</td>
<td style="text-align:left;">
LEVERKUSEN
</td>
<td style="text-align:left;">
LEVERKUSEN
</td>
<td style="text-align:left;">
KAISER WILHELM ALLEE 1
</td>
<td style="text-align:left;">
KAISER WILHELM ALLEE 1
</td>
</tr>
</tbody>
</table>

## Code of Conduct

Please note that the Rmatch project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
