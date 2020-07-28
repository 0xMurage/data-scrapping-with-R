# install.packages('selectr')
# install.packages('xml2')
# install.packages('rvest')
library(xml2)
library(rvest)
library(stringr)


url <- 'http://wdi.worldbank.org/table/2.14'  #you can replace this url with any other pages with the table..it will just work

tableIdentifier <- '.indicators-table#scrollTable'

countries <- c('Malaysia', 'Indonesia', 'Cambodia', 'Singapore', 'Vietnam')

# SCRAP THE TABLE DATA FIRST

page <- read_html(url)  #retrieve the whole page

# extract the full table {parse the html and return as data frame}
table <- html_nodes(page, paste0('table', tableIdentifier)) %>% html_table(fill = TRUE, trim = TRUE, header = NA)

output <- table[[1]]

# Subset the data i.e extract only the countries we need (provided above in countries vector)
data <- subset(output, output$X1 %in% countries)

print(data) # this will just print the data

# Draw the map

