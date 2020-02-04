# Data cleaning -> For fast analysis of effort (correct and RT), DtD 3th bead (afaik, one unnumberd, then 2-5 numbered), Pv_a ambiguity
# All notes based on one random file from each task.
# All raw files are left untouched, in their original folder (after unzipping download from OSF)

# Beads counting
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


data1 <- read.csv("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort/FILE")
cnames <- c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5", "Trial 6", "Trial 7", "Trial 8", "Trial 9", "Trial 10", "Trial 1 RT", "Trial 2 RT", "Trial 3 RT", "Trial 4 RT", "Trial 5 RT", "Trial 6 RT", "Trial 7 RT", "Trial 8 RT", "Trial 9 RT", "Trial 10 RT")
Effort1 <- c(data1[126:135, "key_resp_6.corr"], data1[126:135, "key_resp_6.rt"])
Effort1Name <- data1[1, "participant"]
#rbind all data-points, add cnames, create c() all Effort*Name, add rnames


  # DtD 3th bead
    # Files at "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task"
    # Todo / Notes:
      # Optimal / Baysian probabilities needed, seq_1, 6040 set.
      # Participants draws a lot of beads, then stops, draws more, etc. Need a way to examine this.
      # Simply using numbers drawn, and response times is not enough, what if someone makes a terrible mistake, like after 15 beads still goes for the clearly less likely.

  # Ambiguity
    # Files at: "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort"
    # Todo / Notes:
      # Many response times are lower than 2sec, this should be impossible. Are all in realisty X_i + 2sec?
      # Ambiguity v. risk
      # 50% lottery vs. on-screen by RT
      # I have the presented amounts, however not the presented odds (excpt. what can be read from presented file-names)
      # Would be helpful to calculate the optimal, so one could classify diviation from the optimal for both risk and ambiguity, and then compare.
        # Also to see if RT increases (drastically) when they don't differ a lot, otherwise this could be a way to quantify a participants treshold.
