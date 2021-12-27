library(tidyverse); library(stringi); library(janitor); library(countrycode)


legal_form_gleif <- read_delim("data-raw/2021-10-21-elf-code-list-v1.4.1.csv", ",", col_types = cols()) %>%
  clean_names() %>%
  select(
    id = elf_code,
    iso3 = country_code_iso_3166_1,
    local_full = entity_legal_form_name_local_name,
    local_abbr = abbreviations_local_language,
    trans_full = entity_legal_form_name_transliterated_name_per_iso_01_140_10,
    trans_abbr = abbreviations_transliterated
  ) %>%
  pivot_longer(local_full:trans_abbr, names_to = "type", values_to = "legal_form") %>%
  filter(!is.na(legal_form)) %>%
  mutate(legal_form = stri_split_fixed(legal_form, ";")) %>%
  unnest(legal_form) %>%
  mutate(source = "gleif")

ecb0 <- openxlsx::read.xlsx("data-raw/List_of_legal_forms.xlsx", 3, startRow = 2) %>%
  clean_names() %>%
  select(
    id = legal_form,
    iso3 = country_iso_code,
    local_full = extensive_title_description,
    trans_full = english_name_description,
    trans_abbr = legal_form_acronym_in_the_country_of_origin_if_applicable
  )  %>%
  pivot_longer(local_full:trans_abbr, names_to = "type", values_to = "legal_form") %>%
  filter(!is.na(legal_form)) %>%
  mutate(legal_form = stri_split_fixed(legal_form, "/")) %>%
  unnest(legal_form) %>%
  mutate(source = "ecb")

ecb1 <- ecb0 %>%
  filter(iso3 == "-") %>%
  select(-iso3) %>%
  expand_grid(iso3 = unique(ecb0$iso3)) %>%
  filter(!iso3 == "-")

legal_form_ecb <- distinct(bind_rows(ecb0, ecb1)) %>%
  filter(!iso3 == "-")

legal_form_all <- bind_rows(legal_form_gleif, legal_form_ecb) %>%
  filter(stri_enc_isascii(legal_form)) %>%
  mutate(
    legal_form = standardize_str(legal_form),
    type = if_else(grepl("full", type), "full", "abbr")
  ) %>%
  group_by(source, iso3, id) %>%
  arrange(desc(nchar(legal_form)), .by_group = TRUE) %>%
  mutate(legal_form_stand = first(legal_form)) %>%
  ungroup() %>%
  distinct(source, iso3, legal_form, legal_form_stand) %>%
  filter(nchar(legal_form_stand) > 0) %>%
  rename(legal_form_orig = legal_form) %>%
  mutate(iso3 = countrycode(iso3, "iso2c", "iso3c"))

legal_form_ecb <- filter(legal_form_all, source == "ecb") %>%
  distinct(iso3, legal_form_orig, legal_form_stand)

legal_form_gleif <- filter(legal_form_all, source == "gleif") %>%
  distinct(iso3, legal_form_orig, legal_form_stand)

legal_form_all <- legal_form_all %>%
  distinct(iso3, legal_form_orig, legal_form_stand) %>%
  group_by(iso3, legal_form_orig) %>%
  arrange(nchar(legal_form_stand), .by_group = TRUE) %>%
  mutate(legal_form_stand = first(legal_form_stand)) %>%
  ungroup() %>%
  distinct(iso3, legal_form_orig, legal_form_stand)


usethis::use_data(legal_form_all, overwrite = TRUE)
usethis::use_data(legal_form_ecb, overwrite = TRUE)
usethis::use_data(legal_form_gleif, overwrite = TRUE)

