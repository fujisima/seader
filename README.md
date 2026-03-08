
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

nascidosvivos_sexo <- read_birth_sex(year = 2025)

# 3550308 corresponds to the municipality of São Paulo
query_1 <- nascidosvivos_sexo |> filter(cod_ibge == 3550308) 
query_1 |> collect()
#>   cod_ibge  ano masculino feminino ignorado nascidos_vivos
#> 1  3550308 2025    57.178   54.853        0         112033

nascidosvivos_idade <- read_birth_mother_age(year = 2025)

# 3550308 corresponds to the municipality of São Paulo
query_2 <- nascidosvivos_idade |> filter(cod_ibge == 3550308) 
query_2 |> collect()
#>    ano cod_ibge    idade nascidos_vivos
#> 1 2025  3550308 Menos 20           7584
#> 2 2025  3550308  20 a 29          51133
#> 3 2025  3550308  30 a 39          46497
#> 4 2025  3550308  40 a 49           6657
```
