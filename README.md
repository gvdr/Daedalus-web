# The Complexity of Food Webs
Giulio Valentino Dalla Riva  
16 November 2016  



# Are Food Web complex?

Cool kids throw around the word _complexity_ a lot. The notion underlying the hype is that ecosystem, described in terms of ecological networks, are the outcome of evolutionary and ecologic processes --- not _random_ structures. Thus, cool kids _expect_ them to be significantly more _complex_ of what expected under some _null model_. As a corollary, cool kids _expect_ ecological network complexity to be higher were the complexity of the evolutionary and ecologic processes is higher.

Here, we try to cut through the hype, briefly reviewing the various heuristical definition of ecosystem / food webs complexity. Moreover, we introduce rigorous definitions of graph complexity in the ecological scenario, presenting both deterministic (Kolmogorov) and probabilistic definitions. We discuss how the heuristic definition may be related to the more rigorous definitions.

To ground the discussion we put to test the main notion, asking (i) wether food webs are indeed more complex than random graphs. Finally, we explore the corollary, asking (ii) wether the complexity of food webs is correlated with any of the other large spectrum biodiversity trends: are tropical food webs more complex than high latitude ones? are microbial food webs more complex than non microbial ones?

# *What* is complex?

The graph description of food webs are abstractions: they do not exist, as such, in nature. *Building* a graph representation of an ecosystem's trophic interactions involves a number of choices: ecosystems need to be defined within closed spatial, temporal and scale boundaries (e.g., we may be interested in the human gut microbial community at a certain time, or in the pollination network of flowering plants in the Po valley spring); individuals need to be grouped (species, guild, OTUs, ...); interactions need to be grouped (predation, commensalism, pollination, ...) and selected (we may focus on one or more of those interactions); interacting individuals need to be assigned to _groups_ and their interaction classified; relevant empirical and literature data need to be gathered, processed and validated.

Each of this steps adds both uncertainty and arbitrarity to che process. The choices made in one system can be hardly compared to the choices made in a different system. The operative issues encountered depend on many system specific factors --- and researchers in a field may fail to recognize the specific issues exhisting in other fields.

However problematic this *complications* are, they do not *necessarily* translate into an intrinsic *complexity* of the food webs themselves. In other words, *complicated* webs need not to be more *complex*. Moreover, given that many choices are grounded on a specific knowledge of the systems being studied, they don't seem a sound terrain on which to base a food web complexity. That is, what is *complicated* may depend on who's defining *complicated*.

The alternative is to consider the complexity of a food web as a network.

# What *is* complex?

In López-Ruiz et al., the authors propose to define the complexity of a physical phenomena as "the interplay between the information stored in the system and its disequilibrium". Here, we consider the two components autonomously, discussing the **informational** and the **dynamical** components of a food web complexity.

## Topological complexity

(XXX Maybe something about Watson and Szathamary and learing in ecosystems). The information complexity of an observed food web can be summarised as the amount of information needed to specify its structure, that is, the distance between the observed food web and the most likely random food web (XXX this is to check carefully).

## Dynamical complexity

Food webs are not, in general, static. Demographic dynamics are a source of additional complexity. We identify the dynamical complexity of a food web with the complexity of its dynamic attractor. (We need help from Leo here!)
