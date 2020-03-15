#Data-cleaning Box-task
#Very important that the faw-files folder does not contain any other files, and, that you don't have any of them opened
#as this will create a temp-file in that folders that inhibits this script-file from running properly.

#Get the openxlsx package to read Excel-documents
#install.packages("openxlsx", dependencies = TRUE) #remove comment in front first time
library(openxlsx)

path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/BoxTask/" #Set to local path / directory of raw files for Box-task
pattern <- "ID_"
BoxFiles <- list.files(path = path, pattern = pattern)

#Create BoxTask-sheets
BoxTask <- row.names(c("ID", "lengde", "tidperbox", "vartidperbox", "valg", "probest"))
BoxTask <- as.data.frame(BoxTask)
BoxTask1 <- BoxTask
BoxTask2 <- BoxTask
BoxTask3 <- BoxTask
BoxTask4 <- BoxTask
BoxTask6 <- BoxTask
BoxTask7 <- BoxTask
BoxTask8 <- BoxTask
BoxTask10 <- BoxTask
BoxTask11 <- BoxTask
BoxTask12 <- BoxTask

for (i in BoxFiles) {
  print(i)
  pathspes <- paste("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/BoxTask/",i, sep="")
  #Sheet 1
  lengde <- length(read.xlsx(pathspes, sheet=1)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=1)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=1)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=1)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=1)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask1 <- rbind(BoxTask1,Run)
  #Sheet 2
  lengde <- length(read.xlsx(pathspes, sheet=2)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=2)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=2)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=2)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=2)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask2 <- rbind(BoxTask2,Run)
  #Sheet 3
  lengde <- length(read.xlsx(pathspes, sheet=3)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=3)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=3)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=3)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=3)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask3 <- rbind(BoxTask3,Run)
  #Sheet 4
  lengde <- length(read.xlsx(pathspes, sheet=4)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=4)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=4)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=4)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=4)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask4 <- rbind(BoxTask4,Run)
  #Sheet 6
  lengde <- length(read.xlsx(pathspes, sheet=6)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=6)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=6)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=6)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=6)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask6 <- rbind(BoxTask6,Run)
  #Sheet 7
  lengde <- length(read.xlsx(pathspes, sheet=7)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=7)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=7)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=7)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=7)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask7 <- rbind(BoxTask7,Run)
  #Sheet 8
  lengde <- length(read.xlsx(pathspes, sheet=8)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=8)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=8)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=8)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=8)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask8 <- rbind(BoxTask8,Run)
  #Sheet 10
  lengde <- length(read.xlsx(pathspes, sheet=10)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=10)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=10)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=10)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=10)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask10 <- rbind(BoxTask10,Run)
  #Sheet 11
  lengde <- length(read.xlsx(pathspes, sheet=11)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=11)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=11)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=11)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=11)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask11 <- rbind(BoxTask11,Run)
  #Sheet 12
  lengde <- length(read.xlsx(pathspes, sheet=12)[,5])
  tidperbox <- mean((read.xlsx(pathspes, sheet=12)[1:lengde,4]))
  vartidperbox <- var((read.xlsx(pathspes, sheet=12)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=12)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=12)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask12 <- rbind(BoxTask12,Run)
}