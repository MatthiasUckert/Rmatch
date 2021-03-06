# Generated by fusen: do not edit by hand

#' Complete Match
#' 
#' Description
#' 
#' @param .source 
#' The Source Dataframe.\cr
#' (Must contain a unique column id and the columns you want to match on)
#' @param .target 
#' The Target Dataframe.\cr
#' (Must contain a unique column id and the columns you want to match on)
#' @param .cols_match 
#' A character vector of columns to perform fuzzy matching. 
#' @param .cols_join
#' Columns to perfrom an exact match on, before fuzzy-matching.\cr
#' (Matched IDs will be excluded from fuzzy-match)
#' @param .cols_exact 
#' Columns that must be matched perfectly.\cr
#' (Data will be partitioned using those columns)
#' @param .max_match 
#' Maximum number of matches to return (Default = 10)
#' @param .method 
#' One of "osa", "lv", "dl", "hamming", "lcs", "qgram", "cosine", "jaccard", "jw", "soundex".\cr
#' See: stringdist-metrics {stringdist}
#' @param .verbose 
#' Print additional information?
#' @param .workers 
#' Number of cores to utilize (Default all cores determined by future::availableCores())
#' @param .char_block 
#' Character Block Size. Used to partition data.\cr
#' - First element chunks the source data in ngram-blocks.\cr
#' - Second element allows for characters in target below/above block size.
#' @param .standardize 
#' Perform String Standardization using standardize_data()?
#' @param .w_unique 
#' Weights calculated by get_weights()
#' @param .w_custom 
#' A named numeric vector that matches the columns of .cols_match w/o the columns of .cols_exact
#' @param .min_sim
#' Named vector with minimum similarities
#' @param .col_score 
#' Score column generated by scores_data().\cr
#' Options are:\cr
#' - sms: Simple Mean (mean over all fuzzy columns)\cr
#' - smw: Weighted Mean (mean over all fuzzy columns, weighted by get_weights())\cr
#' - smc: Custom Mean (mean over all fuzzy columns, weighted custom weights)\cr
#' - sss: Simple Mean, squared (mean over all fuzzy columns, scores are squared)\cr
#' - ssw: Weighted Mean, squared (mean over all fuzzy columns, scores are squared before weighted by get_weights())\cr
#' - ssc: Custom Mean, squared (mean over all fuzzy columns, scores are squared before weighted custom weights)
#'
#' @return
#' A dataframe
#' 
#' @export
#' @examples
#' match_complete(
#'   .source = table_source[1:100, ],
#'   .target = table_target[1:999, ],
#'   .cols_match = c("name", "iso3", "city", "address"),
#'   .cols_join = c("name", "iso3"),
#'   .cols_exact = "iso3",
#'   .max_match = 25,
#'   .method = "soundex",
#'   .verbose = TRUE,
#'   .workers = 4,
#'   .char_block = c(5, 5),
#'   .standardize = TRUE,
#'   .w_unique = NULL,
#'   .w_custom = c(name = .7, city = .2, address = .1),
#'   .col_score = "sms"
#' )
match_complete <- function(
  .source, .target, .cols_match, .cols_join = NULL, .cols_exact = NULL, 
  .max_match = 10, .method = "osa", .verbose = TRUE, 
  .workers = future::availableCores(), .char_block = c(Inf, Inf), 
  .standardize = TRUE, .w_unique = NULL, .w_custom = NULL, 
  .min_sim = NULL, .col_score = c("sms", "smw", "smc", "sss", "ssw", "ssc")
  ) {
  check_id(.source, .target)
  source_ <- prep_tables(.source, .cols_match)
  target_ <- prep_tables(.target, .cols_match)
  
  cols_score_ <- match.arg(.col_score, c("sms", "smw", "smc", "sss", "ssw", "ssc"))

  if (.standardize) {
    source_ <- standardize_data(source_, .cols_match)
    target_ <- standardize_data(target_, .cols_match)
  }

  match_ <- match_data(
    .source = source_,
    .target = target_,
    .cols_match = .cols_match,
    .cols_join = .cols_join,
    .cols_exact = .cols_exact,
    .max_match = .max_match,
    .method = .method,
    .verbose = .verbose,
    .workers = .workers,
    .char_block = .char_block
  )
  
  score_ <- scores_data(
    .matches = match_,
    .source = source_,
    .target = target_,
    .cols_match = .cols_match,
    .cols_exact = .cols_exact,
    .w_unique = .w_unique,
    .w_custom = .w_custom
  )
  
  dedup_data(
    .score = score_,
    .source = source_,
    .target = target_,
    .cols_match = .cols_match,
    .col_score = cols_score_,
    .min_sim = .min_sim
  )
  
}
