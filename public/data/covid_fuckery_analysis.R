## LOAD OUR WORLD IN DATA'S UPDATED COVID SPREADSHEET [19 MAY 2020]
owidCovid = read.csv("public//data//owid-covid-data.csv")


## VERIFYING LOADING OF DATASET
# View(owidCovid)
# names(owidCovid)


## CREATE SOME COUNTRY SUBSETS
chinaCovid <- subset(owidCovid, owidCovid$location == "China")
italyCovid <- subset(owidCovid, owidCovid$location == "Italy")
japanCovid <- subset(owidCovid, owidCovid$location == "Japan")
southKoreaCovid <- subset(owidCovid, owidCovid$location == "South Korea")
taiwanCovid <- subset(owidCovid, owidCovid$location == "Taiwan")
unitedKingdomCovid <- subset(owidCovid, owidCovid$location == "United Kingdom")
unitedStatesCovid <- subset(owidCovid, owidCovid$location == "United States")


## FORMAT DATES FOR DIFFERENT COUNTRIES
chinaReportPeriod <- as.Date(chinaCovid$date)
italyReportPeriod <- as.Date(italyCovid$date)
japanReportPeriod <- as.Date(japanCovid$date)
skReportPeriod <- as.Date(southKoreaCovid$date)
taiwanReportPeriod <- as.Date(taiwanCovid$date)
ukReportPeriod <- as.Date(unitedKingdomCovid$date)
usReportPeriod <- as.Date(unitedStatesCovid$date)

## NEW DEATHS/MILLION VS TOTAL DEATHS/MILLION
plot(x = chinaCovid$total_deaths_per_million,
     y = chinaCovid$new_cases_per_million,
     main = paste("China Daily New vs Total Deaths Per Million from", min(chinaReportPeriod), "to", max(chinaReportPeriod)),
     xlab = "China Total Deaths Per Million",
     ylab = "China New Deaths Per Million",
     type = "l")

plot(x = unitedStatesCovid$total_deaths_per_million,
     y = unitedStatesCovid$new_cases_per_million,
     main = paste("US Daily New vs Total Deaths Per Million from", min(usReportPeriod), "to", max(usReportPeriod)),
     xlab = "US Total Deaths Per Million",
     ylab = "US New Deaths Per Million",
     type = "l")


## NEW CASES OVER COURSE OF REPORTING
plot(x = usReportPeriod,
     y = unitedStatesCovid$new_cases,
     main = paste("US Daily New Cases from ", min(usReportPeriod), " to ", max(usReportPeriod)),
     xlab = "Date",
     ylab = "US Daily New Cases",
     type = "l")

plot(x = usReportPeriod,
     y = unitedStatesCovid$new_cases,
     main = paste("US Daily New Cases from ", min(usReportPeriod), " to ", max(usReportPeriod)),
     xlab = "Date",
     ylab = "US Daily New Cases",
     type = "l")


## TOTAL CASES OVER COURSE OF REPORTING
plot(x = chinaReportPeriod,
     y = chinaCovid$total_cases,
     main = paste("China Daily Total Cases from", min(chinaReportPeriod), "to", max(chinaReportPeriod)),
     xlab = "Month",
     ylab = "China Total Cases",
     type = "l")

plot(x = usReportPeriod,
     y = unitedStatesCovid$total_cases,
     main = paste("US Daily Total Cases from", min(usReportPeriod), "to", max(usReportPeriod)),
     xlab = "Month",
     ylab = "US Total Cases",
     type = "l")


## COMPARING TESTS PER THOUSAND PEOPLE
plot(x = usReportPeriod,
     y = unitedStatesCovid$total_tests_per_thousand,
     main = "Daily Total Tests per Thousand People",
     sub = "China, Italy, Japan, South Korea, Taiwan, UK, and US",
     xlab = "Month",
     ylab = "Total Tests per Thousand People",
     type = "l")

lines(chinaReportPeriod, chinaCovid$total_tests_per_thousand, col = "dark red")
lines(italyReportPeriod, italyCovid$total_tests_per_thousand, col = "dark green")
lines(japanReportPeriod, japanCovid$total_tests_per_thousand, col = "red")
lines(skReportPeriod, southKoreaCovid$total_tests_per_thousand, col="navy blue")
lines(taiwanReportPeriod, taiwanCovid$total_tests_per_thousand, col="green")
lines(ukReportPeriod, unitedKingdomCovid$total_tests_per_thousand, col="orange")

legend("topleft", "(x,y)",legend=c("CH","IT","JP", "SK", "TW", "UK", "US"),
       col=c("dark red","dark green","red", "navy blue", "green", "orange", "black"),
       lty=1, ncol=1)
