# Data cleaning -> For fast analysis of effort (correct and RT), DtD 3th bead (afaik, one unnumberd, then 2-5 numbered), Pv_a ambiguity
# All raw files are left untouched, in their original folder (after unzipping download from OSF)

# Effort - Beads counting
  # Data clean-up
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
AEEffort <- do.call(rbind, (lapply(AEFiles, function(x) read.csv(x)[126:135,"key_resp_6.corr"])))
EAEffortRT <- do.call(rbind, (lapply(EAFiles, function(x) read.csv(x)[2:11,32])))
AEEffortRT <- do.call(rbind, (lapply(AEFiles, function(x) read.csv(x)[126:135,"key_resp_6.rt"])))
AEEffort <- cbind(AEEffort, AEEffortRT)
EAEffort <- cbind(EAEffort, EAEffortRT)
Effort <- rbind(AEEffort, EAEffort)
cnames <- c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5", "Trial 6", "Trial 7", "Trial 8", "Trial 9", "Trial 10", "Trial 1 RT", "Trial 2 RT", "Trial 3 RT", "Trial 4 RT", "Trial 5 RT", "Trial 6 RT", "Trial 7 RT", "Trial 8 RT", "Trial 9 RT", "Trial 10 RT", "Seq") #for seq: 1=AE, 0=EA
AEID <- AEID[-c(29,31)] #highly un-elegant solution. lappy above returns a list, with NULL values, however these are removed when stiched, and can´t seem to prevent this, so read manually.
EAID <- EAID[-1]
rnames <- c(AEID, EAID)
seq <- c(rep(1, length= length(AEID)), rep(0, length= length(EAID)))
Effort <- cbind(Effort, seq)
colnames(Effort) <- cnames
row.names(Effort) <- rnames
#Some analysis
plot(density(Effort[,11:20], na.rm = TRUE), main = "Time spent on each trial")
hist(Effort[,11:20], xlim=c(0,50), breaks=50, main = "Time spent on each trial")
median(Effort[,11:20], na.rm = TRUE)
library(d3heatmap)
x <- Effort[,1:10]
d3heatmap(x, Colv = NA,Rowv = NA, col = c("blue", "red"), scale="none", cexRow = 1,cexCol = 1)
mean(rowSums(x), na.rm=TRUE)
table(rowSums(x))
cor1 <- (cor(Effort[,1], Effort[,11], use = "complete.obs", method="spearman"))
cor2 <- (cor(Effort[,2], Effort[,12], use = "complete.obs", method="spearman"))
cor3 <- (cor(Effort[,3], Effort[,13], use = "complete.obs", method="spearman"))
cor4 <- (cor(Effort[,4], Effort[,14], use = "complete.obs", method="spearman"))
cor5 <- (cor(Effort[,5], Effort[,15], use = "complete.obs", method="spearman"))
cor6 <- (cor(Effort[,6], Effort[,16], use = "complete.obs", method="spearman"))
cor7 <- (cor(Effort[,7], Effort[,17], use = "complete.obs", method="spearman"))
cor8 <- (cor(Effort[,8], Effort[,18], use = "complete.obs", method="spearman"))
cor9 <- (cor(Effort[,9], Effort[,19], use = "complete.obs", method="spearman"))
cor10 <- (cor(Effort[,10], Effort[,20], use = "complete.obs", method="spearman"))
mean(rbind(cor1,cor2,cor3,cor4,cor5,cor6,cor7,cor8,cor9,cor10))

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
#Some exploring
hist(DtDN1, main = "85/15", ylim = c(0,40), xlim = c(0,20), breaks = 20, col = "darkred")
hist(DtDN2, main = "85/15", ylim = c(0,40), xlim = c(0,20), breaks = 20, col = "darkred")
hist(DtDN3, main = "40/60", ylim = c(0,40), xlim = c(0,20), breaks = 20, col = "darkred")
hist(DtDN4, main = "40/60", ylim = c(0,40), xlim = c(0,20), breaks = 20, col = "darkred")
hist(DtDN5, main = "85/15", ylim = c(0,40), xlim = c(0,20), breaks = 20, col = "darkred")

# Ambiguity
  # Files at: "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort"
  # Todo / Notes:
     # Many response times are lower than 2sec, this should be impossible. Are all in realisty X_i + 2sec?
     # Ambiguity v. risk
     # 50% lottery vs. on-screen by RT
     # I have the presented amounts, however not the presented odds (excpt. what can be read from presented file-names)
     # Would be helpful to calculate the optimal, so one could classify diviation from the optimal for both risk and ambiguity, and then compare.
        # Also to see if RT increases (drastically) when they don't differ a lot, otherwise this could be a way to quantify a participants treshold.

