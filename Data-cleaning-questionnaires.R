#Data-cleaning NfCS and 5D_Curiosity
#Very important that the faw-files folder does not contain any other files, and, that you don't have any of them opened
#as this will create a temp-file in that folders that inhibits this script-file from running properly.
#Incomplete case rg05le19 removed manually. In the future this should be done automatically, as new (incomplete) cases will stop the script.

#Get the openxlsx package to read Excel-documents (if not installed), and load the package
pakke <- library()
if (sum(grepl("openxlsx", pakke$results)) < 1) {
  install.packages("openxlsx", dependencies = TRUE)
  library(openxlsx)
} else {
  library(openxlsx)
}

path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/BoxTask/" #Set to local path / directory of raw files for Box-task which contains the two questionnaires
pattern <- "ID_"
BoxFiles <- list.files(path = path, pattern = pattern)

#Create BoxTask-sheets
FiveD <- row.names(c("Item", "Answer", "ResponseTime"))
FiveD <- as.data.frame(FiveD)
NfCS <- as.data.frame(FiveD)

#Extract from xlsx-files
for (i in BoxFiles) {
  pathspes <- paste("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/BoxTask/",i, sep="")
  FiveD1 <- read.xlsx(pathspes, sheet=9)[1,3]
  FiveD2 <- read.xlsx(pathspes, sheet=9)[2,3]
  FiveD3 <- read.xlsx(pathspes, sheet=9)[3,3]
  FiveD4 <- read.xlsx(pathspes, sheet=9)[4,3]
  FiveD5 <- read.xlsx(pathspes, sheet=9)[5,3]
  FiveD6 <- read.xlsx(pathspes, sheet=9)[6,3]
  FiveD7 <- read.xlsx(pathspes, sheet=9)[7,3]
  FiveD8 <- read.xlsx(pathspes, sheet=9)[8,3]
  FiveD9 <- read.xlsx(pathspes, sheet=9)[9,3]
  FiveD10 <- read.xlsx(pathspes, sheet=9)[10,3]
  FiveD11 <- read.xlsx(pathspes, sheet=9)[11,3]
  FiveD12 <- read.xlsx(pathspes, sheet=9)[12,3]
  FiveD13 <- read.xlsx(pathspes, sheet=9)[13,3]
  FiveD14 <- read.xlsx(pathspes, sheet=9)[14,3]
  FiveD15 <- read.xlsx(pathspes, sheet=9)[15,3]
  FiveD16 <- read.xlsx(pathspes, sheet=9)[16,3]
  FiveD17 <- read.xlsx(pathspes, sheet=9)[17,3]
  FiveD18 <- read.xlsx(pathspes, sheet=9)[18,3]
  FiveD19 <- read.xlsx(pathspes, sheet=9)[19,3]
  FiveD20 <- read.xlsx(pathspes, sheet=9)[20,3]
  FiveD21 <- read.xlsx(pathspes, sheet=9)[21,3]
  FiveD22 <- read.xlsx(pathspes, sheet=9)[22,3]
  FiveD23 <- read.xlsx(pathspes, sheet=9)[23,3]
  FiveD24 <- read.xlsx(pathspes, sheet=9)[24,3]
  FiveD25 <- read.xlsx(pathspes, sheet=9)[25,3]
  NfCS1 <- read.xlsx(pathspes, sheet=5)[1,3]
  NfCS2 <- read.xlsx(pathspes, sheet=5)[2,3]
  NfCS3 <- read.xlsx(pathspes, sheet=5)[3,3]
  NfCS4 <- read.xlsx(pathspes, sheet=5)[4,3]
  NfCS5 <- read.xlsx(pathspes, sheet=5)[5,3]
  NfCS6 <- read.xlsx(pathspes, sheet=5)[6,3]
  NfCS7 <- read.xlsx(pathspes, sheet=5)[7,3]
  NfCS8 <- read.xlsx(pathspes, sheet=5)[8,3]
  NfCS9 <- read.xlsx(pathspes, sheet=5)[9,3]
  NfCS10 <- read.xlsx(pathspes, sheet=5)[10,3]
  NfCS11 <- read.xlsx(pathspes, sheet=5)[11,3]
  NfCS12 <- read.xlsx(pathspes, sheet=5)[12,3]
  NfCS13 <- read.xlsx(pathspes, sheet=5)[13,3]
  NfCS14 <- read.xlsx(pathspes, sheet=5)[14,3]
  NfCS15 <- read.xlsx(pathspes, sheet=5)[15,3]
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, FiveD1, FiveD2, FiveD3, FiveD4, FiveD5, FiveD6, FiveD7, FiveD8, FiveD9, FiveD10, FiveD11, FiveD12, FiveD13, FiveD14, FiveD15, FiveD16, FiveD17, FiveD18, FiveD19, FiveD20, FiveD21, FiveD22, FiveD23, FiveD24, FiveD25, NfCS1, NfCS2, NfCS3, NfCS4, NfCS5, NfCS6, NfCS7, NfCS8, NfCS9, NfCS10, NfCS11, NfCS12, NfCS13, NfCS14, NfCS15)
  FiveD <- rbind(FiveD,Run)
}

#Create CSV-file
write.csv(FiveD, "Cleaned data/5DCuriosity and NfCS.csv")
