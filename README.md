# Microbiome datasets (MDS)
#### A repository for large-scale microbiome datasets.
[![Build Status](https://travis-ci.org/twbattaglia/MicrobeDS.svg?branch=master)](https://travis-ci.org/twbattaglia/MicrobeDS)  
  

### Install
```R
devtools::install_github("twbattaglia/MicrobeDS")
```

### Usage
```R
library(MicrobeDS)
data('HMPv35')
nsamples(HMPv35) # 4743
```

### Datasets
This package contains datasets provided by large-scale microbiome studies. Each dataset is formatted for use with phyloseq. (https://joey711.github.io/phyloseq/)

* `HMPv13`: 16S rRNA V1-V3 amplicon microbiome data within a phyloseq object. Includes OTU table, taxonomy table, sample mapping file, representative tree file and representative sequences.
  (Source: http://www.hmpdacc.org/HMQCP/)

* `HMPv35`: 16S rRNA V3-V5 amplicon microbiome data within a phyloseq object. Includes OTU table, taxonomy table, sample mapping file, representative tree file and representative sequences.
  (Source: http://www.hmpdacc.org/HMQCP/)

