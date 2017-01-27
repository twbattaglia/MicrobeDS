# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# AmericanGut

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/AmericanGut/otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/AmericanGut/97_otus_unannotated.tree")

# Import mapping file (error using the default qiime method)
library(readr)
map <- read_delim(file = "data-raw/AmericanGut/metadata.txt",
                  delim = "\t",
                  escape_double = FALSE,
                  trim_ws = TRUE)

# Fix sampleID to be consistient with other datasets
colnames(map)[1] <- "X.SampleID"

# Make phyloseq object
AmericanGut <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(AmericanGut)
rank_names(AmericanGut)
nsamples(AmericanGut)

# Store as RDA
devtools::use_data(AmericanGut, internal = F, compress = "bzip2", overwrite = T)

