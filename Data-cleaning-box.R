#Data-cleaning Box-task
#Very important that the faw-files folder does not contain any other files, and, that you don't have any of them opened
#as this will create a temp-file in that folders that inhibits this script-file from running properly.

#Get the openxlsx package to read Excel-documents (if not installed), and load the package
pakke <- library()
if (sum(grepl("openxlsx", pakke$results)) < 1) {
  install.packages("openxlsx", dependencies = TRUE)
  library(openxlsx)
} else {
  library(openxlsx)
}

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

#Extract from xlsx-files
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

#Combine all sheets/info, set ID as rownames and remove redundencies
BoxTaskAll <- cbind(BoxTask1, BoxTask2, BoxTask3, BoxTask4, BoxTask6, BoxTask7, BoxTask8, BoxTask10, BoxTask11, BoxTask12)
BoxTaskIDs <- BoxTaskAll[[1]]
BoxTaskAll <- BoxTaskAll[-c(1,7,13,19,25,31,37,43,49,55,61)]
row.names(BoxTaskAll) <- BoxTaskIDs

#Rearrange the results, and add headers
Colnavn <- c("BoxDtD1","BoxDtD2","BoxDtD3","BoxDtD4","BoxDtD5","BoxDtD6","BoxDtD7","BoxDtD8","BoxDtD9","BoxDtD10","BoxMeanRT1","BoxMeanRT2","BoxMeanRT3","BoxMeanRT4","BoxMeanRT5","BoxMeanRT6","BoxMeanRT7","BoxMeanRT8","BoxMeanRT9","BoxMeanRT10","BoxVarRT1","BoxVarRT2","BoxVarRT3", "BoxVarRT4", "BoxVarRT5","BoxVarRT6","BoxVarRT7","BoxVarRT8","BoxVarRT9","BoxVarRT10","BoxChoice1","BoxChoice2","BoxChoice3","BoxChoice4","BoxChoice5","BoxChoice6","BoxChoice7","BoxChoice8","BoxChoice9","BoxChoice10","BoxLastProb1","BoxLastProb2","BoxLastProb3","BoxLastProb4","BoxLastProb5","BoxLastProb6","BoxLastProb7","BoxLastProb8","BoxLastProb9","BoxLastProb10")
BoxTaskLengde <- BoxTaskAll[c(1,6,11,16,21,26,31,36,41,46)]
BoxTaskTid <- BoxTaskAll[c(2,7,12,17,22,27,32,37,42,47)]
BoxTaskVar <- BoxTaskAll[c(3,8,13,18,23,28,33,38,43,48)]
BoxTaskValg <- BoxTaskAll[c(4,9,14,19,24,29,34,39,44,49)]
BoxTaskProb <- BoxTaskAll[c(5,10,15,20,25,30,35,40,45,50)]
BoxTaskFerdig <- cbind(BoxTaskLengde,BoxTaskTid,BoxTaskVar,BoxTaskValg,BoxTaskProb)
colnames(BoxTaskFerdig) <- Colnavn

#Create CSV-file
write.csv(BoxTaskFerdig, "Cleaned data/BoxTask.csv")
