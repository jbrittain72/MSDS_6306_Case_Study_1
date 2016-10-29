############################################
## Merge and Analize Case Study 1 Data Files
## Jim Brittain
## 2016-10-28
############################################
setwd(MainDir)

####################################################################################
# 1. Merge the data based on the country shortcode. How many of the IDs match?
####################################################################################

# Get a count of NAs for each variable of interest
summary(EdStats)

# Do a Left join (output as FULL) want to keep all records in GDP
Full <- merge(x=GDP, y=EdStats, by="CountryCode", all.x=TRUE)
dim(Full)

# Do a second merge to see if there were any records that did not match the GDP
Match <- merge(x=GDP, y=EdStats, by="CountryCode")
dim(Match)

####################################################################################
# 2. Sort the data frame in ascending order by GDP so United States is last. 
# What is the 13th country in the resulting data frame?
####################################################################################
# Sort the data frame by GDP
Full <- Full[order(Full$GDP),]

# What is the 13th observation?
Full[13,c("Country","Ranking","GDPDollars","Income.Group")]

####################################################################################
# 3. What are the average GDP rankings for the "High income: OECD" and "High income:
#    nonOECD" groups?
####################################################################################
# Subset the 2 frames with observations we are interested in for averages
HighIncOECD <- subset(x=Full, Full$Income.Group=="High income: OECD")
HighIncOECD <- HighIncOECD[c(1,2,4,6)]
summary(HighIncOECD)

HighIncNonOECD <- subset(x=Full, Full$Income.Group=="High income: nonOECD")
HighIncNonOECD <- HighIncNonOECD[c(1,2,4,6)]
summary(HighIncNonOECD)

mean(HighIncOECD$Ranking)
mean(HighIncNonOECD$Ranking)

####################################################################################
# 4. Plot GDP for all countries. 
#    Use ggplot2 to color your plot by Imcome Group.
####################################################################################
# Drop NAs (GDP) out of frame for plotting
FullnonNA <- subset(x=Full, Full$GDPDollars!="NA")

ggplot(FullnonNA, aes(x=Income.Group, y=GDPDollars)) + 
  geom_point(aes(color=Income.Group, size=Ranking)) +
  scale_x_discrete(name="Income Group") +
  scale_y_continuous(name="Country's GDP - Mill. of Dollars") 


####################################################################################
# 5. Cut the GDP ranking into 5 separate quantile groups. 
#    Make a table versus Income.Group.
#    How many countries are Lower middle income but among the 38 nations with highest GDP?
####################################################################################
summary(Full$GDPDollars)

attach(Full)
Full$GDPGroup[GDPDollars <= 40]                           <- 1
Full$GDPGroup[GDPDollars >     40 & GDPDollars <=   7005] <- 2
Full$GDPGroup[GDPDollars >   7005 & GDPDollars <=  27640] <- 3
Full$GDPGroup[GDPDollars >  27640 & GDPDollars <= 205300] <- 4
Full$GDPGroup[GDPDollars > 205300]                        <- 5

summary(Full$GDPGroup)

# Assign “labels” to the “format” variable (changing variable from numeric to a factor)
GDPLabels <- c("GDPQ1","GDPQ2","GDPQ3","GDPQ4","GDPQ5")
Full$GDPGroup <- factor(Full$GDPGroup,labels=GDPLabels)
summary(Full$GDPGroup)

table(Full$GDPGroup,Full$Income.Group)
