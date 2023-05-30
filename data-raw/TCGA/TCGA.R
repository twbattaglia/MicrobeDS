# @ Thomas W. Battaglia
# Code to import and create a phyloseq object from microbial counts and metadata
# TCGA

# Load libraries
library(phyloseq)
library(data.table)
library(tidyverse)

# Download large files to pwd
# wget ftp://ftp.microbio.me/pub/cancer_microbiome_analysis/TCGA/Kraken/Kraken-TCGA-Raw-Data-17625-Samples.csv
# wget ftp://ftp.microbio.me/pub/cancer_microbiome_analysis/TCGA/Metadata-TCGA-All-18116-Samples.csv

# Import counts
kraken2 = data.table::fread("data-raw/TCGA/Kraken-TCGA-Raw-Data-17625-Samples.csv") %>%
  rename(sample = V1) %>%
  column_to_rownames("sample") %>%
  t() %>%
  as.data.frame() %>%
  rownames_to_column("taxa") %>%
  separate(taxa, into = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus"), sep = "\\.", remove = F) %>%
  select(-Phylum:-Genus) %>%
  separate(taxa, c("temp1", "Genus"), sep = "\\.g__", remove = T) %>%
  select(-temp1) %>%
  relocate(Kingdom, Genus) %>%
  mutate(taxaid = paste0("sp", row_number())) %>%
  mutate(Kingdom = str_remove(Kingdom, "k__"))

# Get counts
counts = kraken2 %>%
  column_to_rownames("taxaid") %>%
  select(-Kingdom, -Genus) %>%
  otu_table(taxa_are_rows = T)

# Get taxonomy
taxonomy = kraken2 %>%
  column_to_rownames("taxaid") %>%
  select(Kingdom, Genus) %>%
  tax_table()
colnames(tax_table(taxonomy)) = c("Kingdom", "Genus")

# Import mapping file (error using the default qiime method)
metadata = data.table::fread("data-raw/TCGA/Metadata-TCGA-All-18116-Samples.csv") %>%
  dplyr::rename(sample = `V1`) %>%
  filter(sample %in% colnames(counts)) %>%
  mutate(sample_id = sample) %>%
  column_to_rownames("sample_id")

# Fix sampleID to be consistient with other datasets
colnames(metadata)[1] <- "X.SampleID"

# Make phyloseq object
TCGA <- merge_phyloseq(counts, sample_data(metadata), taxonomy)

# Check data
tax_table(TCGA)
rank_names(TCGA)
nsamples(TCGA)

# Store as RDA
usethis::use_data(TCGA, internal = F, compress = "bzip2", overwrite = T)
rm(kraken2)
rm(metadata)

# Store TCGA contaminant list as a internal database
TCGA.contaminants = read_tsv("data-raw/TCGA/tcga-curation-contamination.txt") %>%
  rename(Genus = Genera)
usethis::use_data(TCGA.contaminants, internal = F, compress = "bzip2", overwrite = T)



