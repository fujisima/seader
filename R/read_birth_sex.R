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

  url <- "https://github.com/fujisima/seader-data/releases/download/birth-sex/nascidosvivos-sexo-2019-2025.parquet"

  .read_seader_dataset(
    url = url,
    filename = "nascidosvivos-sexo-2019-2025.parquet",
    year = year,
    as_data_frame = as_data_frame,
    showProgress = showProgress,
    cache = cache
  )
}
