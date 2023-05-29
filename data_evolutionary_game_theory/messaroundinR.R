#rm(list = ls())

library(tidyverse) #including readr



df_authors <- readr::read_csv("C:/Users/kleinow/ownCloud/data_evolutionary_game_theory/authors_full.csv")
df_titles <- read_csv("C:/Users/kleinow/ownCloud/data_evolutionary_game_theory/titles.csv")
df_refs <- read_csv("C:/Users/kleinow/ownCloud/data_evolutionary_game_theory/references.csv")

head(df_authors)
head(df_titles) 
head(df_refs)

spec(df_authors)

