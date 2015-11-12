### Question 1

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

* Code book: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

```{r}
agricultureLogical <- houses$ACR == 3 & houses$AGS == 6
head(which(agricultureLogical), 3)
```


### Question 2

* File: https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

```{r}
img <- readJPEG("data/getdata-jeff.jpg", native = TRUE)
quantile(img, probs = c(0.3, 0.8))
```


### Question 3

* GDP Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
* Education Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

```{r}
gdp <- fread("data/gdp.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
education <- fread("data/education.csv")

//3.1
length(intersect(gdp$CountryCode, education$CountryCode))
//or
table(gdp$CountryCode %in% education$CountryCode)
//or
merged <- merge(gdp, education, by="CountryCode")
nrow(merged)

//3.2
arrange(merged, desc(Rank))[13, Economy]
```

### Question 4

```{r}
tapply(merged$Rank, merged$`Income Group`, mean)
```

### Question 5

```{r}
merged$RankGroups <- cut2(merged$Rank, g=5)
table(merged$RankGroups, merged$`Income Group`)
```
