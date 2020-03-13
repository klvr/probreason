#Data-cleaning Beads-task
# DtD 3th bead
# Files at "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task"
# Todo / Notes:
# Include participant numbers
# Participants draws a lot of beads, then stops, draws more, etc. Need a way to examine this.
# Simply using numbers drawn, and response times is not enough, what if someone makes a terrible mistake, like after 15 beads still goes for the clearly less likely.
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
#DtDN <- cbind(DtDN1, DtDN2, DtDN3, DtDN4, DtDN5) #doesn't work before participant ID's are recorded for each