##### PARTIENES FARGER #####
partifarger <- tibble::tribble(
  ~farge,       ~parti,
  "#204631",     "Venstre",
  "#A12F63",     "Sosialistisk Venstreparti",
  "#479B49",     "Senterpartiet",
  "#6B2145",     "Rødt",
  "#98BE59",     "Miljøpartiet de Grønne",
  "#EBA84B",     "Kristelig Folkeparti",
  "#4D79B2",     "Høyre",
  "#1D244F",     "Fremskrittspartiet",
  "#C1353A",     "Arbeiderpartiet",
  "grey50",     "Andre"
)

usethis::use_data(partifarger, overwrite = TRUE)

##### AKSE-POSISJON #####
akseposisjon <- tibble::tribble(
  ~aksepos,   ~parti,
  7,        "Venstre",
  2,        "Sosialistisk Venstreparti",
  4,        "Senterpartiet",
  1,        "Rødt",
  6,        "Miljøpartiet de Grønne",
  5,        "Kristelig Folkeparti",
  8,        "Høyre",
  9,        "Fremskrittspartiet",
  3,        "Arbeiderpartiet",
  10,       "Andre"
)

usethis::use_data(akseposisjon, overwrite = TRUE)
