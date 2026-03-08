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

  url <- "https://github.com/fujisima/seader-data/releases/download/birth-mother-age/nascidosvivos-idade-2000-2010-2023-2024-2025.parquet"

  .read_seader_dataset(
    url = url,
    filename = "nascidosvivos-idade-2000-2010-2023-2024-2025.parquet",
    year = year,
    as_data_frame = as_data_frame,
    showProgress = showProgress,
    cache = cache
  )
}
