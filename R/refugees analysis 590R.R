#Read in a dataset and save a file using here package (at least twice)
refugees <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2023/2023-08-22/population.csv')

#https://github.com/rfordatascience/tidytuesday/blob/main/data/2023/2023-08-22/readme.md
readr::write_rds(refugees, here::here("data", "refugees.rds"))
