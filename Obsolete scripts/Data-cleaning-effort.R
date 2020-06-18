#Data-cleaning Effort-task
#Manually removed the fdsfdsfds-participant file, as this created a lot of trouble
#In the script, ghgj, htr645 and 56yg are removed as well. Important to leave those files in(!) however the
#solution I've gone for is not very good, as any additional data would destroy this.
#In the future incomplete data should be removed in the script, and not manually, but works _for now_.

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
AEEffortRat <- do.call(rbind, (lapply(AEFiles, function(x) read.csv(x)[126:135,"rating_2.response"])))
EAEffortRat <- do.call(rbind, (lapply(EAFiles, function(x) read.csv(x)[2:11,37])))
AEEffort <- cbind(AEEffort, AEEffortRT, AEEffortRat)
EAEffort <- cbind(EAEffort, EAEffortRT, EAEffortRat)
Effort <- rbind(AEEffort, EAEffort)
cnames <- c("EffortChoice1", "EffortChoice2", "EffortChoice3", "EffortChoice4", "EffortChoice5", "EffortChoice6", "EffortChoice7", "EffortChoice8", "EffortChoice9", "EffortChoice10", "EffortRT1", "EffortRT2", "EffortRT3", "EffortRT4", "EffortRT5", "EffortRT6", "EffortRT7", "EffortRT8", "EffortRT9", "EffortRT10","EffortRate1","EffortRate2","EffortRate3","EffortRate4","EffortRate5","EffortRate6","EffortRate7","EffortRate8","EffortRate9","EffortRate10", "EffortSeq") #for seq: 1=AE, 0=EA
AEID <- AEID[-c(29,31)] #highly un-elegant solution. lappy above returns a list, with NULL values, however these are removed when stiched, and can´t seem to prevent this, so read manually.
EAID <- EAID[-1]
rnames <- c(AEID, EAID)
seq <- c(rep(1, length= length(AEID)), rep(0, length= length(EAID)))
Effort <- cbind(Effort, seq)
colnames(Effort) <- cnames
row.names(Effort) <- rnames
write.csv(Effort, file="Cleaned data/EffortTask.csv")