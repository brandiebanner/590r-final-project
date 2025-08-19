#Read in a dataset and save a file using here package (at least twice)
refugees <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2023/2023-08-22/population.csv')

#https://github.com/rfordatascience/tidytuesday/blob/main/data/2023/2023-08-22/readme.md
readr::write_rds(refugees, here::here("data", "refugees.rds"))

levels(factor(refugees$coo_name))

#code regions
library(countrycode)

manuallycode <- c(
	"Stateless" = NA,
	"Unknown" = NA,
	"Tibetan" = "East Asia & Pacific",
	"Western Sahara" = "Middle East & North Africa",
	"Serbia and Kosovo: S/RES/1244 (1999)" = "Europe & Central Asia"
)

refugees$coo_name_fixed <- ifelse(
	refugees$coo_name %in% names(manuallycode),
	manuallycode[refugees$coo_name],
	refugees$coo_name
)

manual_regions <- manuallycode[!is.na(manuallycode)]  # vector of manual region names

refugees$coo_region <- NA_character_

refugees$coo_region[refugees$coo_name %in% names(manuallycode)] <- refugees$coo_name_fixed[refugees$coo_name %in% names(manuallycode)]

non_manual_idx <- !(refugees$coo_name %in% names(manuallycode))
refugees$coo_region[non_manual_idx] <- countrycode(
	refugees$coo_name_fixed[non_manual_idx],
	origin = "country.name",
	destination = "region"
)

refugees$coo_region[is.na(refugees$coo_region)] <- "Unknown"

table(refugees$coo_region)
