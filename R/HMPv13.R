#' @title Human Microbiome Project (HMP) V1-V3 amplicon sequencing
#' @details Closed-reference OTU-picking with SortMeRNA (97 percent identity)
#' @description This HMP production phase represents pyrosequencing of 16S rRNA genes amplified from multiple body sites across hundreds of human subjects. There are two time points represented for a subset of these subjects. Using default protocol v4.2., data for the 16S window spanning V3-V5 was generated for all samples, with a second 16S window spanning V1-V3 generated for a majority of the samples. 16S rRNA sequencing is being used to characterize the complexity of microbial communities at individual body sites, and to determine whether there is a core microbiome at each site. Several body sites will be studied, including the gastrointestinal and female urogenital tracts, oral cavity, nasal and pharyngeal tract, and skin.
#' @usage data('HMPv13')
#' @source https://qiita.ucsd.edu/study/description/1927
#' @docType data
#' @format An object of class \code{"phyloseq"}.
#' @keywords datasets
#' @references The NIH HMP Working Group et al. (2009) Genome Res 19(12): 2317–2323.
#' (\href{https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2792171}{PubMed})
#'
"HMPv13"
