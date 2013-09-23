fileNames <- Sys.glob("*.csv") # you can change this to work with files of other extensions, but you'll need to make changes or additions to read.csv below

# in this example, we'll be editing each file and then replacing the original with the new version:
for (fileName in fileNames) {

  # read old data:
  sample <- read.csv(fileName,
    header = TRUE,
    sep = ",")

  # add one to every widget value in every file:
  sample$Widgets <- sample$Widgets + 1
  
  # overwrite old data with new data:
  write.table(sample, 
    fileName,
    append = FALSE,
    quote = FALSE,
    sep = ",",
    row.names = FALSE,
    col.names = TRUE)

}
