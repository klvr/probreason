#Data-cleaning Beads-task
#Files at "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task"
#Does contain some errors, as some CSV-files have the information in another column. Working on a fix.
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


#Extract answers
pattern <- "[0-9][0-9].csv"
AnswerFiles <- list.files(path = path, pattern = pattern)
AnswerFiles <- paste(path, AnswerFiles, sep="")
#Set up data-frames
BeadsChoice1 <- row.names(c("ID", "lengde", "tidperbox", "vartidperbox", "valg", "probest"))
BeadsChoice1 <- as.data.frame(BeadsChoice1)
BeadsChoice2 <- BeadsChoice1
BeadsChoice3 <- BeadsChoice1
BeadsChoice4 <- BeadsChoice1
BeadsChoice5 <- BeadsChoice1
#Extraction
for (i in AnswerFiles) {
  resp <- as.character(read.csv(i)[,37])
  respb <- sum(grepl("b", resp))
  respy <- sum(grepl("y", resp))
  Answer <- cbind(respb, respy)
  Answer <- replace(Answer, respb, "b")
  Answer <- replace(Answer, respy, "y")
  BeadsChoice1 <- rbind(BeadsChoice1, Answer)
  resp <- as.character(read.csv(i)[,55])
  respb <- sum(grepl("b", resp))
  respy <- sum(grepl("y", resp))
  Answer <- cbind(respb, respy)
  Answer <- replace(Answer, respb, "b")
  Answer <- replace(Answer, respy, "y")
  BeadsChoice2 <- rbind(BeadsChoice2, Answer)
  resp <- as.character(read.csv(i)[,67])
  respb <- sum(grepl("b", resp))
  respy <- sum(grepl("y", resp))
  Answer <- cbind(respb, respy)
  Answer <- replace(Answer, respb, "b")
  Answer <- replace(Answer, respy, "y")
  BeadsChoice3 <- rbind(BeadsChoice3, Answer)
  resp <- as.character(read.csv(i)[,79])
  respb <- sum(grepl("b", resp))
  respy <- sum(grepl("y", resp))
  Answer <- cbind(respb, respy)
  Answer <- replace(Answer, respb, "b")
  Answer <- replace(Answer, respy, "y")
  BeadsChoice4 <- rbind(BeadsChoice4, Answer)
  resp <- as.character(read.csv(i)[,91])
  respb <- sum(grepl("1", resp))
  respy <- sum(grepl("2", resp))
  Answer <- cbind(respb, respy)
  Answer <- replace(Answer, respb, "1")
  Answer <- replace(Answer, respy, "2")
  BeadsChoice5 <- rbind(BeadsChoice5, Answer)
}
BeadsChoice1 <- BeadsChoice1[1]
BeadsChoice2 <- BeadsChoice2[1]
BeadsChoice3 <- BeadsChoice3[1]
BeadsChoice4 <- BeadsChoice4[1]
BeadsChoice5 <- BeadsChoice5[1]
BeadsChoice <- cbind(BeadsChoice1,BeadsChoice2,BeadsChoice3,BeadsChoice4,BeadsChoice5)
BeadsTask <- cbind(DtDN, BeadsChoice)

colnavn <- c("BeadsDtD1","BeadsDtD2","BeadsDtD3","BeadsDtD4","BeadsDtD5", "BeadsChoice1","BeadsChoice2","BeadsChoice3","BeadsChoice4","BeadsChoice5")
colnames(BeadsTask) <- colnavn
write.csv(BeadsTask, "Cleaned data/BeadsTask.csv")