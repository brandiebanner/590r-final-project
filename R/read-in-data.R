water_2022 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-28/water_insecurity_2022.csv')
water_2023 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-28/water_insecurity_2023.csv')

readr::write_rds(water_2022, here::here("data", "water_2022.rds"))
readr::write_rds(water_2023, here::here("data", "water_2023.rds"))
