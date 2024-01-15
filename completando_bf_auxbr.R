library(tidyverse)

anos21 <- seq(202111, 202112, by = 1)
anos22 <- seq(202201, 202212, by = 1)
anos23 <- seq(202301, 202312, by = 1)


arqs <- paste0(
  "arquivos/pasta/...",
  anos21,
  ".zip"
)

df21 <- list()

for (i in seq_along(anos21)) {
  
  df21[[i]] <- vroom::vroom(arqs[i],
             delim = ";",
             locale = locale(encoding = "latin1")) |> head(10)
  
}
