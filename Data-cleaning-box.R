#Data-cleaning Box-task

#Get the openxlsx package to read Excel-documents
#install.packages("openxlsx", dependencies = TRUE) #remove comment in front first time
library(openxlsx)

path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/BoxTask/" #Set to local path / directory of raw files for Box-task
pattern <- "ID_"
BoxFiles <- list.files(path = path, pattern = pattern)




#Gjøres med alle
test3 <- read.xlsx("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Safe to delete - Test files/ID_EN04NY19.xlsx", sheet=4)
testlengde <- length(read.xlsx("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Safe to delete - Test files/ID_EN04NY19.xlsx", sheet=4)[,5]) #Returns draw number
tidperbox <- mean((read.xlsx("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Safe to delete - Test files/ID_EN04NY19.xlsx", sheet=4)[1:testlengde,4]))
vartidperbox <- var((read.xlsx("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Safe to delete - Test files/ID_EN04NY19.xlsx", sheet=4)[1:testlengde,4]))
valg <- (read.xlsx("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Safe to delete - Test files/ID_EN04NY19.xlsx", sheet=4)[testlengde,5])
probest <- valg <- (read.xlsx("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Safe to delete - Test files/ID_EN04NY19.xlsx", sheet=4)[testlengde,3])

#Hente ut ID
ID <- sapply(strsplit(BoxFiles, split='ID_*', fixed=TRUE), function(x) (x[1]))
ID <- sapply(strsplit(ID, split='*.xlsx', fixed=TRUE), function(x) (x[1]))
ID4 <- ID[4]
ID4 <- sub(".*?ID_(.*?).xlsx.*", "\\1", ID4)


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