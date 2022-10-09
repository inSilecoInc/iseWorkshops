# iseWorkshops
[![R-CMD-check](https://github.com/inSilecoInc/iseWorkshops/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/inSilecoInc/iseWorkshops/actions/workflows/R-CMD-check.yaml)
[![lint](https://github.com/inSilecoInc/iseWorkshops/actions/workflows/lint.yaml/badge.svg)](https://github.com/inSilecoInc/iseWorkshops/actions/workflows/lint.yaml)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)


## Installation 

```{R}
install.packages("remotes")
remotes::install_github("inSilecoInc/iseWorkshops")
```


## Overview 

```R
library(iseWorkshops)
rfa(help = TRUE) 
ℹ icons available are


fun    icons                
-----  ---------------------
ar()   arrow-right          
bk()   book                 
cb()   clipboard            
cg()   cogs                 
ch()   check                
ck()   clock                
db()   database             
ey()   eye                  
fd()   folder               
fl()   file                 
gh()   github               
lc()   laptop-code          
lk()   link                 
nf()   info-circle          
pd()   file-pdf             
rp()   r-project            
tr()   exclamation-triangle 
wk()   wikipedia-w  
```

```R
wksh_dl() 
wksh_dl(1) 
```

### Create an empty presentation

```R
new_pres()
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](https://docs.ropensci.org/rcites/CONDUCT.html).
By participating in this project you agree to abide by its terms.