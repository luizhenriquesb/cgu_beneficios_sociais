
library(basedosdados)
library(tidyverse)

basedosdados::set_billing_id("banded-athlete-410813")

df <- read_sql(
  'SELECT
    bpc.id_municipio, mes_competencia, ano_competencia,
    COUNT(DISTINCT nis_favorecido) AS qtde_beneficiarios,
    pop.populacao
    FROM `basedosdados.br_cgu_beneficios_cidadao.bpc` AS bpc
    JOIN `basedosdados.br_ibge_populacao.municipio` AS pop
    ON bpc.id_municipio = pop.id_municipio
    AND bpc.ano_competencia = pop.ano
    WHERE bpc.id_municipio = "3550308"
    GROUP BY
    bpc.id_municipio, ano_competencia, mes_competencia, pop.populacao'
  )

dados <- df |>
  mutate(
    perc = qtde_beneficiarios / populacao,
    data = as.Date(paste(ano_competencia, mes_competencia, "01", sep = "-"))
  )

dados |> 
  ggplot() +
  aes(x = data, y = perc) +
  geom_line(colour = "#1351B4") +
  theme_classic() +
  ggrepel::geom_label_repel(
    aes(label = qtde_beneficiarios),
    max.overlaps = 4 # quanto mais, mais labels
  ) +
  scale_x_date(date_labels = "%b/%y",
               date_breaks = "2 months") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Beneficío de Prestação Continuada",
    subtitle = "Percentual de beneficiários em relação à população total de São Paulo (SP)",
    caption = "Fonte: Base dos Dados | Controladoria Geral da União | IBGE"
  ) +
  theme(
    plot.title = element_text(
      colour = "#1351B4",
      face = "bold"),
    plot.subtitle = element_text(
      colour = "grey10"
    ),
    plot.caption = element_text(
      colour = "grey20"
    ),
    axis.text = element_text(colour = "black", face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1.25),
    panel.grid.major.y = element_line(color = "grey60", 
                                      linetype = "dashed",
                                      linewidth = .35),
    axis.title = element_blank(),
    axis.ticks.x = element_line(colour = "black"),
    axis.ticks.y = element_blank(),
    axis.line.x = element_line(colour = "black", linewidth = .75),
    axis.line.y = element_blank(),
    panel.background = element_rect(
      fill = "grey90"
    ),
    plot.background = element_rect(
      fill = "grey90"
    ))
