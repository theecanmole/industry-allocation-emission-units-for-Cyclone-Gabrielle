# https://www.climatecommission.govt.nz/our-work/advice-to-government-topic/nz-ets/our-advice-on-the-nz-ets/nz-ets-unit-limits-and-price-control-settings-for-2023-2027/full-report/ has figure and table on page 36
# Cabinet Minute of Decision New Zealand Emissions Trading Scheme: 2022 Update to Limits and Price Control Settings for Units
# https://environment.govt.nz/assets/publications/cab-22-min-0533-minute.pdf
# Cabinet paper https://consult.environment.govt.nz/climate/nz-ets-limit-and-price-settings-2022/ & https://environment.govt.nz/news/government-announces-updated-nz-ets-auction-settings/
# Climate Change (Auctions, Limits, and Price Controls for Units) Regulations 2020 (LI 2020/264), Version as at 1 January 2023, Schedule 3 Limits and price control settings https://legislation.govt.nz/regulation/public/2020/0264/latest/LMS376569.html 

# Total emission budget (annual) from CCC advice
emissions <-c(73.6,72.1,69.8,66.5,63.9)  
# emissions budget volume allocated to sectors not in ETS; from CCC advice
sectorsnotinNZETS <-c(41.3, 41.0, 41.0, 40.3, 40.2)
# equals overall limit see Schedule 3 & https://consult.environment.govt.nz/climate/nz-ets-limit-and-price-settings-2022/	"The overall limit includes the units available by auction, approved overseas units, and forecast industrial free allocation."
limit           <-c(32.3,31.1,28.8,26.2,23.7)   # same as Schedule 3  
availableunits  <-c(25.9,24.8,22.5,20.0,17.6)   # same as Schedule 3 
# calculate allocation as limit - availableunits 		
allocation <-  limit - availableunits
# enter auction volumes, same as in Cabinet paper https://consult.environment.govt.nz/climate/nz-ets-limit-and-price-settings-2022/ & https://environment.govt.nz/news/government-announces-updated-nz-ets-auction-settings/ # but not in Schedule 3
auction    <-c(17.9, 17.1, 15.3, 13.5, 11.7)  
# enter stockpile reduction amounts
stockpile  <- c( 8, 7.7, 7.2, 6.5, 5.9) # = https://environment.govt.nz/news/government-announces-updated-nz-ets-auction-settings/

# create dataframe
emissionsbudget <-as.data.frame(cbind(emissions,sectorsnotinNZETS,limit,availableunits, allocation,stockpile,auction),row.names = NULL)
View(emissionsbudget)
str(emissionsbudget)
'data.frame':	5 obs. of  7 variables:
 $ emissions        : num  73.6 72.1 69.8 66.5 63.9
 $ sectorsnotinNZETS: num  41.3 41 41 40.3 40.2
 $ limit            : num  32.3 31.1 28.8 26.2 23.7
 $ availableunits   : num  25.9 24.8 22.5 20 17.6
 $ allocation       : num  6.4 6.3 6.3 6.2 6.1
 $ stockpile        : num  8 7.7 7.2 6.5 5.9
 $ auction          : num  17.9 17.1 15.3 13.5 11.7 
 
emissionsbudget
  emissions sectorsnotinNZETS limit availableunits allocation stockpile auction
1      73.6              41.3  32.3           25.9        6.4       8.0    17.9
2      72.1              41.0  31.1           24.8        6.3       7.7    17.1
3      69.8              41.0  28.8           22.5        6.3       7.2    15.3
4      66.5              40.3  26.2           20.0        6.2       6.5    13.5
5      63.9              40.2  23.7           17.6        6.1       5.9    11.7 

# save data as .csv file
write.table(emissionsbudget, file = "emissionbudget.csv", sep = ",", col.names = TRUE, qmethod = "double",row.names = FALSE)


Helpful suggestion for funding recovery from Cyclone Gabrielle

Via Email g.robertson@ministers.govt.nz

Tena koe Minister Robertson,

The Dominion Post is reporting that you have said that billions of dollars will be needed for the recovery from Cyclone Gabrielle. I dont think anyone reasonable is disagreeing with you about the scale of the challenge helping impacted communities.
 
I have a suggestion to help provide funds without either new taxes or new borrowing or by reducing funding of important existing programmes.

The Ministry for the Environment and the Climate Change Commission both expect that in calendar year 2023, 6.4 million emissions units will be allocated at no cost to industries. At Tuesday's spot price (https://www.carbonnews.co.nz/story.asp?storyID=27088) $67.50, these units would be valued at $432 million. My suggestion is to quickly amend the Climate Change Response Act 2002 (or it's related regulations) and add the industrial allocation units to the quarterly auctions of emission units and commit the proceeds to recovery from Cyclone Gabrielle.
As the amount of forecast allocation units is over 6 million units through to 2027, there is an ongoing stream of about 400 to 500 million dollars (depending on unit prices) available for another 5 years.
What could be a better source of funding for recovery from a climate crisis event than diverting funding from emitter industries?

Naku noa, na
Simon Johnson

