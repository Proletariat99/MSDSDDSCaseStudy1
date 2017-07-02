# this code is to get the data for casestudy1 for MSDS DDS
library(repmis)

gdp190url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
educationurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

dir.create("data", showWarnings=FALSE)


set_valid_wd(c("./data", "\\data"))

download.file(gdp190url, destfile = "gdp.csv")
download.file(educationurl, destfile = "edu.csv")

