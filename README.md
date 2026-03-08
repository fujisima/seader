
<!-- README.md is generated from README.Rmd. Please edit that file -->

# seader

<!-- badges: start -->

<!-- badges: end -->

Versioned municipal data infrastructure for demographic and social
analysis in Brazil.

The **seader** package provides functions to access consolidated and
versioned public datasets for Brazilian municipalities. The datasets are
published and maintained in the
[`seader-data`](https://github.com/fujisima/seader-data) repository.

Currently available:

- 📊 Live births by sex (2019–2025)
- Unit of analysis: Municipality (IBGE code)
- Format: Parquet
- Lazy access via Arrow

## Installation

You can install the development version of seader from
[GitHub](https://github.com/) with:

``` r
install.packages("remotes")
remotes::install_github("fujisima/seader")
```

## Example

This example demonstrates how to access birth data:

``` r
library(seader)
library(dplyr)
#> 
#> Anexando pacote: 'dplyr'
#> Os seguintes objetos são mascarados por 'package:stats':
#> 
#>     filter, lag
#> Os seguintes objetos são mascarados por 'package:base':
#> 
#>     intersect, setdiff, setequal, union

nascidosvivos <- read_birth_sex(year = 2025)

# 3550308 corresponds to the municipality of São Paulo
query <- nascidosvivos |> filter(cod_ibge == 3550308) 
query |> collect()
#>   cod_ibge  ano masculino feminino ignorado nascidosvivos
#> 1  3550308 2025    57.178   54.853        0       112.033
```