# https://environment.govt.nz/what-government-is-doing/areas-of-work/climate-change/ets/nz-ets-market/setting-unit-limits-in-the-nz-ets
# 2022 budgetted free allocation =  8.4 million

Findings on free allocation volumes 2023:2027

Industrial allocation forecast 2023 to 2027, 6.4 6.3 6.3 6.2 6.1 = 31.30

allocation
[1] 6.4 6.3 6.3 6.2 6.1
sum(allocation) 
[1] 31.3

length(allocation) 
[1] 5 

# create a matrix that is estimated industrial allocation of emission units
allocationmat <- matrix(c(allocation), nrow = 1, ncol=5, byrow=TRUE, dimnames = list(c("NZUs"),c("2023","2024","2025","2026","2027")))
allocationmat 
    2023 2024 2025 2026 2027
NZUs  6.4  6.3  6.3  6.2  6.1 

# barplot chart of industrial allocation of emission units
#svg(filename ="Industrial-Allocation-barplot-2023-2027-720-540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white")
png("Industrial-Allocation-barplot-2023-2027-560by420.png", bg="white", width=560, height=420,pointsize = 12)
par(mar=c(4, 4, 4, 1)+0.1)
barplot(allocationmat, ylim=c(0,6.7),las=1,space=c(0.1,1.1), beside = TRUE, col=c("#1B9E77"))  
title(cex.main=1.5,main=expression(paste("Emission units allocated to industry 2023 to 2027")),ylab="emission units (millions)")
mtext(side=1,line=2.5,cex=0.8,expression(paste("Climate Change Commission July 2022 Advice on NZ ETS unit limits and price control settings for 2023-2027")))
mtext(side=3,line=0,cex=1,expression(paste("From 2023 to 2027, industries will be subsidised with 31 million free emission units")))
dev.off()

# create a matrix that is estimated prices of NZ emission units
# spot price Tuesday 28 Feb 2023 (https://www.carbonnews.co.nz/story.asp?storyID=27088) $67.50
# use future Cost control reserve trigger price for 2023 to 2027
# https://environment.govt.nz/what-government-is-doing/areas-of-work/climate-change/ets/nz-ets-market/annual-updates-to-emission-unit-limits-and-price-control-settings/#updates-to-nz-ets-price-control-settings
triggerprice <-c(80.64,91.61,103.24,115.84, 129.97)
length(triggerprice) 
[1] 5

# create a matrix of prices
pricesmat <- matrix(c(triggerprice), nrow = 1, ncol=5, byrow=TRUE, dimnames = list(c("Prices"),c("2023","2024","2025","2026","2027")))
pricesmat 
        2023  2024   2025   2026   2027
Prices 80.64 91.61 103.24 115.84 129.97

# barplot chart of future market value of emission units
#svg(filename ="Unit-prices-barplot-2023-2027-720-540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white")
png("Unit-prices-barplot-2023-2027-560by420.png", bg="white", width=560, height=420,pointsize = 12)
par(mar=c(4, 4, 4, 1)+0.1)
barplot(pricesmat, las=1,space=c(0.1,1.1), beside = TRUE, col=c("#66A61E"))  
title(cex.main=1.5,main=expression(paste("Possible emission unit prices 2023 to 2027")),ylab="NZ Dollars per unit")
mtext(side=1,line=2.5,cex=0.8,expression(paste("Schedule 3 Climate Change (Auctions Limits and Price Controls for Units) Regulations 2020")))
mtext(side=3,line=0,cex=1,expression(paste("Prices may follow the auction cost containment reserve price to $130 tonne")))
dev.off()

# calculate market value of free emission units 
unitvalue <- allocation * triggerprice 
unitvalue 
[1] 516.096 577.143 650.412 718.208 792.817
sum(unitvalue)
[1] 3254.676

# create a matrix of prices
valuesmat <- matrix(c(unitvalue), nrow = 1, ncol=5, byrow=TRUE, dimnames = list(c("Value"),c("2023","2024","2025","2026","2027")))
valuesmat 
        2023    2024    2025    2026    2027
Value 516.096 577.143 650.412 718.208 792.817


# barplot chart of future market value of emission units
svg(filename ="Unit-values-barplot-2023-2027-720-540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white")
#png("Unit-values-barplot-2023-2027-560by420.png", bg="white", width=560, height=420,pointsize = 12)
par(mar=c(4, 4, 4, 1)+0.1)
barplot(valuesmat, ylim=c(0,820), las=1,space=c(0.1,1.1), beside = TRUE, col=c("#E6AB02"))  
title(cex.main=1.5,main=expression(paste("Market value of free industry emission units 2023 to 2027")),ylab="million NZ Dollars")
mtext(side=1,line=3.0,cex=0.8,expression(paste("Climate Change Commission July 2022 Advice on NZ ETS unit limits and price control settings for 2023-2027\nSchedule 3 Climate Change (Auctions Limits and Price Controls for Units) Regulations 2020")))
mtext(side=3,line=0,cex=1,expression(paste("By 2027 the industrial allocation subsidy may have a value of $3.2 billion")))
dev.off()
