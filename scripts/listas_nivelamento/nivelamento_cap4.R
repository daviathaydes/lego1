# Lista Nivelamento - Davi Athaydes Leite - Capítulo 4

library(tidyverse)
library(haven)

# Gráficos de barras

eseb2022 <- read_sav("eseb2022.sav") |> 
  as_factor()

eseb2022 |> 
  ggplot()+
  aes(y = Q10P2b)+
  geom_bar()

# Gráficos de barras com facetas

eseb2022 |> 
  ggplot()+
  aes(y = Q10P2b)+
  geom_bar()+
  facet_wrap(~REG, ncol = 2)

# Gráficos de histograma
 
censo <- read_delim("Censo_1872_dados_tidy_versao2.csv",
                    delim = ";", locale = locale(encoding = "latin1"),
                    trim_ws = TRUE) 

censo |> 
  ggplot()+
  aes(x = Raças_Preto)+
  geom_histogram()
  
# Gráficos de barras com totais calculados

censo |> 
  group_by(PrimeiroDeProvincia) |> 
  summarise(
    total_de_pessoas = sum(Total_Almas)
  ) |> 
  ggplot() +
  aes(x = total_de_pessoas, y = reorder(PrimeiroDeProvincia, total_de_pessoas)) +
  geom_col()

# Temas e customizações

censo |> 
  group_by(PrimeiroDeProvincia) |> 
  summarise(
    total_de_pessoas = sum(Total_Almas)
  ) |> 
  ggplot() +
  aes(x = total_de_pessoas, y = reorder(PrimeiroDeProvincia, total_de_pessoas)) +
  labs(x = "Total de pessoas", y = "Província")+
  geom_col(fill = "steelblue", alpha = .9)+
  theme_minimal() +
  theme(
    legend.position = "bottom",
    axis.text.x  = element_text(size = 12, face = "bold"),
    axis.text.y  = element_text(size = 12, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
  )

  
  
  
  