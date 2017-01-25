# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# HMPv35

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/HMPv35/otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/HMPv35/97_otus_unannotated.tree")

# Import mapping file
map <- import_qiime_sample_data(mapfilename = "data-raw/HMPv35/1928_prep_1445_qiime_20161216-091008.txt")

# Make phyloseq object
HMPv35 <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(HMPv35)
rank_names(HMPv35)
nsamples(HMPv35)

# Store as RDA
devtools::use_data(HMPv35, internal = F, compress = "bzip2", overwrite = T)

