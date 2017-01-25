# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# RISK_CCFA

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/RISK_CCFA/441_otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/RISK_CCFA/97_otus_unannotated.tree")

# Import mapping file
map <- import_qiime_sample_data(mapfilename = "data-raw/RISK_CCFA/1939_prep_1177_qiime_20161216-091142.txt")

# Make phyloseq object
RISK_CCFA <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(RISK_CCFA)
rank_names(RISK_CCFA)
nsamples(RISK_CCFA)

# Store as RDA
devtools::use_data(RISK_CCFA, internal = F, compress = "bzip2", overwrite = T)

