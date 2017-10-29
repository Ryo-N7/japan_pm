library(rvest)
library(stringr)
library(dplyr)



url <- "https://en.wikipedia.org/wiki/List_of_Prime_Ministers_of_Japan"

PMs <- url %>% 
  read_html() %>% 
  html_table(fill = TRUE)

# just use first row as header instead!!!!

showa <- PMs %>% .[[4]] 
heisei <- PMs %>% .[[5]] %>% as_tibble()

showa_df <- showa %>% as.data.frame()
showa_df %>% names()
names(showa_df) <- showa_df %>% names() %>% make.names()
showa_df %>% names()

colnames(showa_df) <- showa_df %>% colnames() %>% make.unique()
names(showa_df)
colnames(showa_df)

showa_df <- showa_df %>% select(-X.U.2116., -Political.Party, -Elected, -Elected.1, -Ref)
colnames(showa_df)
