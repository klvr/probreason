#Data-cleaning Box-task

#Get the openxlsx package to read Excel-documents
#install.packages("openxlsx", dependencies = TRUE) #remove comment in front first time
library(openxlsx)

path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/BoxTask/" #Set to local path / directory of raw files for Box-task
pattern <- "ID_"
BoxFiles <- list.files(path = path, pattern = pattern)
BoxFiles <- paste(path, BoxFiles, sep = "")
read.xlsx

#Trash
path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort/" #Set to local path / directory of raw files for Ambiguity+Effort
EAmbiguity <- "EAmbiguity"
AmbiguityE <- "AmbiguityE"
EAFiles <- list.files(path = path, pattern = EAmbiguity)
AEFiles <- list.files(path = path, pattern = AmbiguityE)
EAFiles <- EAFiles[grepl("*.csv", EAFiles)]
AEFiles <- AEFiles[grepl("*.csv", AEFiles)]
EAID <- sapply(strsplit(EAFiles, split='_EAmbiguity', fixed=TRUE), function(x) (x[1]))
AEID <- sapply(strsplit(AEFiles, split='_AmbiguityE', fixed=TRUE), function(x) (x[1])) 
EAFiles <- paste(path, EAFiles, sep = "")
AEFiles <- paste(path, AEFiles, sep = "")
EAEffort <- do.call(rbind, (lapply(EAFiles, function(x) read.csv(x)[2:11,31])))