#' Read municipal live births by mother's age dataset
#'
#' @param year Integer year to filter
#' @param as_data_frame Logical
#' @param showProgress Logical
#' @param cache Logical
#'
#' @export

read_birth_mother_age <- function(
    year = NULL,
    as_data_frame = FALSE,
    showProgress = TRUE,
    cache = TRUE
) {

  url <- paste0(SEADER_BASE_URL, "birth-age.parquet")

  .read_seader_dataset(
    url = url,
    filename = "birth-age.parquet",
    year = year,
    as_data_frame = as_data_frame,
    showProgress = showProgress,
    cache = cache
  )
}
