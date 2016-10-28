# MSDS_6306_Case_Study_1
Jim Brittain  
October 26, 2016  



## Call each code section's make file

### Download the data files

```r
source(file.path(MainDir, "Download_Files.R"), echo=TRUE, verbos=TRUE, keep.source=TRUE)
```

```
## 'envir' chosen:<environment: R_GlobalEnv>
## encoding = "native.enc" chosen
## --> parsed 3 expressions; now eval(.)ing them:
## 
## >>>> eval(expression_nr. 1 )
## 		 =================
## 
## > ############################################
## > ## Download Case Study 1 Data Files
## > ## Jim Brittain
## > ## 2016-10-27
## > ############################# .... [TRUNCATED] 
## curr.fun: symbol if
##  .. after 'expression(if (file.exists("Download_Files")){''    setwd(file.path(MainDir, "Download_Files"))''  } else {''    dir.create(file.path(MainDir, "Download_Files"))''    setwd(file.path(MainDir, "Download_Files"))''})'
## 
## >>>> eval(expression_nr. 2 )
## 		 =================
## 
## > # Download files to Download folder
## > download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
## +               destfile=" ..." ... [TRUNCATED] 
## curr.fun: symbol download.file
##  .. after 'expression(download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",''              destfile="GDP.csv"))'
## 
## >>>> eval(expression_nr. 3 )
## 		 =================
## 
## > download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",                   destfile="EDSTATS_Country.csv")
## curr.fun: symbol download.file
##  .. after 'expression(download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",                   destfile="EDSTATS_Country.csv"))'
```

## Read and CLean files

```r
source(file.path(MainDir, "ReadNClean_Files.R"), echo=TRUE)
```

