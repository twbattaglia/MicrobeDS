# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# HMPv13

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/HMPv13/otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/HMPv13/97_otus_unannotated.tree")

# Import mapping file
map <- import_qiime_sample_data(mapfilename = "data-raw/HMPv13/1927_prep_1444_qiime_20161216-091055.txt")

# Make phyloseq object
HMPv13 <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(HMPv13)
rank_names(HMPv13)
nsamples(HMPv13)

# Store as RDA
devtools::use_data(HMPv13, internal = F, compress = "bzip2", overwrite = T)

