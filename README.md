---
title: "Food Webs: it's not easy with this complexity."
author: "All of contributors"
date: "16 November 2016"
output:
  html_document:
    toc: true
    toc_float: true
    keep_md: yes

bibliography: complexity_biblio.bib
---


> If no one ask of me, I know; if I wish to explain to him who asks, I know not.
> Saint Augustin, _Confessions_, Book 11

# Are Food Webs complex?

Ecologists have been wondering about the complexity of food webs and seem to agree: 251 articles available in Google Scholar claims that "food webs are complex", and an additional 6500 mention "complex food webs" (in comparison, only 52 articles mention them as being "simple" and 1220 find "simple food webs" --- and commonly _relative_ to more complex food webs [@jonsdottir2005terrestrial]). The notion underlying the common claim stems from recognising that ecosystems, described in terms of ecological networks, are the outcome of evolutionary and ecologic processes --- not merely _random_ structures. Thus, we nurture an _expectation_ for them to be significantly more _complex_ of what expected under some _null model_. As a corollary, we may _expect_ ecological networks' complexity to be higher in system that are the outcome of more complicated, long, or intense, evolutionary and ecologic processes.

However, the popularity of the term "complexity" has not been supported by a rigorous analysis of its meaning in food web ecology. In fact, it is hard to find any discussion of what it _means_ to be complex in the papers mentioning complexity. Whenever a certain metric is used to indicate complexity, the choice is rarely explained: how does that particular metric measures complexity? Is the metric a direct measurement or an indirect proxy for complexity? And, if it is a proxy, is it always _good_ proxy or only within some conditions?

Because of this vague and implicit definition, _complexity_ has been used as an umbrella to refer to many different, sometime conflicting, concepts. So, we find system that are said _complex_ because **numerous** (they are made of many parts: many species, many interactions, ... ), because they have a **disordered** structure (they do not exhibit apparent regularities or repeated patterns), because they exhibit **chaotic** behaviours (it is hard or impossible to predict their status in a far enough future). In fact, many ways of quantifying complexity, and of comparing the complexity of observed ecosystems, are measures of either numerousity, disorder, or chaotic behaviour. Yet, numerousity, disoder, and chaotic behaviour are not in general equivalent to the other; nor their equivalence has been explicitly shown for ecological systems. More, none of the three concept taken in isolation is sufficient to distinguish a complex system from a simple system. However, numerousity, disorder, chaotic behaviour and other characteristics, all concur to determine a complex system. Without a better understanding of what copmlexity is and of how we can measure it, we risk to offer biased comparisons and to mistake significant and non significant complexities.

With this in mind, we review and systematise some of the various heuristical conceptualizations of ecosystem complexity, focussing in particular on ecosystem represented as trophic interaction networks (e.g., predator--prey or consumer--resource food webs). Moreover, we introduce definitions of graph complexity in the ecological scenario, presenting both deterministic (Kolmogorov) and probabilistic definitions. We discuss how the heuristic definition may be related to the more rigorous definitions.

To ground the discussion we test whether ecological networks are significantly more complex than random. To do that, we adopt from the graph theory literature a restricted set of graph complexities metrics, which we believe are ecologically meaningful and relevant. Then, we identify proper null model distributions of ecological networks. Finally, we compare the complexity of a large ensemble of observed ecological networks with the complexity of their randomized counterparts.

# Perceiving complexity

## Operational complexity

The complexity of an object depends on our description of it. On the one hand, the neuronal blue print of our brain is extremely intricated; on the other hand, it is just a large but not exceptional amount of protons, neutrons and electrons --- not dissimilarly by a concrete block of roughly the same size ---; and if we had described it just by its size and volume we wouldn't be able to distinguish it from a watermelon.

In exactly the same way, the level of detail with which we describe an ecosystem --- our choice of which elements to include or ignore in the description --- will determine how much complex the ecosystem will look to us. Here we will consider ecosystem as described by ecological interaction networks, i.e., trophic networks or food webs.

