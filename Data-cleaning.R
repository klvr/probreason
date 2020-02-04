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


# DtD 3th bead
  # Files at "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task"
  # Todo / Notes:
    # Optimal / Baysian probabilities needed, seq_1, 6040 set.
    # Participants draws a lot of beads, then stops, draws more, etc. Need a way to examine this.
    # Simply using numbers drawn, and response times is not enough, what if someone makes a terrible mistake, like after 15 beads still goes for the clearly less likely.
path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task/" #Set to local path / directory of raw files for Ambiguity+Effort)
pattern <- "trials_3.csv"
DtDFiles <- list.files(path = path, pattern = pattern)
DtDFiles <- paste(path, DtDFiles, sep = "")
DtDN <- do.call(rbind, lapply(DtDFiles, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2]))))) #Some (at leaste one) values are one to high

# Ambiguity
  # Files at: "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort"
  # Todo / Notes:
     # Many response times are lower than 2sec, this should be impossible. Are all in realisty X_i + 2sec?
     # Ambiguity v. risk
     # 50% lottery vs. on-screen by RT
     # I have the presented amounts, however not the presented odds (excpt. what can be read from presented file-names)
     # Would be helpful to calculate the optimal, so one could classify diviation from the optimal for both risk and ambiguity, and then compare.
        # Also to see if RT increases (drastically) when they don't differ a lot, otherwise this could be a way to quantify a participants treshold.

#Real values for DtD
# Draw: B, B, Y, Y B Y Y B B B B B Y B Y B B B Y B - Blue coded as 1, Y as 0
#1
Points <- 0.5
p_grid1 <- seq(from = 0, to = 1, length = 1000) #grid of 1000
prob_p1 <- rep(1, 1000) #flat prior
prob_data1 <- dbinom(1, size = 1, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#2
prob_data1 <- dbinom(2, size = 2, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#3
prob_data1 <- dbinom(2, size = 3, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#4
prob_data1 <- dbinom(2, size = 4, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#5
prob_data1 <- dbinom(3, size = 5, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#6
prob_data1 <- dbinom(3, size = 6, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#7
prob_data1 <- dbinom(3, size = 7, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#8
prob_data1 <- dbinom(4, size = 8, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#9
prob_data1 <- dbinom(5, size = 9, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#10
prob_data1 <- dbinom(6, size = 10, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#11
prob_data1 <- dbinom(7, size = 11, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#12
prob_data1 <- dbinom(8, size = 12, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#13
prob_data1 <- dbinom(8, size = 13, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#14
prob_data1 <- dbinom(9, size = 14, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#15
prob_data1 <- dbinom(9, size = 15, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#16
prob_data1 <- dbinom(10, size = 16, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#17
prob_data1 <- dbinom(11, size = 17, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#18
prob_data1 <- dbinom(12, size = 18, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#19
prob_data1 <- dbinom(12, size = 19, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
#20
prob_data1 <- dbinom(13, size = 20, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1 # taking the prior into account, not needed in this example
posteriornorm1 <- posterior1 / sum(posterior1) #normalizing
prob_p1 <- posteriornorm1
set.seed(100)
samples1 <- sample(p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
mean(samples1) #point estimate of the true proportion of water
quantile(samples1, probs = c(0.05, 0.95)) #95% CI
Temp <- cbind(mean(samples1), quantile(samples1, probs = c(0.05, 0.95)))
Points <- rbind(Points, Temp)
