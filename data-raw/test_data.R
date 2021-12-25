library(tidyverse)
library(openxlsx)
library(countrycode)

table_target <- openxlsx::read.xlsx("data-raw/orbis.xlsx") %>%
  distinct(isin, .keep_all = TRUE) %>%
  select(-name2) %>%
  rename(name = name1) %>%
  filter(!is.na(name)) %>%
  mutate(iso3 = countrycode(iso2, origin = "iso2c", destination = "iso3c")) %>%
  rowwise() %>%
  mutate(
    id = digest::digest(paste(isin, 1), "xxhash32"),
    ) %>%
  ungroup() %>%
  select(id, isin, name, iso3, city, address) %>%
  distinct(id, .keep_all = TRUE) %>%
  mutate(across(where(is.character), toupper))


table_source <- openxlsx::read.xlsx("data-raw/compustat.xlsx") %>%
  distinct(isin, .keep_all = TRUE) %>%
  rowwise() %>%
  mutate(
    id = digest::digest(paste(isin, 2), "xxhash32"),
  ) %>%
  ungroup() %>%
  select(id, isin, name, iso3, city, address) %>%
  distinct(id, .keep_all = TRUE) %>%
  mutate(across(where(is.character), toupper))

table_matches <- dplyr::inner_join(table_source, table_target, by = "isin", suffix = c("_s", "_t")) %>%
  select(
    id_s, id_t, name_s, name_t, iso3_s, iso3_t, city_s, city_t, address_s, address_t
  ) %>%
  mutate(match = 1) %>%
  filter(iso3_s == iso3_t)

table_target <- select(table_target, -isin)
table_source <- select(table_source, - isin)

usethis::use_data(table_source, overwrite = TRUE)
usethis::use_data(table_target, overwrite = TRUE)
usethis::use_data(table_matches, overwrite = TRUE)
