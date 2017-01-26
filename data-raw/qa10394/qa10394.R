# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# qa10394

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/qa10394/otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/qa10394/97_otus_unannotated.tree")

# Import mapping file (error using the default qiime method)
library(readr)
map <- read_delim(file = "data-raw/qa10394/10394_prep_1360_qiime_20161216-085956.txt",
                  delim = "\t",
                  escape_double = FALSE,
                  trim_ws = TRUE)

# Fix sampleID to be consistient with other datasets
colnames(map)[1] <- "X.SampleID"

# Make phyloseq object
qa10394 <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(qa10394)
rank_names(qa10394)
nsamples(qa10394)

# Store as RDA
devtools::use_data(qa10394, internal = F, compress = "bzip2", overwrite = T)