The graph representations of food webs are abstractions: they do not exist, as such, in nature; *building* graph representations involves a number of choices. We need to enclose ecosystems within spatial and temporal boundaries (e.g., we may be interested in one morning snapshot of one person's gut microbial community, or in the pollination network of flowering plants in the Po valley during spring); we need to group individual --- or not (the nodes in our graph can represent individuals, species, guilds, OTUs, ...); we need to categorise interactions (predation, commensalism, pollination, ...) and select them (we may observe on one or more of those categories); if we decided to group individuals and/or interactions, we would need to assign them to groups and/or interactions to categories; even before that, we need to observe --- and maybe sample --- individuals and detect interactions (directly or through the study of the relevant literature).

All this tasks add both uncertainty and arbitrarity to the building process. Choices made in one system can be hardly compared to the choices made in a different system. The operational issues encountered depend on system specific factors --- and researchers in a field may fail to recognize the specific issues exhisting in other fields.

This *complications* constitute the first facet of complexity encountered by ecologists when dealing with food webs. In other words, **food webs are complex because they are hard to put together**. We name this **operational complexity** The challenges of managing and analyzing  data generated from genetic/genomic techniques is often at the forefront of what microbial ecologists refer to when they invoke complexity.

However problematic this complications are, they do not *necessarily* translate into the other facets of *complexity* we will discuss in the following paragraph. Food webs that are very hard to study may exhibit (or not) a remarkable simple structure once finally unveiled. Moreover, given that many choices are grounded on a specific knowledge of the systems being studied, they don't seem a sound terrain on which to compare food web complexities across systems: operational complexity is extremely _operator dependent_.

Yet, let's not dismiss operational complexity too hastly. In fact some of its sources and consequences link into two other facets of complexity we will analyse in the next two sessions.

A trophic network can be operational complex because it is constituted by a very large number of elements, interactors and interactions. We refer to this as **numerosity**. A network that can never be quantified obscures our ability to make and test predictions about its future, in other words, it can be largely **unpredictable**.

## Numerosity

A tempting request we can express to any definition of complexity is that, everything else being equal, the complexity of an object should grow if we add more element to the object. That is, our measure of complexity should be a monotonic increasing function of the number of elements of the objects.

This is in line with May's definion of complexity as the **connectance** of a food web --- its link density. It is, indeed, natural to think that food webs involving more species should be more complex; and given a fixed number of species, food webs with more interactions should be more complex.

Notice that connectance (and the similar measure of link density) is blind to the structure of the trophic network. It takes into account _how many_ interactions are there, but not who interacts with who.

## Unpredictability

In López-Ruiz et al., the authors propose to define the complexity of a physical phenomena as "the interplay between the information stored in the system and its disequilibrium". Here, we consider the two components autonomously, discussing the **informational** component of a food web complexity in the **Structure complexity** session, and the **dynamical** component here.

Food webs are not, in general, static. Demographic dynamics are a source of additional complexity. We identify the dynamical complexity of a food web with the complexity of its dynamic attractor.

<!-- We need help from Leo here! -->

## Process complexity

# Structure complexity

All the previous facets of complexity are extremely important for the ecologists, and can be readily interpreted: we can relate to the operational struggle, we can count species, we consider predictability important for many good reasons, we appreciate the complexity of the ecological and evolutionary processes. Yet, operational and process complexity, and unpredictability are difficult to quantify exactly, while it is not clear if counting OTUs in a microbial community is the same activity of counting species in the Serengeti. The previous complexities make comparing different food web complexities hard.

On contrary, complexity metrics based on the shape of the interaction networks themselves are adopted because they seem to be directly comparable between system. Yet, adopting metrics straight graph, electrical network, or social network theories meanse that their interpretation is arguably straightforward. We know how to measure it, but what does it mean? When is the structure of a network _complex_?

## The topology

The information complexity of an observed food web can be summarised as the amount of information needed to specify its structure, that is, the distance between the observed food web and the most likely random food web

<!--- XXX this is to check carefully --->


### Are food webs topologically complex?

The claim that food webs are complex can be expressed as the hypothesis that the informational and dynamical complexity of observed food webs is higher than that of simulated food webs sampled from a relevant null distribution. Therefore, the answer will depend on (1) the structure of the observed food web, (2) the exact definition of complexity adopted, and (3) the null distribution against which the food web complexity is evaluated --- which we define specifying a web randomization algorithm.

So far, the literature about food web complexity operated only through statistical indexes (such as connectance or species richness), assumed as proxies for complexities.

Here, we test wether food webs are significantly complex, across a variety of informational complexities measures and randomization techniques.

#### Data

Let's start with a toy example: food webs from the `igraph` package.


```r
suppressMessages(source("./R/Reqs.R"))
```

We use the food webs contained in the `foodwebs` dataset provided by `Igraphdata`.

> See references for the individual webs above. The data itself was downloaded from [Vlado's website](http://vlado.fmf.uni-lj.si/pub/networks/data/bio/foodweb/foodweb.htm).

To compute the information theoretic indexes we need to transform the _Igraph_ web objects to _graphNEL_ objects. We do it using the ancillary function `directed_to_graphNEL()`.


```r
data(foodwebs)
webs_df <- data_frame(name = map_chr(foodwebs, graph_attr, "name") %>% as_factor(),
                      web = map(foodwebs, directed_to_graphNEL) %>% map(unlist)) %>%
  filter(name != "Rhode River Watershed - Water Budget") %>%
  as.data.frame()
```


#### Methodology

##### Null model comparison

To illustrate the analysis flow without compromising our results with an implicit bias, we work blindfolded using an unnamed complexity metric sampled from the 32 metrics provided by the R library `QuACN`.


```r
set.seed(999)
cpl_foo <- random_complexity_foo(compl_list)
cpl_foo_safe <- possibly(cpl_foo, NA_real_) # the possibly wrapper avoids our flow to break if cpl_foo returns an error for some web
```

Using this unknown function, we compute the complexity of the observed food webs.


```r
webs_df %<>%
  mutate(complexity = web %>% map_dbl(cpl_foo_safe))
```


To test wether the observed food web complexities are significantly higher (or lower), we compare the observed complexity with the complexity of _synthetic_ food webs obtained by randomising the observed webs. Thus, the null model is defined in terms of a randomization algorithm rewiring the observed food webs while preserving some of the web properties.

In this example, we choose to preserve the overall number of species and interactions (i.e., nodes and edges) in each web. Then, we compute the unknown complexity metric for each of the randomised web.


We use the the random complexity values we computed to perform a permanova significance test for the complexity of the observed webs. In general, it will be important to consider whether higher metric values are associated to more or less complexity, but we can not answer this question with an unknown complexity metric.


```r
N_randoms = 1000
webs_df %<>%
  mutate(randoms = web %>% map(g_NE_krNEL,K=N_randoms), # we randomise mainteining Nodes and Edges
         random_complexities = randoms %>% map(~ .x %>% map_dbl(cpl_foo_safe)), # we compute the cpl_foo for each randomization of each food web
         obs_ge_random = map2_dbl(complexity,random_complexities, ~ sum(.x >= unlist(.y)) / N_randoms)) # we compute the frequency of observed complexity greater or equal than randomised ones
```


Finally, we can consider the frequency of randomisazation having greater complexity values than the observed webs (Table 1) or visually look a the random and observed complexity (Figure 1).


```r
webs_df %>%
  select(name, complexity, obs_ge_random) %>%
  knitr::kable(digits= c(3,3),
               caption = "Table 1",
               format.args = list(digits = 4, nsmall = 4))
```



Table: Table 1

name                                               complexity   obs_ge_random
------------------------------------------------  -----------  --------------
Lower Chesapeake Bay in Summer                         0.8810          0.0000
Middle Chesapeake Bay in Summer                        0.9580          0.0000
Upper Chesapeake Bay in Summer                         0.9320          0.0000
Chesapeake Bay Mesohaline Network                      1.0580          0.0000
Crystal River Creek (Control)                          1.1150          0.0000
Crystal River Creek (Delta Temp)                       1.1370          0.0000
Charca de Maspalomas                                   1.2220          0.0000
Lake Michigan Control network                          1.1610          0.8940
Mondego Estuary - Zostrea site                         0.9560          0.0000
Narragansett Bay Model                                 0.9520          0.0000
St. Marks River (Florida) Flow network                 0.8710          0.0000
Florida Bay Trophic Exchange Matrix, dry season        0.9700          1.0000
Florida Bay Trophic Exchange Matrix, wet season        0.9650          1.0000
Cypress Dry Season                                     0.9330          0.0780
Cypress Wet Season                                     0.9340          0.1210
Everglades Graminoids - Dry Season                     0.9780          0.0000
Everglades Graminoids - Wet Season                     0.9770          0.0000
Mangrove Estuary, Dry Season                           0.9010          0.0000
Mangrove Estuary, Wet Season                           0.8990          0.0000



```r
complexities_df <- webs_df%>%
  unnest(random_complexities) %>%
  select(-obs_ge_random) %>%
  gather(key = "type",value = "complexity", -name) %>%
  distinct(name, type, complexity, .keep_all = TRUE)


ggplot() +
  geom_density(aes(x = complexity), data = complexities_df %>% filter(type == "random_complexities")) +
  geom_vline(aes(xintercept = complexity, color = "red"), data = complexities_df %>% filter(type == "complexity")) +
  facet_wrap(~ name ) + #, scales = "free") +
  labs(col = "") +
  scale_color_manual(labels = "= observed", values = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

![](README_files/figure-html/figure_1-1.png)<!-- -->

To say something about the complexity of the observed foodwebs, we would need to reveal the nature of the complexity metric we used --- whether higher values correspond to higher or lower complexity --- and the null model.

##### Randomization algorithms

[ ] Preserving edges and nodes (connectivity)

[ ] Preserving degree sequence (curved ball algo)

[ ] Phylogenetic informed

##### Complexity metric

#### Results

Are empiracally observed food webs significantly more complex, from an information theoretic point of view, than their random counter part?

Is any of the common proxies (such as connectance, the number of species, ...) correlated with the information complexity of the webs?

# Discussion and Conclusions

## Limitations

### Not all interactions are equal

The different relevance of single interactions in the web --- the interaction _weights_ ---  are important for the demographic dynamics and the stability of the webs (e.g., see [Dambacher et al.](http://onlinelibrary.wiley.com/doi/10.1890/0012-9658(2002)083[1372:ROCSIA]2.0.CO;2/full) and the more recent but more technical [Koslicki & Novak](http://biorxiv.org/content/early/2016/10/25/083089)). The measures of structural complexities we tested numerically are blind to edge weights. This possible source of food web complexity is still largely ignored, in part due to the difficulty of gathering the necessary data to establish interaction weights.

## Relevance: why do we care...

### ...about information content?

<!--- Maybe something about Watson and Szathamary and learing in ecosystems --->
