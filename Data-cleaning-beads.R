#Data-cleaning Beads-task
#Files at "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task"
#Several incomplete cases removed manually. Specifically:
  #Blank ID - 4 files
  #43gref_beads_task_DtD_v2020_2020_Jan_30_0938.csv
  #432 - 4 files
  #543543_beads_task_DtD_v2020_2020_Jan_30_0929.csv
  #hjkhjk - 3 files
  #nd05go08 - 3 files
  #RD08AV13_beads_task_DtD_v2020_2020_Jan_30_1217.csv
#The process of removing incomplete cases should be automated, as they will stop the script if they are included / new incomplete cases

path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task/" #Set to local path / directory of raw files for Ambiguity+Effort)
pattern <- "trials_2.csv"
DtDFiles <- list.files(path = path, pattern = pattern)
DtDFiles <- paste(path, DtDFiles, sep = "")
DtDN2 <- do.call(rbind, lapply(DtDFiles, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2]))))) #Some (at leaste one) values are one to high
pattern <- "trials_3.csv"
DtDFiles <- list.files(path = path, pattern = pattern)
DtDFiles <- paste(path, DtDFiles, sep = "")
DtDN3 <- do.call(rbind, lapply(DtDFiles, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2]))))) #Some (at leaste one) values are one to high
pattern <- "trials_4.csv"
DtDFiles <- list.files(path = path, pattern = pattern)
DtDFiles <- paste(path, DtDFiles, sep = "")
DtDN4 <- do.call(rbind, lapply(DtDFiles, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2]))))) #Some (at leaste one) values are one to high
pattern <- "trials.csv"
DtDFiles <- list.files(path = path, pattern = pattern)
DtDFiles <- paste(path, DtDFiles, sep = "")
DtDN1 <- do.call(rbind, lapply(DtDFiles, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2]))))) #Some (at leaste one) values are one to high
pattern <- "trials_5.csv"
DtDFiles <- list.files(path = path, pattern = pattern)
DtDFiles <- paste(path, DtDFiles, sep = "")
DtDN5 <- do.call(rbind, lapply(DtDFiles, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2]))))) #Some (at leaste one) values are one to high
DtDN <- cbind(DtDN1, DtDN2, DtDN3, DtDN4, DtDN5)

IDTemp <- list.files(path = path, pattern = pattern)
IDT <- sapply(strsplit(IDTemp, split='trials_5.csv', fixed=TRUE), function(x) (x[1]))
ID <- sapply(strsplit(IDTemp, split='_beads_task', fixed=TRUE), function(x) (x[1]))
row.names(DtDN) <- ID
colnavn <- c("BeadsDtD1","BeadsDtD2","BeadsDtD3","BeadsDtD4","BeadsDtD5")
colnames(DtDN) <- colnavn

write.csv(DtDN, "Cleaned data/BeadsTask.csv")