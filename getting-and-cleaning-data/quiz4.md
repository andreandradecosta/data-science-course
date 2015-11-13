### Question 1

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

* Code book: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

```{r}
strsplit(names(houses), "wgtp")[123]
```


### Question 2

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv


```{r}
gdp <- fread("data/gdp.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
mean(as.numeric(gsub(",", "", gdp$Total)))
```


### Question 3

```{r}
grep("^United", gdp$Economy)
```

### Question 4

```{r}
gdp <- fread("data/gdp.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
education <- fread("data/education.csv")
merged <- merge(gdp, education, by="CountryCode")

length(merged[grepl("[Ff]iscal(.*)[Jj]une", merged$`Special Notes`),]$`Special Notes`)
```

### Question 5

```{r}
dates <- ymd(sampleTimes)
table(year(dates) == 2012)
table(year(dates) == 2012 & wday(dates) == 2)
```
