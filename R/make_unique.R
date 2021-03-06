# Generated by fusen: do not edit by hand

#' Make Dataframe Unique
#' 
#' Description
#' 
#' @param .data A dataframe
#' @param ... Columns on which the dataframe should be unique 
#' @param .rem 
#' "all": All duplicates are removed (also the first non-duplicated entry)\cr
#' "last": Only subsequent duplicates are removed (first value remains)
#'
#' @return A dataframe
#' 
#' @export
#' @examples
#' make_unique(table_source, name)
make_unique <- function(.data, ..., .rem = c("all", "last")) {
  rem_ <- match.arg(.rem, c("all", "last"))
  tmp_ <- NULL
  
  .data <- tibble::as_tibble(.data)
  
  vars_ <- dplyr::enquos(...)
  tab_ <- tibble::as_tibble(.data) %>%
    dplyr::mutate(tmp_ = paste0(!!!vars_))

  if (rem_ == "all") {
    tab_ <- dplyr::filter(tab_, !(duplicated(tmp_) | duplicated(tmp_, fromLast = TRUE)))
  } else {
    tab_ <- dplyr::filter(tab_, !(duplicated(tmp_)))
  }

  dplyr::select(tab_, -tmp_)
}
