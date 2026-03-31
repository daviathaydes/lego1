# Lista Nivelamento - Davi Athaydes Leite - Capítulo 3

library(tidyverse)
library(readxl)

# Filtrando bases de dados I

pop_quilombola <- read_csv("pop_quilombola.csv")

pop_quilombola_filtrado <- slice(pop_quilombola, 1:100)

# Filtrando bases de dados II

pop_quilombola_identificados <- pop_quilombola |> 
  filter(pop_quilombola > 0)

# Seleção de variáveis, filtragem e ordenamento

populacao <- read_excel("pop_total.xlsx")

maiores_populacoes <- populacao |> 
  arrange(-pop_total) |>
  slice(1:50) |> view() # 50º município mais populoso: Mogi das Cruzes (SP)

# Criação de variáveis

populacao |> mutate(
  pop_por_mil = pop_total/1000,
  categoria_tamanho = ifelse(pop_total < 50000, "Pequeno porte", "Outros")
) |> view()

# Resumo de variáveis

populacao_total <- populacao |> 
  summarise(
    popoulacao_total = sum(pop_total)
  )

populacao_quilombola_total <- pop_quilombola |> 
  summarise(
    popoulacao_quilombola_total = sum(pop_quilombola)
  )

# Cruzando bases de dados I

municipios <- left_join(populacao, pop_quilombola)
## Como a variável-chave tem o mesmo título/estrutura em ambos os bancos nao precisa nem identifica-la no script

# Criação de variáveis, filtragem e ordenamento

municipios |> 
  mutate(prop_quilombolas = pop_quilombola/pop_total) |>
  arrange(-prop_quilombolas) |> 
  slice(1, 2, 3) |> view()

# Cruzamento de bases de dados II

uf_municipios <- read_csv("uf_municipios.csv")

municipios <- left_join(
  municipios, uf_municipios 
)

# Agrupamento e resumo de variáveis I

municipios |>
  group_by(sigla_uf) |>
  summarise(
    pop_total_estado = sum(pop_total),
    pop_quilombola_estado = sum(pop_quilombola),
    prop_quilombolas = pop_quilombola_estado/pop_total_estado
    )

# Agrupamento e resumo de variáveis II

municipios |>
  group_by(sigla_uf) |>
  summarise(
    populacao_total = sum(pop_total),
    pop_quilombola_estado = sum(pop_quilombola),
    prop_quilombolas = pop_quilombola_estado/populacao_total
  ) |> view()
    
# Agrupamento e criação de variáveis

taxa_pop_quilombola <- municipios |>
  group_by(sigla_uf) |>
  summarise(
    populacao_total = sum(pop_total),
    pop_quilombola_estado = sum(pop_quilombola),
    taxa_pop_quilombola = pop_quilombola_estado/populacao_total * 100000
  ) # Estado com maior taxa de pessoas quilombolas por 100 mil habitantes no país: MA

