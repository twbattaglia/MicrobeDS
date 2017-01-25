# Microbiome datasets
#### A repository for large-scale microbiome datasets.
[![Build Status](https://travis-ci.org/twbattaglia/MicrobeDS.svg?branch=master)](https://travis-ci.org/twbattaglia/MicrobeDS)  
  

### Install
```R
devtools::install_github("twbattaglia/MicrobeDS")
```

### Usage
```R
# Load Library
library(MicrobeDS)

# Load selected datasets
data('HMPv35')

# Check number of samples
nsamples(HMPv35)

# Check sample metadata
sample_data(HMPv35)
```

### Datasets
This package contains datasets provided by large-scale microbiome studies. Each dataset is formatted for use with phyloseq. (https://joey711.github.io/phyloseq/).  

### `HMPv13`  
**Description:** Human Microbiome Project (HMP) V1-V3 amplicon      
**Number of samples:** 3285   
**Data source:** https://qiita.ucsd.edu/study/description/1927  
**Study:** https://www.ncbi.nlm.nih.gov/pubmed/22699609    
**Processing** QIIME 1.9.1, SortMeRNA, Closed-reference OTU-picking at 97% identity  
**Type:** OTU-table, Sample metadata, Representative Tree  
**Abstract:** This HMP production phase represents pyrosequencing of 16S rRNA genes amplified from multiple body sites across hundreds of human subjects. There are two time points represented for a subset of these subjects. Using default protocol v4.2., data for the 16S window spanning V3-V5 was generated for all samples, with a second 16S window spanning V1-V3 generated for a majority of the samples. 16S rRNA sequencing is being used to characterize the complexity of microbial communities at individual body sites, and to determine whether there is a core microbiome at each site. Several body sites will be studied, including the gastrointestinal and female urogenital tracts, oral cavity, nasal and pharyngeal tract, and skin.  

----

### `HMPv35`    
**Description:** Human Microbiome Project (HMP) V3-V5 amplicon  
**Number of samples:** 6000  
**Data source:** https://qiita.ucsd.edu/study/description/1928  
**Study:** https://www.ncbi.nlm.nih.gov/pubmed/22699609     
**Processing** QIIME 1.9.1, SortMeRNA, Closed-reference OTU-picking at 97% identity  
**Type:** OTU-table, Sample metadata, Representative Tree  
**Abstract:** This HMP production phase represents pyrosequencing of 16S rRNA genes amplified from multiple body sites across hundreds of human subjects. There are two time points represented for a subset of these subjects. Using default protocol v4.2., data for the 16S window spanning V3-V5 was generated for all samples, with a second 16S window spanning V1-V3 generated for a majority of the samples. 16S rRNA sequencing is being used to characterize the complexity of microbial communities at individual body sites, and to determine whether there is a core microbiome at each site. Several body sites will be studied, including the gastrointestinal and female urogenital tracts, oral cavity, nasal and pharyngeal tract, and skin.   

----

### `MovingPictures`  
**Description:** Time series of the human microbiome   
**Number of samples:** 1967  
**Data source:** https://qiita.ucsd.edu/study/description/550    
**Study:** https://www.ncbi.nlm.nih.gov/pubmed/21624126  
**Additional source:** http://www.ebi.ac.uk/ena/data/view/PRJEB13679  
**Processing** QIIME 1.9.1, SortMeRNA, Closed-reference OTU-picking at 97% identity   
**Type:** OTU-table, Sample metadata, Representative Tree  
**Abstract:** Understanding the normal temporal variation in the human microbiome is critical to developing treatments for putative microbiome-related afflictions such as obesity, Crohn's disease, inflammatory bowel disease, and malnutrition. Sequencing and computational technologies however have been a limiting factor in performing dense timeseries analysis of the human microbiome. Here we present the largest human microbiota timeseries analysis to date, covering two individuals at four body sites over 396 timepoints.  
**Results:** We find that despite stable differences between body sites and individuals, daily fluctuations in an individual's microbiota appear characteristic. Additionally, only a small fraction of the total within body site microbial communities appears to be present across all time points, suggesting that if a core temporal microbiome exists it is small. Many more taxa appear to be persistent but non-permanent community members. DNA sequencing and computational advances described here provide the ability to go beyond infrequent snapshots of our human-associated microbial ecology to high-resolution assessments of temporal variations over protracted periods, within and between body habitats and individuals. This capacity will allow us to define normal variation and pathologic states, and for assessing responses to therapeutic interventions.  
  
----

### `RISK_CCFA`  
**Description:** The treatment-naive microbiome in new-onset Crohn's disease   
**Number of samples:** 1359    
**Data source:** https://qiita.ucsd.edu/study/description/1939  
**Additional source:** http://www.ebi.ac.uk/ena/data/view/PRJEB13679  
**Study:** https://www.ncbi.nlm.nih.gov/pubmed/24629344      
**Processing** QIIME 1.9.1, SortMeRNA, Closed-reference OTU-picking at 97% identity   
**Type:** OTU-table, Sample metadata, Representative Tree  
**Abstract:** Inflammatory bowel diseases (IBDs), including Crohn's disease (CD), are genetically linked to host pathways that implicate an underlying role for aberrant immune responses to intestinal microbiota. However, patterns of gut microbiome dysbiosis in IBD patients are inconsistent among published studies. Using samples from multiple gastrointestinal locations collected prior to treatment in new-onset cases, we studied the microbiome in the largest pediatric CD cohort to date. An axis defined by an increased abundance in bacteria which include Enterobacteriaceae, Pasteurellacaea, Veillonellaceae, and Fusobacteriaceae, and decreased abundance in Erysipelotrichales, Bacteroidales, and Clostridiales, correlates strongly with disease status. Microbiome comparison between CD patients with and without antibiotic exposure indicates that antibiotic use amplifies the microbial dysbiosis associated with CD. Comparing the microbial signatures between the ileum, the rectum, and fecal samples indicates that at this early stage of disease, assessing the rectal mucosal-associated microbiome offers unique potential for convenient and early diagnosis of CD.  


----

### `TwinsUK`  
**Description:** Genetic Determinants of the Gut Microbiome in UK Twins    
**Number of samples:** 1024    
**Data source:** https://qiita.ucsd.edu/study/description/2014  
**Study:** https://www.ncbi.nlm.nih.gov/pubmed/25417156       
**Processing** QIIME 1.9.1, SortMeRNA, Closed-reference OTU-picking at 97% identity   
**Type:** OTU-table, Sample metadata, Representative Tree  
**Abstract:** Host genetics and the gut microbiome can both influence host metabolic phenotypes. However, whether host genetic variation shapes the gut microbiome and interacts with it to affect host phenotype is unclear. Here, we addressed this question by comparing microbiotas across more than 1,000 fecal samples obtained from members of the TwinsUK population, including 416 twin-pairs. We identified a variety of microbial taxa whose abundances were influenced by host genetics. The most heritable taxon, the family Christensenellaceae, formed a co-occurrence network with other heritable Bacteria and with methanogenic Archaea, and was enriched in individuals with low BMI. Addition of Christensenella minuta to an obese donor fecal microbiome resulted in reduced weight gain and an altered fecal microbiota in recipient germfree mice. Our findings indicate that host genetics influence the composition of the human gut microbiome and can do so in ways that impact host metabolism.  

