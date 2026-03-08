#' Read municipal live births by sex dataset
#'
#' @param year Integer year to filter
#' @param as_data_frame Logical
#' @param showProgress Logical
#' @param cache Logical
#'
#' @export

read_birth_sex <- function(
    year = NULL,
    as_data_frame = FALSE,
    showProgress = TRUE,
    cache = TRUE
) {

  url <- paste0(SEADER_BASE_URL, "birth-sex.parquet")

  .read_seader_dataset(
    url = url,
    filename = "birth-sex.parquet",
    year = year,
    as_data_frame = as_data_frame,
    showProgress = showProgress,
    cache = cache
  )
}
