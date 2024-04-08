# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from microbial counts and metadata
# Hartwig

# Load libraries
library(phyloseq)
library(data.table)
library(tidyverse)

# Functions for importing data between both sources and re-annotating taxonomy
source('data-raw/Hartwig/helpers.R')
metadata.all = read_tsv("metadata-all.tsv")

# Import Kraken2 files into phyloseq object
kraken2.path = list.files("./microbiome/results/", pattern = "*-genus.txt", full.names = T, recursive = T)
names(kraken2.path) = list.files("./microbiome/results/", pattern = "*-genus.txt", full.names = F, recursive = T) %>%
  basename() %>%
  gsub("-bracken-genus.txt", "", .) %>%
  gsub(".txt", "", .)

# Create phyloseq object
kraken2.pseq = import_bracken(kraken2.path, metadata.all)

# Add the number of reads mapped as metadata column
sample_data(kraken2.pseq)$kraken2.mapped.whuman = sample_sums(kraken2.pseq)

# Remove homosapiens from table
kraken2.pseq.nohuman = subset_taxa(kraken2.pseq, Family != "Hominidae")

# Add the number of reads mapped as metadata column
sample_data(kraken2.pseq.nohuman)$kraken2.mapped.nohuman = sample_sums(kraken2.pseq.nohuman)

# Import PathSeq
pathseq.path = list.files("./microbiome/results/", pattern = "*-scores.txt", full.names = T, recursive = T)
names(pathseq.path) = list.files("./microbiome/results/", pattern = "*-scores.txt", full.names = F, recursive = T) %>%
  basename() %>%
  gsub("-scores.txt", "", .) %>%
  gsub(".txt", "", .)

pathseq.pseq = import_pathseq(pathseq.path, metadata.all,
                              level = "genus",
                              count_feature = "unambiguous") %>%

# Get intersecting samples
idx = intersect(sample_data(kraken2.pseq.nohuman)$sampleId, sample_data(pathseq.pseq)$sampleId)

# Subset Kraken2 + PathSeq samples
kraken2.pseq.match = subset_samples(kraken2.pseq.nohuman, sampleId %in% idx)
pathseq.pseq.match = subset_samples(pathseq.pseq, sampleId %in% idx)

# Keep microbes found detected in Pathseq
pseq.everything = get_intersection(kraken2.pseq.match, pathseq.pseq.match)

# Export
usethis::use_data(pseq.everything, internal = F, compress = "bzip2", overwrite = T)

