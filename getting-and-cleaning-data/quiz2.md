### Question 1

```{r}
url = "https://api.github.com/users/jtleek/repos"
oauth_endpoints("github")
myapp <- oauth_app("github", key="app_key", secret = "app_secret")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET(""https://api.github.com/users/jtleek/repos", gtoken)
json1 <- content(req)
json2 = jsonlite::fromJSON(jsonlite::toJSON(json1))
json2[json2$name=="datasharing",]$created_at
```


### Question 2

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "./data/acs.csv")
acs <- read.csv("./data/acs.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")
```


### Question 4

* URL: http://biostat.jhsph.edu/~jleek/contact.html

```{r}
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
html <- readLines(con)
sapply(html[c(10,20, 30, 100)], nchar)
close(con)
```

### Question 4

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", destfile = "./data/fixedwidth.for")
fwf <- read.fwf("data/fixedwidth.for", skip=4, widths = c(12,7,4,9,4,9,4,9,4))
sum(fwf$V4)
```