```
## 
## > setwd(file.path(MainDir, "Download_Files"))
## 
## > getwd()
## [1] "D:/Users/Jim/SMU/MSDS 6306 DOING DATA SCIENCE/GIT/MSDS_6306_Case_Study_1/Download_Files"
## 
## > GDPRaw <- read.csv(file = "GDP.csv", header = FALSE)
## 
## > EdStatsRaw <- read.csv(file = "EDSTATS_Country.CSV", 
## +     header = TRUE)
## 
## > setwd(MainDir)
## 
## > GDP <- GDPRaw[6:325, ]
## 
## > dim(GDP)
## [1] 320  10
## 
## > head(GDP)
##     V1 V2 V3             V4           V5 V6 V7 V8 V9 V10
## 6  USA  1 NA  United States  16,244,600     NA NA NA  NA
## 7  CHN  2 NA          China   8,227,103     NA NA NA  NA
## 8  JPN  3 NA          Japan   5,959,718     NA NA NA  NA
## 9  DEU  4 NA        Germany   3,428,131     NA NA NA  NA
## 10 FRA  5 NA         France   2,612,878     NA NA NA  NA
## 11 GBR  6 NA United Kingdom   2,471,784     NA NA NA  NA
## 
## > tail(GDP)
##     V1 V2 V3 V4 V5 V6 V7 V8 V9 V10
## 320       NA          NA NA NA  NA
## 321       NA          NA NA NA  NA
## 322       NA          NA NA NA  NA
## 323       NA          NA NA NA  NA
## 324       NA          NA NA NA  NA
## 325       NA          NA NA NA  NA
## 
## > GDP <- GDP[c(1, 2, 4, 5)]
## 
## > GDP <- subset(x = GDP, GDP$V1 != "")
## 
## > names(GDP) <- c("CountryCode", "Ranking", "Country", 
## +     "GDP")
## 
## > GDP <- GDP[1:214, ]
## 
## > table(GDP$CountryCode)
## 
##     ABW ADO AFG AGO ALB ARE ARG ARM ASM ATG AUS AUT AZE BDI BEL BEN BFA 
##   0   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1 
## BGD BGR BHR BHS BIH BLR BLZ BMU BOL BRA BRB BRN BTN BWA CAF CAN CHE CHI 
##   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1 
## CHL CHN CIV CMR COG COL COM CPV CRI CUB CUW CYM CYP CZE DEU DJI DMA DNK 
##   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1 
## DOM DZA EAP ECA ECU EGY EMU ERI ESP EST ETH FIN FJI FRA FRO FSM GAB GBR 
##   1   1   0   0   1   1   0   1   1   1   1   1   1   1   1   1   1   1 
## GEO GHA GIN GMB GNB GNQ GRC GRD GRL GTM GUM GUY HIC HKG HND HRV HTI HUN 
##   1   1   1   1   1   1   1   1   1   1   1   1   0   1   1   1   1   1 
## IDN IMY IND IRL IRN IRQ ISL ISR ITA JAM JOR JPN KAZ KEN KGZ KHM KIR KNA 
##   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1 
## KOR KSV KWT LAC LAO LBN LBR LBY LCA LIC LIE LKA LMC LMY LSO LTU LUX LVA 
##   1   1   1   0   1   1   1   1   1   0   1   1   0   0   1   1   1   1 
## MAC MAF MAR MCO MDA MDG MDV MEX MHL MIC MKD MLI MLT MMR MNA MNE MNG MNP 
##   1   1   1   1   1   1   1   1   1   0   1   1   1   1   0   1   1   1 
## MOZ MRT MUS MWI MYS NAM NCL NER NGA NIC NLD NOR NPL NZL OMN PAK PAN PER 
##   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1 
## PHL PLW PNG POL PRI PRK PRT PRY PYF QAT ROM RUS RWA SAS SAU SDN SEN SGP 
##   1   1   1   1   1   1   1   1   1   1   1   1   1   0   1   1   1   1 
## SLB SLE SLV SMR SOM SRB SSA SSD STP SUR SVK SVN SWE SWZ SXM SYC SYR TCA 
##   1   1   1   1   1   1   0   1   1   1   1   1   1   1   1   1   1   1 
## TCD TGO THA TJK TKM TMP TON TTO TUN TUR TUV TZA UGA UKR UMC URY USA UZB 
##   1   1   1   1   1   1   1   1   1   1   1   1   1   1   0   1   1   1 
## VCT VEN VIR VNM VUT WBG WLD WSM YEM ZAF ZAR ZMB ZWE 
##   1   1   1   1   1   1   0   1   1   1   1   1   1 
## 
## > EdStats <- EdStatsRaw
## 
## > dim(EdStatsRaw)
## [1] 234  31
## 
## > head(EdStatsRaw)
##   CountryCode                    Long.Name         Income.Group
## 1         ABW                        Aruba High income: nonOECD
## 2         ADO      Principality of Andorra High income: nonOECD
## 3         AFG Islamic State of Afghanistan           Low income
## 4         AGO  People's Republic of Angola  Lower middle income
## 5         ALB          Republic of Albania  Upper middle income
## 6         ARE         United Arab Emirates High income: nonOECD
##                       Region Lending.category Other.groups  Currency.Unit
## 1  Latin America & Caribbean                                Aruban florin
## 2      Europe & Central Asia                                         Euro
## 3                 South Asia              IDA         HIPC Afghan afghani
## 4         Sub-Saharan Africa              IDA              Angolan kwanza
## 5      Europe & Central Asia             IBRD                Albanian lek
## 6 Middle East & North Africa                                U.A.E. dirham
##   Latest.population.census  Latest.household.survey
## 1                     2000                         
## 2           Register based                         
## 3                     1979               MICS, 2003
## 4                     1970 MICS, 2001, MIS, 2006/07
## 5                     2001               MICS, 2005
## 6                     2005                         
##                                                                 Special.Notes
## 1                                                                            
## 2                                                                            
## 3 Fiscal year end: March 20; reporting period for national accounts data: FY.
## 4                                                                            
## 5                                                                            
## 6                                                                            
##   National.accounts.base.year National.accounts.reference.year
## 1                        1995                               NA
## 2                                                           NA
## 3                   2002/2003                               NA
## 4                        1997                               NA
## 5                                                         1996
## 6                        1995                               NA
##   System.of.National.Accounts SNA.price.valuation
## 1                          NA                    
## 2                          NA                    
## 3                          NA                 VAB
## 4                          NA                 VAP
## 5                        1993                 VAB
## 6                          NA                 VAB
##   Alternative.conversion.factor PPP.survey.year
## 1                                            NA
## 2                                            NA
## 3                                            NA
## 4                       1991-96            2005
## 5                                          2005
## 6                                            NA
##   Balance.of.Payments.Manual.in.use External.debt.Reporting.status
## 1                                                                 
## 2                                                                 
## 3                                                           Actual
## 4                              BPM5                         Actual
## 5                              BPM5                         Actual
## 6                              BPM4                               
##   System.of.trade Government.Accounting.concept
## 1         Special                              
## 2         General                              
## 3         General                  Consolidated
## 4         Special                              
## 5         General                  Consolidated
## 6         General                  Consolidated
##   IMF.data.dissemination.standard
## 1                                
## 2                                
## 3                            GDDS
## 4                            GDDS
## 5                            GDDS
## 6                            GDDS
##   Source.of.most.recent.Income.and.expenditure.data
## 1                                                  
## 2                                                  
## 3                                                  
## 4                                         IHS, 2000
## 5                                        LSMS, 2005
## 6                                                  
##   Vital.registration.complete Latest.agricultural.census
## 1                                                       
## 2                         Yes                           
## 3                                                       
## 4                                                1964-65
## 5                         Yes                       1998
## 6                                                   1998
##   Latest.industrial.data Latest.trade.data Latest.water.withdrawal.data
## 1                     NA              2008                           NA
## 2                     NA              2006                           NA
## 3                     NA              2008                         2000
## 4                     NA              1991                         2000
## 5                   2005              2008                         2000
## 6                     NA              2008                         2005
##   X2.alpha.code WB.2.code           Table.Name           Short.Name
## 1            AW        AW                Aruba                Aruba
## 2            AD        AD              Andorra              Andorra
## 3            AF        AF          Afghanistan          Afghanistan
## 4            AO        AO               Angola               Angola
## 5            AL        AL              Albania              Albania
## 6            AE        AE United Arab Emirates United Arab Emirates
## 
## > tail(EdStatsRaw)
##     CountryCode                        Long.Name        Income.Group
## 229         WSM                            Samoa Lower middle income
## 230         YEM                Republic of Yemen Lower middle income
## 231         ZAF         Republic of South Africa Upper middle income
## 232         ZAR Democratic Republic of the Congo          Low income
## 233         ZMB               Republic of Zambia          Low income
## 234         ZWE             Republic of Zimbabwe          Low income
##                         Region Lending.category Other.groups
## 229        East Asia & Pacific              IDA             
## 230 Middle East & North Africa              IDA             
## 231         Sub-Saharan Africa             IBRD             
## 232         Sub-Saharan Africa              IDA         HIPC
## 233         Sub-Saharan Africa              IDA         HIPC
## 234         Sub-Saharan Africa            Blend             
##          Currency.Unit Latest.population.census Latest.household.survey
## 229        Samoan tala                     2006                        
## 230        Yemeni rial                     2004              MICS, 2006
## 231 South African rand                     2001               DHS, 2003
## 232    Congolese franc                     1984                DHS 2007
## 233     Zambian kwacha                     2000               DHS, 2007
## 234    Zimbabwe dollar                     2002            DHS, 2005/06
##                                                                   Special.Notes
## 229                                                                            
## 230                                                                            
## 231 Fiscal year end: March 31; reporting period for national accounts data: CY.
## 232                                                                            
## 233                                                                            
## 234  Fiscal year end: June 30; reporting period for national accounts data: CY.
##     National.accounts.base.year National.accounts.reference.year
## 229                        2002                               NA
## 230                        1990                               NA
## 231                        2000                               NA
## 232                        1987                               NA
## 233                        1994                               NA
## 234                        1990                               NA
##     System.of.National.Accounts SNA.price.valuation
## 229                          NA                 VAB
## 230                          NA                 VAP
## 231                        1993                 VAB
## 232                        1993                 VAB
## 233                          NA                 VAB
## 234                          NA                 VAB
##     Alternative.conversion.factor PPP.survey.year
## 229                                            NA
## 230                       1990-96            2005
## 231                                          2005
## 232                       1999-01            2005
## 233                       1990-92            2005
## 234                    1991, 1998            2005
##     Balance.of.Payments.Manual.in.use External.debt.Reporting.status
## 229                              BPM5                    Preliminary
## 230                              BPM5                         Actual
## 231                              BPM5                    Preliminary
## 232                              BPM5                       Estimate
## 233                              BPM5                    Preliminary
## 234                              BPM5                         Actual
##     System.of.trade Government.Accounting.concept
## 229         General                              
## 230         General                     Budgetary
## 231         General                  Consolidated
## 232         Special                  Consolidated
## 233         General                     Budgetary
## 234         General                  Consolidated
##     IMF.data.dissemination.standard
## 229                                
## 230                            GDDS
## 231                            SDDS
## 232                            GDDS
## 233                            GDDS
## 234                            GDDS
##     Source.of.most.recent.Income.and.expenditure.data
## 229                                                  
## 230                                       ES/BS, 2005
## 231                                       ES/BS, 2000
## 232                                    1-2-3, 2005-06
## 233                                      IHS, 2004-05
## 234                                                  
##     Vital.registration.complete Latest.agricultural.census
## 229                                                   1999
## 230                                                   2002
## 231                                                   2000
## 232                                                   1990
## 233                                                   1990
## 234                                                   1960
##     Latest.industrial.data Latest.trade.data Latest.water.withdrawal.data
## 229                     NA              2008                           NA
## 230                   2005              2008                         2000
## 231                   2005              2008                         2000
## 232                     NA              1986                         2000
## 233                     NA              2008                         2000
## 234                   1995              2008                         2002
##     X2.alpha.code WB.2.code       Table.Name      Short.Name
## 229            WS        WS            Samoa           Samoa
## 230            YE        RY      Yemen, Rep.           Yemen
## 231            ZA        ZA     South Africa    South Africa
## 232            CD        ZR Congo, Dem. Rep. Dem. Rep. Congo
## 233            ZM        ZM           Zambia          Zambia
## 234            ZW        ZW         Zimbabwe        Zimbabwe
## 
## > EdStats <- subset(x = EdStats, EdStats$Region == "")
## 
## > table(EdStats$CountryCode)
## 
## ABW ADO AFG AGO ALB ARE ARG ARM ASM ATG AUS AUT AZE BDI BEL BEN BFA BGD 
##   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
## BGR BHR BHS BIH BLR BLZ BMU BOL BRA BRB BRN BTN BWA CAF CAN CHE CHI CHL 
##   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
## CHN CIV CMR COG COL COM CPV CRI CUB CYM CYP CZE DEU DJI DMA DNK DOM DZA 
##   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
## EAP EAS ECA ECS ECU EGY EMU ERI ESP EST ETH FIN FJI FRA FRO FSM GAB GBR 
##   1   1   1   1   0   0   1   0   0   0   0   0   0   0   0   0   0   0 
## GEO GHA GIN GMB GNB GNQ GRC GRD GRL GTM GUM GUY HIC HKG HND HPC HRV HTI 
##   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   1   0   0 
## HUN IDN IMY IND IRL IRN IRQ ISL ISR ITA JAM JOR JPN KAZ KEN KGZ KHM KIR 
##   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
## KNA KOR KSV KWT LAC LAO LBN LBR LBY LCA LCN LDC LIC LIE LKA LMC LMY LSO 
##   0   0   0   0   1   0   0   0   0   0   1   1   1   0   0   1   1   0 
## LTU LUX LVA MAC MAR MCO MDA MDG MDV MEA MEX MHL MIC MKD MLI MLT MMR MNA 
##   0   0   0   0   0   0   0   0   0   1   0   0   1   0   0   0   0   1 
## MNE MNG MNP MOZ MRT MUS MWI MYS NAC NAM NCL NER NGA NIC NLD NOC NOR NPL 
##   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   1   0   0 
## NZL OEC OMN PAK PAN PER PHL PLW PNG POL PRI PRK PRT PRY PYF QAT ROM RUS 
##   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
## RWA SAS SAU SDN SEN SGP SLB SLE SLV SMR SOM SRB SSA SSF STP SUR SVK SVN 
##   0   1   0   0   0   0   0   0   0   0   0   0   1   1   0   0   0   0 
## SWE SWZ SYC SYR TCA TCD TGO THA TJK TKM TMP TON TTO TUN TUR TUV TZA UGA 
##   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
## UKR UMC URY USA UZB VCT VEN VIR VNM VUT WBG WLD WSM YEM ZAF ZAR ZMB ZWE 
##   0   1   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0
```
