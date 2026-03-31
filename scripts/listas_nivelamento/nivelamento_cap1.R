# Lista Nivelamento - Davi Athaydes Leite - Capítulo 1

## Primeiros passos com R ----

meu_ano_nascimento <- 2003

ano_atual <- 2026

minha_idade <- ano_atual - meu_ano_nascimento

minha_idade

## Trabalhando com textos ----

meu_nome <- "Davi Athaydes Leite"

paste("Meu nome é", meu_nome)

## Usando funções básicas ----

nchar(meu_nome)

raiz_nome <- sqrt(nchar(meu_nome))

## Criando e usando vetores ----

notas <- c(9, 9.5, 6.6, 9, 10)

media_notas <- mean(notas)

## Usando lógica condicional ----

aprovado <- ifelse(media_notas >= 8, T, F)
  # Se a média das minhas notas for superior à 8, aprovado, caso contrário, FALSE

## Trabalhando com textos (strings) ----

nome_abreviado <- abbreviate(meu_nome)
# As duas últimas letras do nome abreviado correspondem a primeira letra de meus sobrenomes. 
# As duas primeiras correspondem ao primeiro e terceiro valor do primeiro nome 

## Operações com vetores I

anos <- c(2022, 2023, 2024, 2025, 2026)

meu_ano_nascimento

idades <- anos - meu_ano_nascimento

media_idades <- mean(idades)

## Operações com vetores II

notas_abaixo_media <- notas[notas < media_notas] # Operador para extrair de notas apenas os valores inferiores à media_notas

## Explorando data.frames

dados_pessoais <- data.frame(
  Ano = anos,
  Idade = idades
)

names(dados_pessoais) # Título das colunas
nrow(dados_pessoais)  # Número de linhas/observações
ncol(dados_pessoais)  # Número de colunas/variáveis
View(dados_pessoais)  # Visualizar dados

## Manipulando data.frames I

capitais_sudeste <- data.frame(
  capital = c("Belo Horizonte", "São Paulo", "Rio de Janeiro", "Vitória"),
  estado = c("MG", "SP", "RJ", "ES"),
  populacao_por_mil = c(2315, 11451, 6211, 322)
)

capitais_maiores <- capitais_sudeste[capitais_sudeste$populacao_por_mil > 5000, ] 
### Filtro, pelo operador, os valores maiores que 5000 na coluna populacao_por_mil 

## Manipulando data.frames II

capitais_sudeste$estado[capitais_sudeste$estado == "MG"] <- "Minas Gerais"
capitais_sudeste$estado[capitais_sudeste$estado == "SP"] <- "São Paulo"
capitais_sudeste$estado[capitais_sudeste$estado == "RJ"] <- "Rio de Janeiro"
capitais_sudeste$estado[capitais_sudeste$estado == "ES"] <- "Espírito Santo"

capitais_uf <- capitais_sudeste$estado

## vou na coluna da tabela --> checo se o valor é "sigla do estado" --> atribuo diretamente o nome por extenso
# Por hábito eu faria essa tarefa pelo tidyverse mas como o cap 1 nao trata dele ainda, utilizei o rbase

# Instalação e uso de pacotes

library(ggplot2)

ggplot(data = dados_pessoais, aes(x = Ano, y = Idade)) + 
  geom_line() + 
  geom_point()
