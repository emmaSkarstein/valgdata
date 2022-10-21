# Data fra https://www.ssb.no/valg/faktaside/valg
library(stringi)

##### VELGEROPPSLUTNING #####
# Velgeroppslutning ved siste tre valg
velgeroppslutning <- read.csv("data-raw/velgeroppslutning-ved-tr.csv", sep = ";")
colnames(velgeroppslutning) <- c("parti", "2013", "2017", "2021")
velgeroppslutning <- tidyr::pivot_longer(velgeroppslutning,
                                         cols = "2013":"2021",
                                         names_to = "aar",
                                         values_to = "prosent") |>
  mutate_at(c("parti", "aar"), as.factor)

Encoding(levels(velgeroppslutning$parti)) <- "UTF-8"

usethis::use_data(velgeroppslutning, overwrite = TRUE)

##### MANDATER #####
# Mandater på de ulike partiene ved de siste to valgene
mandater <- read.csv("data-raw/mandater-p-stortinget.csv", sep = ";")
colnames(mandater) <- c("parti", "2017", "2021")
mandater <- tidyr::pivot_longer(mandater,
                                cols = "2017":"2021",
                                names_to = "aar",
                                values_to = "mandater") |>
  mutate_at(c("parti", "aar"), as.factor)

Encoding(levels(mandater$parti)) <- "UTF-8"

usethis::use_data(mandater, overwrite = TRUE)
