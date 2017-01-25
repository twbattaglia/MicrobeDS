# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from OTU, map, tree and refseqs
# MovingPictures

# Load libraries
library(phyloseq)
library(Biostrings)
library(ape)
library(biomformat)

# Import BIOM and Tre file
biom <- import_biom(BIOMfilename = "data-raw/MovingPictures/67_otu_table_json.biom",
                    parseFunction = parse_taxonomy_greengenes)

# Import Tre file
tree <- read.tree("data-raw/MovingPictures/97_otus_unannotated.tree")

# Import mapping file
map <- import_qiime_sample_data(mapfilename = "data-raw/MovingPictures/550_prep_72_qiime_20161216-085930.txt")

# Make phyloseq object
MovingPictures <- merge_phyloseq(biom, map, tree)

# Check data
tax_table(MovingPictures)
rank_names(MovingPictures)
nsamples(MovingPictures)

# Store as RDA
devtools::use_data(MovingPictures, internal = F, compress = "bzip2", overwrite = T)

