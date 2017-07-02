###################
# R Makefile.R make-like File
# Dave Dyer
# Created 07/02/17, once I realized I was doing it wrong
###################

myProjectDir <- "~/Documents/smu/MSDS6306-DDS/MSDSDDSCaseStudy1/"
setwd(myProjectDir)

####  Get Raw Education Data and download to a data directory.
source("getedudata.R")
setwd(myProjectDir)

####  Get Raw GDP Data and download to a data directory.
source("getgdpdata.R")
setwd(myProjectDir)

####  Clean and Merge the data into one tidy data set called all_the_datas
source("cs1_mergedata.R")
setwd(myProjectDir)

library(knitr)
knit("CaseStudy1.Rmd")
