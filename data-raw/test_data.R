library(tidyverse)
library(openxlsx)
library(countrycode)

target <- openxlsx::read.xlsx("data-raw/orbis.xlsx") %>%
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


source <- openxlsx::read.xlsx("data-raw/compustat.xlsx") %>%
  distinct(isin, .keep_all = TRUE) %>%
  rowwise() %>%
  mutate(
    id = digest::digest(paste(isin, 2), "xxhash32"),
  ) %>%
  ungroup() %>%
  select(id, isin, name, iso3, city, address) %>%
  distinct(id, .keep_all = TRUE) %>%
  mutate(across(where(is.character), toupper))

matches <- dplyr::inner_join(source, target, by = "isin", suffix = c("_s", "_t")) %>%
  select(
    id_s, id_t, name_s, name_t, iso3_s, iso3_t, city_s, city_t, address_s, address_t
  ) %>%
  mutate(match = 1)

target <- select(target, -isin)
source <- select(source, - isin)

usethis::use_data(source, overwrite = TRUE)
usethis::use_data(target, overwrite = TRUE)
usethis::use_data(matches, overwrite = TRUE)
