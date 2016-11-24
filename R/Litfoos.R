library('xml2')
library('dplyr')
library('rvest')
 

number_articles <- function(phrase_key){
  library('xml2')
  library('dplyr')
  library('rvest')
  library('stringr')
  
  phrase_key %>%
    str_replace_all(" ","+") %>%
    str_c("%22",.,"%22") %>%
    paste0("https://scholar.google.ca/scholar?q=",.) %>%
    read_html() %>%
    html_nodes("#gs_ab_md") %>%
    html_text() %>%
    str_extract("[:digit:]+,?[:digit:]+") %>%
    str_replace(",","") %>%
    as.numeric()
}