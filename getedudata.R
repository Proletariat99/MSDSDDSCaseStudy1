
# create the data directory if it doesn't already exist.
dir.create("data", showWarnings=FALSE)
# set working directory as the data folder (for both windows and linux / osx)
set_valid_wd(c("./data", "\\data"))
# internet data source
educationurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
# download the raw data.  
download.file(gdp190url, destfile = "gdp.csv")