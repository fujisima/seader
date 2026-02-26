read_birth <- function(
    year = NULL,
    as_data_frame = FALSE,
    showProgress = TRUE,
    cache = TRUE
) {

  if (!requireNamespace("arrow", quietly = TRUE)) {
    stop("Package 'arrow' is required. Install it with install.packages('arrow').", call. = FALSE)
  }

  # ---- Cache directory ----
  cache_dir <- getOption("seader.cache_dir", path.expand("~/.seader"))
  if (!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)

  url <- "https://github.com/fujisima/seader-data/releases/download/v2025/nascidosvivos-sexo-2019-2025.parquet"
  dest <- file.path(cache_dir, "nascidosvivos-sexo-2019-2025.parquet")

  # ---- Download logic ----
  if (!isTRUE(cache) || !file.exists(dest)) {
    if (file.exists(dest)) file.remove(dest)

    ok <- tryCatch({
      utils::download.file(
        url = url,
        destfile = dest,
        mode = "wb",
        quiet = !isTRUE(showProgress)
      )
      TRUE
    }, error = function(e) FALSE)

    if (!ok || !file.exists(dest)) {
      stop("Failed to download births data.", call. = FALSE)
    }
  }

  # ---- Open dataset ----
  ds <- arrow::open_dataset(dest, format = "parquet")

  # ---- Optional filtering by year ----
  if (!is.null(year)) {

    if (!is.numeric(year) || length(year) != 1) {
      stop("`year` must be a single numeric value.", call. = FALSE)
    }

    year <- as.integer(year)
    ds <- dplyr::filter(ds, ano == !!year)
  }

  # ---- Return ----
  if (isTRUE(as_data_frame)) {
    return(as.data.frame(dplyr::collect(ds)))
  } else {
    return(ds)
  }
}
