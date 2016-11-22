# The Complexity of Food Webs
Giulio Valentino Dalla Riva  
16 November 2016  



# Are Food Web complex?

Food webs are _complex_. The notion underlying the hype is that ecosystem, described in terms of ecological networks, are the outcome of evolutionary and ecologic processes --- not _random_ structures. Thus, we _expect_ them to be significantly more _complex_ of what expected under some _null model_. As a corollary, we _expect_ ecological network complexity to be higher were the complexity of the evolutionary and ecologic processes is higher.

Here, we try to cut through the hype, briefly reviewing the various heuristical definition of ecosystem / food webs complexity. Moreover, we introduce rigorous definitions of graph complexity in the ecological scenario, presenting both deterministic (Kolmogorov) and probabilistic definitions. We discuss how the heuristic definition may be related to the more rigorous definitions.

To ground the discussion we put to test the main notion, asking (i) wether food webs are indeed more complex than random graphs. Finally, we explore the corollary, asking (ii) wether the complexity of food webs is correlated with any of the other large spectrum biodiversity trends: are tropical food webs more complex than high latitude ones? are microbial food webs more complex than non microbial ones?

# *What* is complex?

The graph description of food webs are abstractions: they do not exist, as such, in nature. *Building* a graph representation of an ecosystem's trophic interactions involves a number of choices: ecosystems need to be defined within closed spatial, temporal and scale boundaries (e.g., we may be interested in the human gut microbial community at a certain time, or in the pollination network of flowering plants in the Po valley spring); individuals need to be grouped (species, guild, OTUs, ...); interactions need to be grouped (predation, commensalism, pollination, ...) and selected (we may focus on one or more of those interactions); interacting individuals need to be assigned to _groups_ and their interaction classified; relevant empirical and literature data need to be gathered, processed and validated.

Each of this steps adds both uncertainty and arbitrarity to che process. The choices made in one system can be hardly compared to the choices made in a different system. The operative issues encountered depend on many system specific factors --- and researchers in a field may fail to recognize the specific issues exhisting in other fields.

However problematic this *complications* are, they do not *necessarily* translate into an intrinsic *complexity* of the food webs themselves. In other words, *complicated* webs need not to be more *complex*. Moreover, given that many choices are grounded on a specific knowledge of the systems being studied, they don't seem a sound terrain on which to base a food web complexity. That is, what is *complicated* may depend on who's defining *complicated*.

> The challenges of managing and analyzing  data generated from genetic/genomic techniques is often what microbial ecologists are really referring to when they invoke complexity.  Brute-force use of  typologies and careless references to the number of microbes (gizillions everywhere!) lead to hairballs of seemingly intractable complexity

> [Thus we see that,] microbial ecologists (and others) use "complexity" as a proxy for how hard it is to measure/quantify a network. This deserves some thought, too. If a network can never be quantified, that doesn't necessarily mean it's complex - but it obscures our ability to make predictions for that community. And isn't that in a way similar to how indirect effects can lead to "ecological surprises"?

The alternative is to consider the complexity of a food web as a network.

# What *is* complex?

> The question of "what is complexity" is really interesting because we don't have a good grasp on what any of our complexity metrics mean.

In López-Ruiz et al., the authors propose to define the complexity of a physical phenomena as "the interplay between the information stored in the system and its disequilibrium". Here, we consider the two components autonomously, discussing the **informational** and the **dynamical** components of a food web complexity.

## Ecological complexity

(Here I'm quoting straight --- or almost --- from Allison.)

Ecologists historically used the number of interactions (scaled in some way or another) as a proxy for a food web complexity.

### Topology and interaction weights

I think another unexplored aspect includes the weight of those interactions (i.e., interaction strength) and how interaction strength drives feedback loops (e.g., see [Dambacher et al.](http://onlinelibrary.wiley.com/doi/10.1890/0012-9658(2002)083[1372:ROCSIA]2.0.CO;2/full) and the more recent but more technical [Koslicki & Novak](http://biorxiv.org/content/early/2016/10/25/083089). Most folks aren't talking about interaction strength though because we don't have that kind of data.

## Topological complexity

(XXX Maybe something about Watson and Szathamary and learing in ecosystems). The information complexity of an observed food web can be summarised as the amount of information needed to specify its structure, that is, the distance between the observed food web and the most likely random food web (XXX this is to check carefully).


### Are food webs complex?

The claim that food webs are complex can be expressed as the hypothesis that the informational and dynamical complexity of observed food webs is higher than that of simulated food webs sampled from a relevant null distribution.

So far, the literature about food web complexity operated only through statistical indexes (such as connectance or species richness), assumed as proxies for complexities.
igraphdata
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
web_list <- plyr::llply(foodwebs, directed_to_graphNEL)
```

Maybe some plot, just because everybody loves hairy balls.

#### Methodology

To illustrate the analytic flow without compromising our results with an implicit bias, we are going to use an unnamed complexity function sampled from the 23 provided by `QuACN`.
                     

```r
cpl_foo <- random_complexity_foo()
```

We can compute the complexity of any of the observed food webs:


```r
test_fw <- sample(web_list,size=1)
name_fw <- names(test_fw)
test_fw <- test_fw[[name_fw]]
test_fw_cpl <- cpl_foo(test_fw)
```

We find that the Mondego food web has a complexity of 4.4308519. Now, we can test wether that complexity is significantly higher (or lower) than wha we find in a _random_ food web. To do this, we have to define a randomization function, that performs a rewiring of the observed food web preserving some of its properties. The choice of the properties to preserve is an essential component of the analytic flow.



#### Results

Are empiracally observed food webs significantly more complex, from an information theoretic point of view, than their random counter part? Is any of the common proxies (such as connectance, the number of species, ...) correlated with the information complexity of the webs?

## Dynamical complexity

Food webs are not, in general, static. Demographic dynamics are a source of additional complexity. We identify the dynamical complexity of a food web with the complexity of its dynamic attractor. (We need help from Leo here!)

# Conclusions
