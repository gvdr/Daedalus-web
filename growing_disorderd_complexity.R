#' create_array_graphs samples an array of small-world
#' networks with rewiring probabilities spanning the interval between 0 and 1.
create_array_graphs <- function(nodes = 20,
                                order = 2,
                                dim_n = 1,
                                step = 0.2,
                                min_p = 0,
                                max_p = 1,
                                n_examples = 100,
                                seed = 1){
  
  library(tidygraph)
  library(purrr)
  library(tibble)
  
  set.seed(seed)
  
  range_p <- seq(min_p,max_p,step)
  
  sample_smallworlds <- function(p){
    graphs <- rerun(n_examples,play_smallworld(p_rewire = p, n_dim = dim_n, dim_size = nodes, order = order, loops = TRUE, multiple = TRUE))
    df <- data_frame(p_rewire = p,
                     graphs = graphs)
    return(df)
  }
  
  array_graphs <- map_df(range_p,sample_smallworlds)
  
  
  return(array_graphs)
  
}

library(tidyverse)
library(ggthemes)

array_test <- create_array_graphs(step = 0.02, n_examples = 1000)
array_test_lowerp <- create_array_graphs(step = 0.005, n_examples = 1000, min_p = 0, max_p = 0.25)

array_test <- array_test %>%
  mutate(medium_articulation = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% mediumArticulation),
         efficiency = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% efficiency),
         C_1eSpec = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% C_1eSpec),
         C_1eST = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% C_1eST),
         STS = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% STS),
         STSD = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% STSD))

#array_complex_test %>% ggplot(aes(x = p_rewire, group = p_rewire, y = C_1eST)) + geom_boxplot()

#' focussing on the lower p valus

array_test_lowerp <- array_test_lowerp %>%
  mutate(medium_articulation = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% mediumArticulation),
         efficiency = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% efficiency),
         C_1eSpec = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% C_1eSpec),
         C_1eST = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% C_1eST),
         STS = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% STS),
         STSD = map_dbl(graphs, ~ .x %>% directed_to_graphNEL %>% STSD))

source("R/has_groups.R")
#array_complex_test_lowerp %>% ggplot(aes(x = p_rewire, group = p_rewire, y = STSD)) + geom_boxplot()

lowp <- array_test_lowerp %>%
  filter(STS > 0) %>%
  ggplot(aes(x = p_rewire, group = p_rewire, y = STSD)) +
  geom_tufteboxplot() +
  theme_minimal()

p <- array_test %>%
  filter(STS > 0) %>%
  ggplot(aes(x = p_rewire, group = p_rewire, y = STSD)) +
  geom_tufteboxplot() +
  theme_minimal()

readr::write_rds(array_test,"Data/complexity_disorder.df", compress = "gz")
readr::write_rds(array_test_lowerp,"Data/complexity_disorder_lowerp.df", compress = "gz")


p +
  labs(x = "disorder",
       y = "complexity",
    title = "Complexity is greatest between regularity and disorder",
       caption = "STSD complexity as a function of rewiring probability in lattice graphs")

ggsave("Plots/complexity_disorder")

lowp +
  labs(x = "disorder",
       y = "complexity")
