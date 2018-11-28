
#' create_graphs simulate three realization of small-world
#' networks.
#' The `regular_graph` is not really a small-world network, due
#' to the lack of long distance connections. It is a regular lattice
#' of size `nodes` in dimension `dim_n`, where each node is connected
#' to its neighbors of order `order`.
#' The disordered graph is obtained by rewiring links with certainty
#' (p := 1).
#' The complex graph, the graph we name complex, is obtained
#' by setting the rewiring probability through `p_rewire` (the suggestion
#' is to keep `p_rewire` low so that the expected number of rewired edges is
#' a small fraction of the total number of edges in the graph).
create_graphs <- function(nodes = 3, order = 1,
          p_complex = 0.5, dim_n = 2,
          seed = 1){
  
  library(tidygraph)

  set.seed(seed)
  
  regular_graph <- play_smallworld(n_dim = dim_n, dim_size = nodes,
                                   order = order, p_rewire = 0,
                                   loops = FALSE, multiple = FALSE)
  disordered_graph <- play_smallworld(n_dim = dim_n, dim_size = nodes,
                                      order = neighbors, p_rewire = 0.99,
                                      loops = TRUE, multiple = FALSE)
  complex_graph <- play_smallworld(n_dim = dim_n, dim_size = nodes,
                                   order = neighbors, p_rewire = p_complex,
                                   loops = TRUE, multiple = FALSE)
  
  return(list(reg = regular_graph,
              dis = disordered_graph,
              cpl = complex_graph))

}

#' An ancillary function to plot the graphs
#' given a layout.
#' Change its inner guts to modify the appearance of the
#' plots
plot_graph <- function(graph_to_plot,
                       layout_for_graph){
  
  library(ggraph)
  
  ggraph(graph_to_plot, "manual",
         node.position = layout_for_graph) +
    geom_node_point() +
    geom_edge_diagonal() +
    theme_graph() %>%
    return()
  
} 

#' The function `plotter` takes care of plotting the list
#' of three graphs produced by `create_graphs`. In particular,
#' it creates a layout based on the regular graph and applies
#' it to other graphs so keep the visualization consistent.
plotter <- function(graphs, lay = "grid"){
  library(purrr)
  library(ggraph)
  library(patchwork)
  
  layout_graph <- create_layout(graphs$reg, lay, circular = TRUE)
  
  graph_list <- map(graphs,plot_graph,layout_graph)
  
  plotti <- graph_list$reg + graph_list$cpl + graph_list$dis
  
  return(plotti)
}


#' example run:
create_graphs(dim_n = 1, nodes = 20,
              order = 2, seed = 1,
              p_complex = 0.2) %>%
  plotter(lay = "linear")