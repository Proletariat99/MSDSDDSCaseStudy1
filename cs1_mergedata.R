########
# mergedata.R
# dave dyer
# 07/02/17
########

set_valid_wd(c("./data", "\\data"))   # sets working directory to 'data' in the current wd.
edufile <- "edu.csv"                  # assigns filenames to variable
gdpfile <- "gdp.csv"                  # assigns filenames to variable



#### Read the gdp.csv raw data and encode blank entries and '..' entries as 'NA' values.
# Also skip the first 3 lines since they're just description
gdp <- read.csv(gdpfile, 
                na.strings=c('', '..'),
                skip = 3
                )
gdp_trimmed <- gdp[2:232,]          # trim the last few lines of the data, since it's just a descriptive paragraph without data.
##### Rename the columns to something slightly more meaningful.
names(gdp_trimmed) <- c("CountryCode", "Rank", "deleteme", "Economy", "GDP2012", "notes", "deleteme2", "deleteme3", "deleteme4", "deleteme5")
gdp_without_useless_columns <- gdp_trimmed[c(1,2,4,5)]   # Choose the the meaningful columns and save it intoa  new data frame.
# keeping only complete cases, but calculating how many we trimmed for the analysis. 
complete_gdp <- complete.cases(gdp_without_useless_columns)
empties <- length(complete_gdp) - sum(complete_gdp)    # how many empty cases we had.   
left <- sum(complete_gdp)    # how many we have left
print(paste("There are", empties, "empty records removed for this study, and", left, "left for the analysis" ))  # print the results.
gdp <- gdp_without_useless_columns[complete_gdp,]    # Get rid of the old entries and keep the good stuff.

# write to file
write.csv(gdp, "gdp_clean.csv")
#str(gdp)  # gdp structure is pretty noisy, so I commented this out 

# Get and clean Edu data.
edu <- read.csv(edufile)
# Edu Structure:
#str(edu)     # same thing here... edu structure is pretty large, so I commented this out.
# edu data is much cleaner, so very little need for tidying.
write.csv(edu, "edu_clean.csv")


# merge the data sets.
all_the_datas <- merge(edu, gdp, by="CountryCode")
# str(all_the_datas)   # yup, still noisy.

# Convert GDP from string to numeric without commas
all_the_datas$GDP2012 <- as.numeric(gsub(",", "", all_the_datas$GDP2012))    

write.csv(all_the_datas, "all_the_datas.csv")