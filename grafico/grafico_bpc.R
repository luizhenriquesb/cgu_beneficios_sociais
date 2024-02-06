
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

# write_csv(df, "dados/cgu_bpc")

dados <- df |>
  mutate(
    perc = qtde_beneficiarios / populacao,
    data = as.Date(paste(ano_competencia, mes_competencia, "01", sep = "-"))
  )

dados |>
  ggplot() +
  aes(x = data, y = perc) +
  geom_line(colour = "#1351B4", size = 1.25) +
  theme_classic() +
  ggrepel::geom_label_repel(
    aes(label = qtde_beneficiarios),
    max.overlaps = 3,
    fill = "#1351B4",
    colour = "grey100"
  ) +
  scale_x_date(
    date_labels = "%b/%y",
    date_breaks = "3 months"
  ) +
  scale_y_continuous(labels = scales::percent,
                     limits = c(0, .05),
                     breaks = seq(0, .05, by = 0.01)) +
  labs(
    title = "Beneficío de Prestação Continuada",
    subtitle = "Percentual de beneficiários do município de São Paulo (SP) em relação à população total da cidade",
    caption = "Fonte: Base dos Dados | Controladoria Geral da União | IBGE"
  ) +
  theme(
    plot.title = element_text(
      colour = "#1351B4",
      face = "bold",
      size = 14
    ),
    plot.subtitle = element_text(
      colour = "grey20",
      size = 12
    ),
    plot.caption = element_text(
      colour = "grey20",
      size = 10,
      vjust = 0.01
    ),
    axis.text = element_text(colour = "grey20", face = "bold"),
    axis.text.x = element_text(size = 10, angle = 30, hjust = 1),
    axis.text.y = element_text(size = 11),
    panel.grid.major.y = element_line(
      color = "grey60",
      linetype = "dashed",
      linewidth = .35
    ),
    axis.title = element_blank(),
    axis.ticks.x = element_line(colour = "black"),
    axis.ticks.y = element_blank(),
    axis.line.x = element_line(colour = "black", linewidth = .75),
    axis.line.y = element_line(colour = "black", linewidth = .75),
    panel.background = element_rect(
      fill = "grey100"
    ),
    plot.background = element_rect(
      fill = "grey100"
    )
  )



ggsave("grafico_bpc.jpeg",
       plot = plot,
       path = "grafico/",
       width = 10,
       height = 6,
       dpi = 700)
