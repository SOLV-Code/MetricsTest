## Code to Calculate Status Metrics under *Canada's Wild Salmon Policy* (WSP)


### Disclaimer

**Important Note**

*This package is under development. Functions will change rapidly and substantially.
Do not use these if you are not part of the development team!*

* Dr. Carrie Holt (Project Lead, Carrie.Holt"AT"dfo-mpo.gc.ca)
* Gottfried Pestal (Developer, gpestal"AT"solv.ca)


## Install

To install this package directly from github, use

```
install.packages("devtools") # Install the devtools package
library(devtools) # Load the devtools package.
install_github("SOLV-Code/MetricsTest", 
				dependencies = TRUE,
                build_vignettes = FALSE)
library(MetricsTest)				
```



### WSP Status Metrics

This package includes functions to calculate the metrics originally defined by Holt et al. (2009), and further refined in subsequent test cases and additional explorations. 




The WSP metrics are designed to capture different considerations related to *status*, and have been used *in combination* to develop *integrated status designations*. Below is a brief overview with general definitions. For more detail about these metrics, alternative calculation approaches, and their use in formal status asessments, go to the [WSP Metrics wiki](https://github.com/SOLV-Code/MetricsTest/wiki). 


**Metric** | **General Definition** | **Variations** | **Function** 
-- | -- | -- | --
Long-Term Trend | Recent Avg / Long-term Avg |  geometric mean vs. arithmetic mean |  *calcLongTermTrend()*
Percent Change  | change over 3 generations | alternative smoothing (log, gen avg), time window (3 gen, 3 gen +1) | *calcPercChange()*
Probability of Decline | Prob(PercChange> X%) | alternative smoothing (log, gen avg), time window (3 gen, 3 gen +1) |  subroutine *per.change.mcmc* integrated into *calcPercChange()* NOTE: will build in option to use all yrs or 3 gen yrs for slope fit)
Relative Abundance - SR-Based BM| Recent Avg compared to biological benchmarks (Sgen, 80%Smsy) | geometric mean vs. arithmetic mean, alternative benchmark estimate approaches | for now, have subroutine *calcRickerSgen*. For long-term, consider building a larger module *calcRelAbdBM()*
Relative Abd - Percentile BM| Recent Avg compared to user-specified %iles | - | To be included







