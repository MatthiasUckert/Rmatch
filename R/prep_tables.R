# Generated by fusen: do not edit by hand

#' Prepare Table
#' 
#' Description
#' 
#' @param .tab 
#' A dataframe (either the source or target dataframe)
#' @param .cols_match 
#' A character vector of columns to perform fuzzy matching. 
#'
#' @return
#' 
#' @noRd
#' @examples
#' prep_tables(table_source, c("name", "iso3", "city", "address"))
prep_tables <- function(.tab, .cols_match) {
  tmp <- id <- `_id_` <- NULL
  if (!"_id_" %in% colnames(.tab)) {
    tidyr::unite(
      data = tibble::as_tibble(.tab[, c("id", .cols_match)]),
      col = tmp,
      !dplyr::matches("^id$")
    ) %>%
      dplyr::group_by(tmp) %>%
      dplyr::summarise(
        `_id_` = list(id),
        id = dplyr::first(id),
        .groups = "drop"
      ) %>%
      dplyr::select(id, `_id_`) %>%
      dplyr::left_join(.tab, by = "id")
  } else {
    .tab
  }
}
