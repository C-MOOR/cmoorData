## code to prepare `marianes_htseq` dataset goes here

marianes_htseq_metadata <- read.table("data-raw/marianes_htseq/midgut.tsv", header=TRUE, sep="\t")
usethis::use_data(marianes_htseq_metadata, overwrite=TRUE)
# see https://stackoverflow.com/questions/59977966/how-to-dynamically-change-names-inside-a-for-loop-in-usethisuse-data-r

cat("#' HTSeq readcounts from regions of the Drosophila midgut
#'
#' Fill in more documentation
#'
\"marianes_htseq_metadata\"\n\n", file="R/marianes_htseq.R")

for (row in 1:nrow(marianes_htseq_metadata)) {
  sample_name <- paste0("marianes_htseq_", marianes_htseq_metadata[row, "sample"])
  cat("#' @describeIn marianes_htseq_metadata Individual replicate from the ", marianes_htseq_metadata[row, "condition"], "region\n", file="R/marianes_htseq.R", append=TRUE)
  cat("\"", sample_name, "\"\n\n", file="R/marianes_htseq.R", sep="", append=TRUE)
  data  <- read.table(paste0("data-raw/marianes_htseq/", marianes_htseq_metadata[row, "filename"]), sep="\t")
  assign(sample_name, data)
  do.call(usethis::use_data, list(as.name(sample_name), overwrite = TRUE))
}





