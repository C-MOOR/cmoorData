## code to prepare `marianes_htseq` dataset goes here

meta <- read.table("data-raw/marianes_htseq/midgut.tsv", header=TRUE, sep="\t")

# see https://stackoverflow.com/questions/59977966/how-to-dynamically-change-names-inside-a-for-loop-in-usethisuse-data-r

for (row in 1:nrow(meta)) {
  sample_name <- paste0("marianes_htseq_", meta[row, "sample"])
  data  <- read.table(paste0("data-raw/marianes_htseq/", meta[row, "filename"]), sep="\t")
  assign(sample_name, data)
  do.call(usethis::use_data, list(as.name(sample_name), overwrite = TRUE))
}



