library(tidyverse)
library(basedosdados)
library(geobr)

# Lista com codigo dos municipios (IBGE) ------------------------------------

# municípios de SP
municipios_sp <- geobr::read_municipality() |>
  filter(abbrev_state == "SP") |>
  as_tibble() |>
  mutate(code_muni = as.character(code_muni))

# vetor com municipios da regiao metropolitana de sp
vetor_id_muni_sp_rm <- municipios_sp |>
  filter(name_muni %in%
    c(
      "São Paulo", "Guarulhos", "São Bernardo Do Campo", "Santo André",
      "Osasco", "Mogi Das Cruzes", "Mauá", "Diadema", "Carapicuíba",
      "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboão Da Serra",
      "Embu", "Itapevi"
    )) |>
  pull(code_muni) |>
  as.character()


# Pegando dataset da BD ---------------------------------------------------

# project-id do google cloud
set_billing_id("bene-410616")

# Bolsa familia -------------------------------------------------------------

# Base completa
df_bf <- bdplyr("br_cgu_beneficios_cidadao.novo_bolsa_familia") |>
  filter(sigla_uf == "SP") |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido))

bolsa_familia <- df_bf |> 
  group_by(id_municipio, ano_competencia, mes_competencia) |>
  summarise(
    total_pago = sum(valor_parcela),
    total_beneficiarios = count(id_municipio)
  ) |>
  as_tibble() |>
  # inserindo df com o nome dos municipios
  left_join(municipios_sp, by = c("id_municipio" = "code_muni")) |>
  select(-geom)

# Base somente com regiao metropolitana de sp
bolsa_familia_sp_rm <- bolsa_familia |>
  filter(id_municipio %in% vetor_id_muni_sp_rm) |>
  select(
    id_municipio, name_muni, ano_competencia, mes_competencia,
    total_pago, total_beneficiarios
  )

# Salvando em formato xlsx
write.xlsx(bolsa_familia_sp_rm, file = "bolsa_familia_sp_rm.xlsx")

bolsa_familia_sp_rm |>
  group_by(name_muni, ano_competencia) |>
  summarise(total = sum(total_pago)) -> join_bf

# BPC -----------------------------------------------------------------------

# Base completa
df_bpc <- bdplyr("br_cgu_beneficios_cidadao.bpc") |>
  filter(sigla_uf == "SP") |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido))

bpc <- df_bpc |>
  group_by(id_municipio, ano_competencia, mes_competencia) |>
  summarise(
    total_pago = sum(valor_parcela),
    total_beneficiarios = count(id_municipio)
  ) |>
  as_tibble() |>
  # inserindo df com o nome dos municipios
  left_join(municipios_sp, by = c("id_municipio" = "code_muni"))

# Base somente com regiao metropolitana de sp
bpc_sp_rm <- bpc |>
  filter(id_municipio %in% vetor_id_muni_sp_rm) |>
  select(
    id_municipio, name_muni, ano_competencia, mes_competencia,
    total_pago, total_beneficiarios, geom
  )

# Salvando em formato xlsx
write.xlsx(bpc_sp_rm, file = "cgu/bpc_sp_rm.xlsx")

bpc_sp_rm |>
  arrange(name_muni, desc(ano_competencia), mes_competencia) |>
  print(n = 100)

bpc_sp_rm |>
  group_by(name_muni, ano_competencia) |>
  summarise(total = sum(total_pago)) -> join_bpc


# Juntando as bases -------------------------------------------------------


# Mapa --------------------------------------------------------------------

bpc_sp_rm |>
  ggplot() +
  geom_sf()
