
rmarkdown::render_site()

rmarkdown::clean_site()

install.packages('excelR')



```{r echo = FALSE, results = 'asis', warning = FALSE}
library(excelR)

data = data.frame( Country = c('India', 'India', 'US','US'), 
                   City = c('Bangalore', 'Mumbai', 'NY', 'SA'),
                   A = c('Bangalore', 'Mumbai', 'NY', 'SA'),
                   B = c('Bangalore', 'Mumbai', 'NY', 'SA'),
                   C = c('Bangalore', 'Mumbai', 'NY', 'SA'),
                   D = c('Bangalore', 'Mumbai', 'NY', 'SA'),
                   E = c('Bangalore', 'Mumbai', 'NY', 'SA'))

columns = data.frame(title = c('प्रान्त', 'कुल संख्या', 'अाज थप', 'मृत्यु', 'अाज मृ्त्यु',
                               'निको', 'जटिल'),
                     width = c(300, 300, 300, 300, 300, 300, 300),
                     type = c('text', 'text', 'text', 'text', 'text', 'text', 
                              'text'),
                     source=I(list(0,c('Bangalore', 'Mumbai', 'NY', 
                                       'SA','Delhi','Washington'))))
excelTable(data=data, columns = columns)
```

url <- "https://ncov2019.live/data"
local <- file.path("data", "demodata.data")
download.file(url, local)
my.data <- read.table(local, sep=",")
str(my.data)


library(readxl)
data <- read_excel("data.xlsx")
View(data)

