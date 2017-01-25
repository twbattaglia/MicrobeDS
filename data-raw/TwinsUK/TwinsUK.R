# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# TwinsUK

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/TwinsUK/138_otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/TwinsUK/97_otus_unannotated.tree")

# Import mapping file (error using the default qiime method)
library(readr)
map <- read_delim(file = "data-raw/TwinsUK/2014_prep_232_qiime_20161216-090936.txt",
                  delim = "\t",
                  escape_double = FALSE,
                  trim_ws = TRUE)

# Fix sampleID to be consistient with other datasets
colnames(map)[1] <- "X.SampleID"

# Make phyloseq object
TwinsUK <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(TwinsUK)
rank_names(TwinsUK)
nsamples(TwinsUK)

# Store as RDA
devtools::use_data(TwinsUK, internal = F, compress = "bzip2", overwrite = T)

