#MathPsych relevant data
## Requires MasterScript to be ran first / all data avalible (task-seperated)
## Missing: Put inn BoxNormLog

#Getting IBO
source("Ideal Baysian Observer.R")

#Merging relevant data
MP <- merge(ARTEst, BeadsTwojarTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- merge(MP, BoxNormTaskXlsx, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- merge(MP, Cape, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

#Removing stuff not needed for MathPsych
MP <- MP[-c(3,6,8,9,11,12,14,15,17,18,20,21)]
MP <- MP[-c(11,12,13,16,17,18,21,22,23,26,27,28,31,32,33,36,37,38,41,42,43)]
MP <- MP[-c(25,26,27,30,31,32,35,36,37,40)]

#Calculate Overall DtD Beads, DtD 60/40, and DtD 8515
MP$BeadsTwojarDtDOverall <- rowSums(MP[c(5,6,7,8,9)])
seq <- seq(12,28,by=2)
MP$BeadsTwojarDtD8515 <- rowSums(MP[c(5,6,9)])
MP$BeadsTwojarDtD6040 <- rowSums(MP[c(7,8)])
#Calculate Overall DtD Box, limited, and no-limit
for (i in seq) { MP[,i] <- as.numeric(as.character((MP[,i]))) }
MP$BoxNormExtDtDOverall <- rowSums(MP[c(12,14,16,18,20,22,24,26,28)])
MP$BoxNormExtDtDNolimit <- rowSums(MP[c(12,14,16)])
MP$BoxNormExtDtDNLimit <- rowSums(MP[c(18,20,22,24,26,28)])

#Reversing Prob.est. so 10 always indicates the estimated probability in the objectivly true direction
seq <- seq(13,29,by=2)
for (i in seq) { MP[,i] <- as.numeric(as.character((MP[,i]))) }
seq <- seq(15,29,by=2)
for (i in seq) {MP[,i] <- 10-MP[,i] }
#Adding overall mean prob.est.
MP$BoxNormExtProbestOverall <- rowMeans(MP[(c(12,14,16,18,20,22,24,26,28)+1)])
MP$BoxNormExtProbestNolimit <- rowMeans(MP[(c(12,14,16)+1)])
MP$BoxNormExtProbestNLimit <- rowMeans(MP[(c(18,20,22,24,26,28)+1)])

#Use linear subjective value
MP <- MP[-c(3,4)]

#Beads - Add in IBO for when the decision was made
IO <- as.numeric()
for (i in MP$BeadsTwojarDtD1) {
  Trial <- as.numeric(ThresholdBeads[i,2])
  IO <- rbind(IO, Trial)
}
MP$BeadsTwojarIO1 <- IO
IO <- as.numeric()
for (i in MP$BeadsTwojarDtD2) {
  Trial <- as.numeric(ThresholdBeads[i,3])
  IO <- rbind(IO, Trial)
}
MP$BeadsTwojarIO2 <- IO
IO <- as.numeric()
for (i in MP$BeadsTwojarDtD3) {
  Trial <- as.numeric(ThresholdBeads[i,5])
  IO <- rbind(IO, Trial)
}
MP$BeadsTwojarIO3 <- IO
IO <- as.numeric()
for (i in MP$BeadsTwojarDtD4) {
  Trial <- as.numeric(ThresholdBeads[i,6])
  IO <- rbind(IO, Trial)
}
MP$BeadsTwojarIO4 <- IO
IO <- as.numeric()
for (i in MP$BeadsTwojarDtD5) {
  Trial <- as.numeric(ThresholdBeads[i,4])
  IO <- rbind(IO, Trial)
}
MP$BeadsTwojarIO5 <- IO
## Summarize
MP$BeadsTwojarIOOverall <- rowMeans(MP[c(38,39,40,41,42)])
MP$BeadsTwojarIO8515 <- rowMeans(MP[c(38,39,42)])
MP$BeadsTwojarIO6040 <- rowMeans(MP[c(40,41)])

#Box - Add in IO for when the decision was made
## No-limit
IO <- as.numeric()
for (i in MP$BoxNormExtDtD2) {
  Trial <- as.numeric(ThresholdBox12[i,1])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO2 <- IO  
IO <- as.numeric()
for (i in MP$BoxNormExtDtD3) {
  Trial <- as.numeric(ThresholdBox12[i,2])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO3 <- IO
IO <- as.numeric()
for (i in MP$BoxNormExtDtD4) {
  Trial <- as.numeric(ThresholdBox12[i,3])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO4 <- IO  
## Limit
IO <- as.numeric()
for (i in MP$BoxNormExtDtD5) {
  Trial <- as.numeric(ThresholdBox9[i,1])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO5 <- IO
IO <- as.numeric()
for (i in MP$BoxNormExtDtD6) {
  Trial <- as.numeric(ThresholdBox6[i,1])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO6 <- IO
IO <- as.numeric()
for (i in MP$BoxNormExtDtD7) {
  Trial <- as.numeric(ThresholdBox9[i,2])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO7 <- IO
IO <- as.numeric()
for (i in MP$BoxNormExtDtD8) {
  Trial <- as.numeric(ThresholdBox9[i,3])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO8 <- IO
IO <- as.numeric()
for (i in MP$BoxNormExtDtD9) {
  Trial <- as.numeric(ThresholdBox6[i,2])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO9 <- IO
IO <- as.numeric()
for (i in MP$BoxNormExtDtD10) {
  Trial <- as.numeric(ThresholdBox6[i,3])
  IO <- rbind(IO, Trial)
}
MP$BoxNormExtIO10 <- IO
MP$BoxNormExtIONolimit <- rowMeans(MP[c(46,47,48)])
MP$BoxNormExtIOLimit <- rowMeans(MP[c(49,50,51,52,53,54)])
MP$BoxNormExtIOOverall <- rowMeans(MP[c(46,47,48,49,50,51,52,53,54)])

write.csv(MP, file = paste(getwd(), "/Cleaned data/MPData.csv", sep =""))
