### Question 1

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

* Code book: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

```{r}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
houses <- fread(fileURL)

houses[VAL == 24, length(RT)]

or

houses[VAL == 24, .N]
```


### Question 3

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

```{r}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = fileUrl, destfile = "./data/gas.xlsx", method = "curl")
dat <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = c(18:23), colIndex = c(7:15))
```


### Question 4

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

```{r}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(url = fileUrl, destfile = "./data/restaurants.xml", method = "curl")
doc <- xmlTreeParse("./data/restaurants.xml", useInternalNodes = TRUE)
zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zips == 21231)
```
