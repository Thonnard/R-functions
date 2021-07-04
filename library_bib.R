### David Thonnard  
### 04/07/2021

### Script to convert excel book library to bibtex


# libraries
library(bib2df)
library(readxl)
library(stringr)
library(dplyr)
library(ggplot2)
library(tidyr)

# get data
data <- readxl::read_xls(choose.files(multi = FALSE))

# rename column
colnames(data)[which(names(data) == "Authors")] <- "author"
colnames(data)[which(names(data) == "Categories")] <- "Category"
colnames(data)[which(names(data) == "Published date")] <- "year"
colnames(data)[which(names(data) == "Title")] <- "title"
colnames(data)[which(names(data) == "Pages")] <- "pages"
colnames(data)[which(names(data) == "Publisher")] <- "publisher"

# extract year
data$year <- ifelse(is.na(format(as.Date(data$year, format="%d/%m/%Y"),"%Y")), data$year,format(as.Date(data$year, format="%d/%m/%Y"),"%Y"))

# create extra columns
data$Bibtexkey <- paste(word(data$title,1), word(data$author,1), sep = "_")

# update category
data$Category <- "Book"

# select columns
data <- data %>% select(title, author, Category, pages, ISBN, Bibtexkey, year, publisher) 

# write bibtex
df2bib(data, file = "books_library.bib")

# plot
data %>% 
  select(year, author) %>% 
  unnest() %>% 
  ggplot() + 
  aes(x = year, y = reorder(author, desc(year))) + 
  geom_point()

# references
# https://cran.r-project.org/web/packages/bib2df/vignettes/bib2df.html


