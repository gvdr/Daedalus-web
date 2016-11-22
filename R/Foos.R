##function to convert a graphNEL object to an igraph
##g: The graphNEL object to be converted
##keep.weights: a flag to indicate whether weights should be considered when performing the conversion (DEFAULT= FALSE)
.G2IG <- function(g, keep.weights=FALSE){
  library(QuACN)
  if(any(unlist(edgeWeights(g))>1) & keep.weights)
    warning("When using this conversion the edge weight information will be ignored")
  ig <- igraph::igraph.from.graphNEL(g, weight = keep.weights)
  return(ig)
}

##helper function to check whether a graph is unweighted and undirected
##this mode is currently the only one supported by QuACN
.validateGraph <- function(g){
  library(QuACN)
  return(!edgemode(g)=="directed" & !any(unlist(edgeWeights(g))>1))
}


#' converts an Igraph directed graphs, such as the one in the foodwebs
#' data set in Igraphdata, to a graphNEL object
#' dropping the weight information and making it undirected
directed_to_graphNEL <- function(Igraph){
  library(igraph)
  graphnel <- as.undirected(Igraph) # make the Igraph undirected
  igraph::E(graphnel)$weight <- 1 # all the weights are 1
  igraph::as_graphnel(graphnel) # transforms to graphNEL
}

#' converts an Igraph undirected graphs, such as the one in the foodwebs
#' data set in Igraphdata, to a graphNEL object
#' dropping the weight information
undirected_to_graphNEL <- function(Igraph){
  library(igraph)
  graphnel <- Igraph # copies it so not to mess around
  igraph::E(graphnel)$weight <- 1 # all the weights are 1
  igraph::as_graphnel(graphnel) # transforms to graphNEL
}

#' computes the topologicalInfoContent and return the entropy value
#' we use it to sample at random a complexity function
topologicalInfoContent_entropy <- function(x) {
  library("QuACN")
  topologicalInfoContent(x)$entropy
}

#' computes the infoTheoreticGCM and return the entropy valu
#' we use it to sample at random a complexity function
infoTheoreticGCM_entropy <- function(x) {
  library("QuACN")
  infoTheoreticGCM(x)$entropy 
}

compl_list <- list(wiener,balabanJ,
                   harary,randic,graphVertexComplexity,
                   balabanlike2,balabanlike1,vertexDegree,
                   radialCentric,bonchev2,bonchev1,
                   bertz,complexityIndexB,normalizedEdgeComplexity,
                   zagreb2,zagreb1,totalAdjacency,
                   hyperDistancePathIndex,productOfRowSums,compactness,
                   meanDistanceDeviation,topologicalInfoContent_entropy,infoTheoreticGCM_entropy)

#' returns at random a complexity function from the ones
#' provided by QuACN
#' all the functions return a scalar and accept a graphNEL as input
random_complexity_foo <- function(compl_foo_list) {
  library("QuACN")
  
  compl_foo <- compl_list[[sample(length(compl_foo_list),size=1)]]
  
  return(compl_foo)
}

#' randomize and observed graph preserving
#' Number of Nodes
#' Number of Edges
#' after having simplified and undirected it.
g_NE_r <- function(org_graph) {
  org_graph
}