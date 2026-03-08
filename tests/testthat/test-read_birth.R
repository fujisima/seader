library(testthat)
library(seader)
library(dplyr)

# -----------------------------
# Tests for read_birth_sex()
# -----------------------------

test_that("read_birth_sex returns Arrow query by default", {

  ds <- read_birth_sex(year = 2025)

  expect_true(inherits(ds, c("arrow_dplyr_query", "Dataset")))

})

test_that("read_birth_sex returns data.frame when requested", {

  skip_on_cran()

  df <- read_birth_sex(year = 2025, as_data_frame = TRUE)

  expect_true(is.data.frame(df))

})

test_that("read_birth_sex can be filtered with dplyr", {

  skip_on_cran()

  df <- read_birth_sex(year = 2025) |>
    filter(cod_ibge == 3550308) |>
    collect()

  expect_true(all(df$cod_ibge == 3550308))

})

test_that("read_birth_sex returns data", {

  skip_if_offline()
  skip_on_cran()

  df <- read_birth_sex(year = 2025, as_data_frame = TRUE)

  expect_true(nrow(df) > 0)

})

# -----------------------------
# Tests for read_birth_mother_age()
# -----------------------------

test_that("read_birth_mother_age returns Arrow query by default", {

  ds <- read_birth_mother_age(year = 2025)

  expect_true(inherits(ds, c("arrow_dplyr_query", "Dataset")))

})

test_that("read_birth_mother_age returns data.frame when requested", {

  skip_on_cran()

  df <- read_birth_mother_age(year = 2025, as_data_frame = TRUE)

  expect_true(is.data.frame(df))

})

test_that("read_birth_mother_age can be filtered with dplyr", {

  skip_on_cran()

  df <- read_birth_mother_age(year = 2025) |>
    filter(cod_ibge == 3550308) |>
    collect()

  expect_true(all(df$cod_ibge == 3550308))

})

test_that("read_birth_mother_age returns data", {

  skip_if_offline()
  skip_on_cran()

  df <- read_birth_mother_age(year = 2025, as_data_frame = TRUE)

  expect_true(nrow(df) > 0)

})
