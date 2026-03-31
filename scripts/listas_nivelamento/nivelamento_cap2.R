# Lista Nivelamento - Davi Athaydes Leite - Capítulo 2

library(tidyverse)
library(readxl)

# Carregando arquivos simples I

pessoas <- read_delim("pessoas.csv", delim = ";", 
                      skip = 1)

head(pessoas)

## Primeiro visualizei a base manualmente; vi que o delimitador é ponto e virgula;
## Vi também que o título das colunas não era a primeira linha (por isso utilizei skip = 1)

# Carregando arquivos simples II

distribuicao_renda <- read_delim(
  "distribuicao_renda_rfb.txt"
  )

head(distribuicao_renda)

# Carregando arquivos simples III

casos <- read_delim("casos_registrados.csv", 
               skip = 2)

## Visualizei, vi que haviam informações acima das colunas que não eram o título das colunas
## Delimitador vírgula, então nao precisei especificar
## dei um skip de 2 linhas para contemplar apenas as colunas

# Carregando arquivos delimitados

censo <- read_delim("Censo_1872_dados_tidy_versao2.csv",
                    delim = ";", locale = locale(encoding = "latin1"),
                    trim_ws = TRUE)
rm(censo)

# Carregando arquivos de outros formatos I

wvs_spss <- read_sav("wvs.sav")

wvs_stata <- read_dta("wvs.dta")

# Carregando arquivos de outros formatos II

gramado <- read_excel(
  "2019_Gramado_STATE_OF_RIO_GRANDE_DO_SUL_Airbnb_listings.xlsx"
  )

head(gramado)

# Carregando microdados administrativos

alunos <- read_delim(
  "microdados_censo_da_educacao_superior_2022/microdados_educaç╞o_superior_2022/dados/MICRODADOS_ED_SUP_IES_2022.CSV",
  delim = ";")

colnames(alunos)
nrow(alunos)
ncol(alunos)

