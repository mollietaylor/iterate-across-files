# in this file, we make the extension a variable so we can use it throughout:
extension <- "csv" # you can change this to work with files of other extensions, but you'll need to make changes or additions to read.csv below

fileNames <- Sys.glob(paste("*.", extension, sep = ""))

fileNumbers <- seq(fileNames)

# in this example, we'll be creating new files with the new versions:
for (fileNumber in fileNumbers) {

  newFileName <-  paste("new-", 
    sub(paste("\\.", extension, sep = ""), "", fileNames[fileNumber]), 
    ".", extension, sep = "")

  # read old data:
  sample <- read.csv(fileNames[fileNumber],
    header = TRUE,
    sep = ",")

  # add one to every widget value in every file:
  sample$Widgets <- sample$Widgets + 1
  
  # write old data to new files:
  write.table(sample, 
    newFileName,
    append = FALSE,
    quote = FALSE,
    sep = ",",
    row.names = FALSE,
    col.names = TRUE)

}
