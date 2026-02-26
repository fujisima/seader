test_that("read_birth returns Arrow Dataset by default", {
  ds <- read_birth()
  expect_s3_class(ds, "Dataset")
})

test_that("read_birth returns data.frame when requested", {
  df <- read_birth(as_data_frame = TRUE)
  expect_true(is.data.frame(df))
})

test_that("read_birth filters by year", {
  df <- read_birth(year = 2024, as_data_frame = TRUE)
  expect_true(all(df$ano == 2024))
})

test_that("read_birth works", {
  skip_if_offline()
  df <- read_birth(year = 2024, as_data_frame = TRUE)
  expect_true(nrow(df) > 0)
})
