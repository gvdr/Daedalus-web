library('xml2')
library('dplyr')
library('rvest')
 

number_articles <- function(phrase_key,year = FALSE){
  library('xml2')
  library('dplyr')
  library('rvest')
  library('stringr')
  
 if(year) {
  phrase_key %>%
    str_replace_all(" ","+") %>%
    str_c("%22",.,"%22") %>%
    paste0("https://scholar.google.ca/scholar?q=",.,"&as_ylo=",year,"&as_yhi=",year) %>%
    read_html() %>%
    html_nodes("#gs_ab_md") %>%
    html_text() %>%
    str_extract("[:digit:]+,?[:digit:]+") %>%
    str_replace(",","") %>%
    as.numeric()
  } else {
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
}
