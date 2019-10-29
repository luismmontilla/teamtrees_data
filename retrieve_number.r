library(dplyr)
library(readr)
library(rvest)


trees <- read_html('https://www.teamtrees.org/') %>% 
  html_nodes('#totalTrees') %>% 
  str_match("[0-9]+") %>% 
  as.numeric()

date <- Sys.time()

df <- data.frame(trees, date)

write.table(df, 'data.csv', append = TRUE, sep = ',', 
            row.names = FALSE, col.names = FALSE)