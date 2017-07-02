
# Load both data into memory:

set_valid_wd(c("./data", "\\data"))
edufile <- "edu.csv"
gdpfile <- "gdp.csv"



# Get and clean GDP data.

gdp <- read.csv(gdpfile, 
                na.strings=c('', '..'),
                skip = 3,
                stringsAsFactors = FALSE
                )
gdp_trimmed <- gdp[2:232,]
names(gdp_trimmed) <- c("CountryCode", "Rank", "deleteme", "Economy", "GDP2012", "notes", "deleteme2", "deleteme3", "deleteme4", "deleteme5")
gdp_without_useless_columns <- gdp_trimmed[c(1,2,4,5)]
# keeping only complete cases, but calculating how many we trimmed.
complete_gdp <- complete.cases(gdp_without_useless_columns)
empties <- length(complete_gdp) - sum(complete_gdp)
left <- sum(complete_gdp)
print(paste("There are", empties, "empty records removed for this study, and", left, "left for the analysis" ))
gdp <- gdp_without_useless_columns[complete_gdp,]


# GDP Structure:
#str(gdp)

# Get and clean Edu data.
edu <- read.csv(edufile, stringsAsFactors = FALSE)
# Edu Structure:
#str(edu)


# merge the data sets.
all_the_datas <- merge(edu, gdp, by="CountryCode")
# str(all_the_datas)

# Convert GDP from string to numeric without commas
all_the_datas$GDP2012 <- as.numeric(gsub(",", "", all_the_datas$GDP2012))