############################################
## Read-in and Clean Case Study 1 Data Files
## Jim Brittain
## 2016-10-27
############################################

### Read files from the download folder
setwd(file.path(MainDir, "Download_Files"))
getwd()

GDPRaw     <- read.csv(file="GDP.csv", header=FALSE)
EdStatsRaw <- read.csv(file="EDSTATS_Country.CSV", header=TRUE)

setwd(MainDir)
                
# Create a new version of GDP data and clean that one
GDP <- GDPRaw[6:325,]
dim(GDP)
head(GDP)
tail(GDP)

# Keep only the 4 populated variables
GDP <- GDP[c(1,2,4,5)]

# Drop records where Country Code is blank
GDP <- subset(x=GDP, GDP$V1!="")
names(GDP) <- c("CountryCode","Ranking","Country","GDPDollars")

# Drop records after row 220 
# because at that point the original file lists subtotals by various groups
GDP <- GDP[1:214,] 

# Remove commas and convert GDPDollars to numeric
GDP$GDPDollars <- gsub(",","", GDP$GDPDollars)
GDP$GDPDollars <- as.numeric(GDP$GDPDollars)
# Convert Ranking to numeric
GDP$Ranking <- as.numeric(GDP$Ranking)


# Get a count of NAs for each variable of interest
summary(GDP)

# Look at CountryCodes
table(GDP$CountryCode)

# Create a new version of GDP data and clean that one
EdStats <- EdStatsRaw
dim(EdStatsRaw)
head(EdStatsRaw)
tail(EdStatsRaw)

# Drop records that are regional agregates (All have missing Region)
EdStats <- subset(x=EdStats, EdStats$Region!="")
# Keep only the variables that I am interested in 
EdStats <- EdStats[1:4] 
summary(EdStats)

# Look at CountryCodes
table(EdStats$CountryCode)
