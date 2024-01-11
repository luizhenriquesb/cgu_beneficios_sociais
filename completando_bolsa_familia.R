
library(tidyverse)

# Importando e tratando bases com os outros meses de 2023 do Bolsa Familia/Aux BR

# Auxilio Brasil ---------------------------------------------------------
## 2023-01 ---------------------------------------------------------------


aux_202301 <- vroom::vroom("pbf_abr/202301_AuxilioBrasil.zip",
  delim = ";",
  locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-02 ---------------------------------------------------------------

aux_202302 <- vroom::vroom("pbf_abr/202302_AuxilioBrasil.zip",
                           delim = ";",
                           locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

# Novo Bolsa Familia -------------------------------------------------------

## 2023-03 -----------------------------------------------------------------

bf_202303 <- vroom::vroom("pbf_abr/202303_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-04 -----------------------------------------------------------------

bf_202304 <- vroom::vroom("pbf_abr/202304_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido))

bf_202304 <- bf_202304 |> arrange(desc(uf))
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |>
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-05 -----------------------------------------------------------------

bf_202305 <- vroom::vroom("pbf_abr/202305_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-06 -----------------------------------------------------------------

bf_202306 <- vroom::vroom("pbf_abr/202306_NovoBolsaFamilia.zip",
                           delim = ";",
                           locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-07 -----------------------------------------------------------------

bf_202307 <- vroom::vroom("pbf_abr/202307_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-08 -----------------------------------------------------------------

bf_202308 <- vroom::vroom("pbf_abr/202308_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-09 -----------------------------------------------------------------

bf_202309 <- vroom::vroom("pbf_abr/202309_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-10 -----------------------------------------------------------------

bf_202310 <- vroom::vroom("pbf_abr/202310_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )

## 2023-11 -----------------------------------------------------------------

bf_202311 <- vroom::vroom("pbf_abr/202311_NovoBolsaFamilia.zip",
                          delim = ";",
                          locale = locale(encoding = "latin1")
) |>
  janitor::clean_names() |>
  select(-c(cpf_favorecido, nis_favorecido, nome_favorecido)) |> 
  mutate(
    nome_municipio = str_to_title(nome_municipio),
    mes_competencia = as.character(mes_competencia)
  ) |> 
  filter(uf == "SP") |>
  filter(nome_municipio %in% c(
    "Sao Paulo", "Guarulhos", "Sao Bernardo Do Campo", "Santo Andre",
    "Osasco", "Mogi Das Cruzes", "Maua", "Diadema", "Carapicuiba",
    "Itaquaquecetuba", "Barueri", "Suzano", "Cotia", "Taboao Da Serra",
    "Embu", "Itapevi"
  )) |> 
  separate_wider_delim(
    cols = mes_competencia,
    delim = "202",
    names = c("mes", "ano")
  ) |>
  mutate(mes = case_when(
    uf == "SP" ~ "2023"
  )) |>
  select(
    codigo_municipio_siafi, nome_municipio,
    uf, ano, mes, valor_parcela
  )


# Juntando tudo -----------------------------------------------------------

aux_202301 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Auxilio Brasil"
  )) -> aux_202301

aux_202302 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Auxilio Brasil"
  )) -> aux_202302

bf_202303 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202303

bf_202304 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202304

bf_202305 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202305

bf_202306 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202306

bf_202307 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202307

bf_202308 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202308

bf_202309 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202309

bf_202310 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202310

bf_202311 |> 
  mutate(beneficio = case_when(
    uf == "SP" ~ "Bolsa Familia"
  )) -> bf_202311

names(bolsa_familia_sp_rm)
names(bf_202303)

bolsa_familia_sp_rm |> 
  rename(codigo_municipio_siafi = id_municipio,
         
         )
  

beneficios <- rbind(aux_202301,
                    aux_202302,
                    # bf_202303,
                    # bf_202304,
                    # bf_202305,
                    bf_202306,
                    bf_202307,
                    bf_202308,
                    bf_202309,
                    bf_202310,
                    bf_202311)
names(beneficios)

beneficios |> 
  group_by(nome_municipio, mes) |>
  summarise(
    total_pago = sum(valor_parcela),
    # total_beneficiarios = count(nome_municipio)
  )
