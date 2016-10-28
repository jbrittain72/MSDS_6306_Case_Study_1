############################################
## Download Case Study 1 Data Files
## Jim Brittain
## 2016-10-27
############################################

### This make file will creat a folder (if it doesn't already exist) and 
### download the required files for the Case Study 1

# Create a subfolder to download data files to if not present
if (file.exists("Download_Files")){
    setwd(file.path(MainDir, "Download_Files"))
  } else {
    dir.create(file.path(MainDir, "Download_Files"))
    setwd(file.path(MainDir, "Download_Files"))
}

# Download files to Download folder
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile="GDP.csv")
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",                   destfile="EDSTATS_Country.csv")
