.read_seader_dataset <- function(
    url,
    filename,
    year = NULL,
    as_data_frame = FALSE,
    showProgress = TRUE,
    cache = TRUE
) {

  if (!requireNamespace("arrow", quietly = TRUE)) {
    stop("Package 'arrow' is required. Install it with install.packages('arrow').", call. = FALSE)
  }

  cache_dir <- path.expand("~/.seader")
  if (!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)

  dest <- file.path(cache_dir, filename)

  if (!isTRUE(cache) || !file.exists(dest)) {

    if (file.exists(dest)) file.remove(dest)

    utils::download.file(
      url = url,
      destfile = dest,
      mode = "wb",
      quiet = !isTRUE(showProgress)
    )
  }

  ds <- arrow::open_dataset(dest, format = "parquet")

  if (!is.null(year)) {
    ds <- dplyr::filter(ds, ano == !!year)
  }

  if (isTRUE(as_data_frame)) {
    return(as.data.frame(dplyr::collect(ds)))
  }

  ds
}
