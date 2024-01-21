
library(tidyverse)

########### 2022 ########################################################

# Auxilio Brasil --------------------------------------------------------

# Datas que queremos 
anos <- seq(from = 202201, to = 202206, by = 1)

# Criando os arquivos zip que queremos
arqs <- paste0(
  "pbf_abr/",
  anos,
  "_AuxilioBrasil.zip"
)

arqs

auxbr <- list()


for (i in seq_along(anos)) {
  
  auxbr[[i]] <- vroom::vroom(arqs[i], 
                             delim = ";",
                             locale = locale(encoding = "latin1")) |> 
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
      delim = "2022",
      names = c("ano", "mes"),
      too_few = "align_start"
    ) |>
    mutate(ano = case_when(
      uf == "SP" ~ "2022"
    ),
    beneficio = case_when(
      uf == "SP" ~ "Auxílio Brasil"
    )) |> 
    group_by(nome_municipio, ano, mes, beneficio) |>
    summarise(
      total_pago = sum(valor_parcela),
      media = mean(valor_parcela),
      desvio_padrao = sd(valor_parcela),
      total_beneficiarios = n()
    )
  
}

auxbr[1]

beneficios <- do.call(rbind, auxbr)

writexl::write_xlsx(beneficios, "pbf_abr/pbf_auxbr2022.xlsx")

########### 2023 ########################################################

# Auxilio Brasil --------------------------------------------------------

# Datas que queremos 
anos <- seq(from = 202301, to = 202302, by = 1)

# Criando os arquivos zip que queremos
arqs <- paste0(
  "pbf_abr/",
  anos,
  "_AuxilioBrasil.zip"
)

# df <- vroom::vroom(arqs[1], 
#              delim = ";",
#              locale = locale(encoding = "latin1"))

auxbr <- list()

for (i in seq_along(anos)) {
  
  auxbr[[i]] <- vroom::vroom(arqs[i], 
                          delim = ";",
                          locale = locale(encoding = "latin1")) |> 
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
      delim = "2023",
      names = c("ano", "mes")
    ) |>
    mutate(ano = case_when(
      uf == "SP" ~ "2023"
    ),
    beneficio = case_when(
      uf == "SP" ~ "Auxílio Brasil"
    )) |> 
    group_by(nome_municipio, ano, mes, beneficio) |>
    summarise(
      total_pago = sum(valor_parcela),
      media = mean(valor_parcela),
      desvio_padrao = sd(valor_parcela),
      total_beneficiarios = n()
    )
  
}

auxbr[[1]]

# Bolsa Familia --------------------------------------------------------

# Datas que queremos 
anos <- seq(from = 202303, to = 202311, by = 1)

# Criando os arquivos zip que queremos
arqs <- paste0(
  "pbf_abr/",
  anos,
  "_NovoBolsaFamilia.zip"
)

# df <- vroom::vroom(arqs[1], 
#              delim = ";",
#              locale = locale(encoding = "latin1"))

bf <- list()

for (i in seq_along(anos)) {
  
  bf[[i]] <- vroom::vroom(arqs[i], 
                     delim = ";",
                     locale = locale(encoding = "latin1")) |> 
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
      delim = "2023",
      names = c("ano", "mes")
    ) |>
    mutate(ano = case_when(
      uf == "SP" ~ "2023"
    ),
    beneficio = case_when(
      uf == "SP" ~ "Bolsa Família"
    )) |> 
    group_by(nome_municipio, ano, mes, beneficio) |>
    summarise(
      total_pago = sum(valor_parcela),
      media = mean(valor_parcela),
      desvio_padrao = sd(valor_parcela),
      total_beneficiarios = n()
    )
  
}

beneficios <- do.call(rbind, c(auxbr, bf))

writexl::write_xlsx(beneficios, "pbf_abr/pbf_auxbr2023.xlsx")

