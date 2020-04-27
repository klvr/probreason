# Quick prep for analysis-script

#Load all cleaned data-files
ART <- read.csv("Cleaned data/ART.csv")
FDNfCS <- read.csv("Cleaned data/5DCuriosity and NfCS.csv")
BeadsTask <- read.csv("Cleaned data/BeadsTask.csv")
BoxTask <- read.csv("Cleaned data/BoxTask.csv")
CAPEPAQ <- read.csv("Cleaned data/music_data.csv")

#Prep ART
ART <- ART[-1]
cnamesart <- c("ID", "Risk Attitude", "Ambiguity Attitude", "Inverse temperature")
colnames(ART) <- cnamesart

#Prep 5DCuriosity and NfCS, missing sum-score 5DC
FDNfCS <- FDNfCS[-1]
NfCS <- rowSums(FDNfCS[27:41])
FDNfCS <- cbind(FDNfCS, NfCS)
NFCS <- cbind(FDNfCS[1], NfCS)

#Prep BeadsTask
BeadsTask <- BeadsTask[-c(7:11)]
BeadsTask[2:6] <- lapply(BeadsTask[2:6], as.numeric)
BeadsTask <- cbind(BeadsTask, rowSums(BeadsTask[2:6]))
colnames(BeadsTask) <- c("ID", "BeadsDtD1", "BeadsDtD2", "BeadsDtD3", "BeadsDtD4", "BeadsDtD5", "BeadsDtDTotal")

#Prep BoxTask
BoxTask <- BoxTask[-c(12:51)]
BoxDtDUnlimTotal <- rowSums(BoxTask[c(3,4,5)])
BoxDtDLimTotal <- rowSums(BoxTask[c(6:11)])
BoxTask <- cbind(BoxTask, BoxDtDLimTotal, BoxDtDUnlimTotal)
BoxTask <- BoxTask[c(1,12,13)]
colnames(BoxTask) <- c("ID", "BoxDtDLimTotal", "BoxDtDUnlimTotal")

#Prep CAPE-P and AQ
CAPEPAQ <- CAPEPAQ[-c(1,3:13)]
CAPEP <- rowSums(CAPEPAQ[2:24])
AQ <- rowSums(CAPEPAQ[25:52])
CAPEPAQID <- as.data.frame(CAPEPAQ[1])
CAPEPAQ <- cbind(CAPEPAQID, CAPEP, AQ)

All <- merge(ART, BeadsTask, by = 1, all.x = TRUE, all.y = TRUE)
All <- merge(All, BoxTask, by = 1, all.x = TRUE, all.y = TRUE)
All <- merge(All, CAPEPAQ, by = 1, all.x = TRUE, all.y = TRUE)
All <- merge(All, NFCS, by = 1, all.x = TRUE, all.y = TRUE)

write.csv(All, "Cleaned data/QuickMerge.csv")
