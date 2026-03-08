#=============================
#= 1. Configurações iniciais =
#=============================

library(data.table)
library(tidyverse)
library(arrow)
library(readr)

#==============================
#= 2. Nascidos vivos por sexo =
#==============================

nascidosvivos_sexo_1924 <- data.table::fread("C:/Users/leona/Downloads/nascidosvivos_sexo_2019a2023.csv", encoding="Latin-1")
nascidosvivos_sexo_25 <- data.table::fread("C:/Users/leona/Downloads/nascidosvivos_sexo_anoatual.csv", encoding="Latin-1")

nascidosvivos_sexo_1924 <- nascidosvivos_sexo_1924 %>%
  rename(nascidos_vivos = nascidosvivos) %>%
  select(cod_ibge, ano, masculino, feminino, ignorado, nascidos_vivos)

nascidosvivos_sexo_25 <- nascidosvivos_sexo_25 %>%
  mutate(ignorado = 0) %>%
  select(cod_ibge, ano, masculino, feminino, ignorado, nascidos_vivos)

nascidosvivos_sexo <- rbind(nascidosvivos_sexo_1924, nascidosvivos_sexo_25)
nascidosvivos_sexo <- nascidosvivos_sexo %>%
  mutate(nascidos_vivos = as.character(nascidos_vivos),
         nascidos_vivos = as.integer(gsub("\\.", "", nascidos_vivos)),
         masculino = as.character(masculino),
         masculino = as.integer(gsub("\\.", "", masculino)),
         feminino = as.character(feminino),
         feminino = as.integer(gsub("\\.", "", feminino)),
         ignorado = as.character(ignorado),
         ignorado = as.integer(gsub("\\.", "", ignorado)))

write_parquet(
  nascidosvivos_sexo,
  "C:/Users/leona/Downloads/birth-sex.parquet",
  compression = "snappy"
)

#=============================================
#= 3. Nascidos vivos por faixa etária da mãe =
#=============================================

nascidosvivos_faixaetaria_mae_00_10_23_24 <- data.table::fread("C:/Users/leona/Downloads/nascidosvivos_idade_2000_2010_2023.csv", encoding="Latin-1")
nascidosvivos_faixaetaria_mae_25 <- data.table::fread("C:/Users/leona/Downloads/nascidosvivos_idade_anoatual.csv", encoding="Latin-1")

nascidosvivos_faixaetaria_mae_00_10_23_24 <- nascidosvivos_faixaetaria_mae_00_10_23_24 %>%
  select(ano, cod_ibge, idade, nascidosvivos_idade) %>%
  rename(nascidos_vivos = nascidosvivos_idade)

nascidosvivos_idade_mae <- rbind(nascidosvivos_faixaetaria_mae_00_10_23_24, nascidosvivos_faixaetaria_mae_25)
nascidosvivos_idade_mae <- nascidosvivos_idade_mae %>%
  mutate(nascidos_vivos = as.character(nascidos_vivos),
         nascidos_vivos = as.integer(gsub("\\.", "", nascidos_vivos)))

write_parquet(
  nascidosvivos_idade_mae,
  "C:/Users/leona/Downloads/birth-age.parquet",
  compression = "snappy"
)



