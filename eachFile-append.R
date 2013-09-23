# in this file, we make the extension a variable so we can use it throughout:
fileNames <- Sys.glob("*.csv") # you can change this to work with files of other extensions, but you'll need to make changes or additions to read.csv below

# in this example, we'll be leaving the original files unaltered but using their data to append to an extra file:
for (fileName in fileNames) {

  # read original data:
  sample <- read.csv(fileName,
    header = TRUE,
    sep = ",")

  # create new data based on contents of original file:
  allWidgets <- data.frame(
    File = fileName,
    Widgets = sum(sample$Widgets))
  
  # write new data to separate file:
  write.table(allWidgets, 
    "Output/sample-allSamples.csv",
    append = TRUE,
    sep = ",",
    row.names = FALSE,
    col.names = FALSE)

}
