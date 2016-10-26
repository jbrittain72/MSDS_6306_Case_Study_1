# MSDS_6306_Case_Study_1
Jim Brittain  
October 26, 2016  



## Download files to worling directory



```r
## Adjust working directory as needed
MainDir <- "D:\\Users\\Jim\\SMU\\MSDS 6306 DOING DATA SCIENCE\\GIT\\MSDS_6306_Case_Study_1"
setwd(MainDir)

## Create a subfolder to download data files to if not present
if (file.exists("Download_Files")){
    setwd(file.path(MainDir, "Download_Files"))
  } else {
    dir.create(file.path(MainDir, "Download_Files"))
    setwd(file.path(MainDir, "Download_Files"))
}

## Download files to Download folder
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile="GDP.csv")
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",                   destfile="EDSTATS_Country.csv")

## Read files
GDP     <- read.csv(file="GDP.csv", header=FALSE)
EdStats <- read.csv(file="EDSTATS_Country.CSV", header=TRUE)
```

