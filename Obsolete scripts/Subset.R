# Subset of All-data, for analysis
## Contains collapsed variables, and variables calculated.

SubAll <- All

#ART
## Remove ARTExp
SubAll <- SubAll[-c(4,5,6)]
## Z-transform
SubAll$ARTRiskLinear <- scale(SubAll$ARTRiskLinear)*-1 #Higher more avoidance
SubAll$ARTAmbigLinear <- scale(SubAll$ARTAmbigLinear)
SubAll$ARTInverseLinear <- scale(SubAll$ARTInverseLinear)
## Difference Risk v. Ambig
SubAll$ARTRankDiff <- (rank(SubAll$ARTRiskLinear)-rank(SubAll$ARTAmbigLinear)) #Positive number: More risk-aversive than Ambig-aversive (relativly speaking), Negative number: More ambig-aversive than risk-aversive
SubAll$ARTRankDiffAbs <- abs(SubAll$ARTRankDiff)
SubAll$ARTRankDiff <- scale(SubAll$ARTRankDiff)
SubAll$ARTRankDiffAbs <- scale(SubAll$ARTRankDiffAbs)

#OneJar
## Skewness - Batching
SubAll$BeadsOnejarSkewness <- rowMeans(SubAll[c(6,9,12,15)], na.rm=TRUE)
SubAll <- SubAll[-c(6,9,12,15)]
## Time between each bead draw
SubAll$BeadsOnejarRT <- rowMeans(SubAll[c(5,7,9,11)], na.rm=TRUE)
SubAll <- SubAll[-c(5,7,9,11)]
## DtD
SubAll$BeadsOnejarDtDOverall <- rowSums(SubAll[c(4,5,6,7)])
SubAll$BeadsOnejarDtD8515 <- rowSums(SubAll[c(4,5)])
SubAll$BeadsOnejarDtD6040 <- rowSums(SubAll[c(6,7)])
## IBO
IO <- as.numeric()
for (i in SubAll$BeadsOnejarDtD1) {
  Trial <- as.numeric(ThresholdBeads[i,1])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsOnejarDtD1 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsOnejarDtD2) {
  Trial <- as.numeric(ThresholdBeads[i,3])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsOnejarDtD2 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsOnejarDtD3) {
  Trial <- as.numeric(ThresholdBeads[i,5])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsOnejarDtD3 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsOnejarDtD4) {
  Trial <- as.numeric(ThresholdBeads[i,6])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsOnejarDtD4 <- IO
SubAll$BeadsOnejarIOOverall <-rowMeans(SubAll[c(4,5,6,7)], na.rm = TRUE)
SubAll$BeadsOnejarIO8515 <-rowMeans(SubAll[c(4,5)], na.rm = TRUE)
SubAll$BeadsOnejarIO6040 <-rowMeans(SubAll[c(6,7)], na.rm = TRUE)
SubAll <- SubAll[-c(4,5,6,7)]

#Tone
## Skewness - Batching
SubAll$BeadsToneSkewness <- rowMeans(SubAll[c(6,9,12,15)], na.rm=TRUE)
SubAll <- SubAll[-c(6,9,12,15)]
## Time between each bead draw
SubAll$BeadsToneRT <- rowMeans(SubAll[c(5,7,9,11)], na.rm=TRUE)
SubAll <- SubAll[-c(5,7,9,11)]
## DtD
SubAll$BeadsToneDtDOverall <- rowSums(SubAll[c(4,5,6,7)])
SubAll$BeadsToneDtD8515 <- rowSums(SubAll[c(4,5)])
SubAll$BeadsToneDtD6040 <- rowSums(SubAll[c(6,7)])
## IBO
IO <- as.numeric()
for (i in SubAll$BeadsToneDtD1) {
  Trial <- as.numeric(ThresholdBeads[i,1])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsToneDtD1 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsToneDtD2) {
  Trial <- as.numeric(ThresholdBeads[i,3])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsToneDtD2 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsToneDtD3) {
  Trial <- as.numeric(ThresholdBeads[i,5])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsToneDtD3 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsToneDtD4) {
  Trial <- as.numeric(ThresholdBeads[i,6])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsToneDtD4 <- IO
SubAll$BeadsToneIOOverall <-rowMeans(SubAll[c(4,5,6,7)], na.rm = TRUE)
SubAll$BeadsToneIO8515 <-rowMeans(SubAll[c(4,5)], na.rm = TRUE)
SubAll$BeadsToneIO6040 <-rowMeans(SubAll[c(6,7)], na.rm = TRUE)
SubAll <- SubAll[-c(4,5,6,7)]

#Twojar
## Skewness - Batching
SubAll$BeadsTwojarSkewness <- rowMeans(SubAll[c(6,9,12,15,18)], na.rm=TRUE)
SubAll <- SubAll[-c(6,9,12,15,18)]
## Time between each bead draw
SubAll$BeadsTwojarRT <- rowMeans(SubAll[c(5,7,9,11,13)], na.rm=TRUE)
SubAll <- SubAll[-c(5,7,9,11,13)]
## DtD
SubAll$BeadsTwojarDtDOverall <- rowSums(SubAll[c(4,5,6,7,8)])
SubAll$BeadsTwojarDtD8515 <- rowSums(SubAll[c(4,5,8)])
SubAll$BeadsTwojarDtD6040 <- rowSums(SubAll[c(6,7)])
## IBO
IO <- as.numeric()
for (i in SubAll$BeadsTwojarDtD1) {
  Trial <- as.numeric(ThresholdBeads[i,1])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsTwojarDtD1 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsTwojarDtD2) {
  Trial <- as.numeric(ThresholdBeads[i,3])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsTwojarDtD2 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsTwojarDtD3) {
  Trial <- as.numeric(ThresholdBeads[i,5])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsTwojarDtD3 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsTwojarDtD4) {
  Trial <- as.numeric(ThresholdBeads[i,6])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsTwojarDtD4 <- IO
IO <- as.numeric()
for (i in SubAll$BeadsTwojarDtD5) {
  Trial <- as.numeric(ThresholdBeads[i,4])
  IO <- rbind(IO, Trial)
}
SubAll$BeadsTwojarDtD5 <- IO
SubAll$BeadsTwojarIOOverall <-rowMeans(SubAll[c(4,5,6,7,8)], na.rm = TRUE)
SubAll$BeadsTwojarIO8515 <-rowMeans(SubAll[c(4,5,8)], na.rm = TRUE)
SubAll$BeadsTwojarIO6040 <-rowMeans(SubAll[c(6,7)], na.rm = TRUE)
SubAll <- SubAll[-c(4,5,6,7,8)]

#Box-2020
seq <- seq(15,65,1)
for (i in seq) {SubAll[,i] <- as.numeric(as.character(SubAll[,i]))}
## Skeweness
SubAll$BoxUnlimSkewness <- rowMeans(SubAll[c(22,27,32)], na.rm=TRUE)
SubAll$BoxLimSkewness <- rowMeans(SubAll[c(17,37,42,47,52,57,62)], na.rm=TRUE)
## Time
SubAll$BoxUnlimRT <- rowMeans(SubAll[c(21,26,31)], na.rm=TRUE)
SubAll$BoxLimRT <- rowMeans(SubAll[c(16,36,41,46,51,56,61)], na.rm=TRUE)
##DtD
SubAll$BoxDtDOverall <- rowSums(SubAll[c(15,20,25,30,35,40,45,50,55,60)])
SubAll$BoxDtDUnlim <- rowSums(SubAll[c(20,25,30)])
SubAll$BoxDtDLim <- rowSums(SubAll[c(15,35,40,45,50,55,60)])
##Probest
seq <- seq(29,64,5)
for (i in seq) {SubAll[,i] <- (SubAll[,i]-10)*-1}
seq <- seq(19,64,5)
for (i in seq) {
  SubAll[,i] <- replace(SubAll[,i], SubAll[,i]==4, 6)
  SubAll[,i] <- replace(SubAll[,i], SubAll[,i]==3, 7)
  SubAll[,i] <- replace(SubAll[,i], SubAll[,i]==2, 8)
  SubAll[,i] <- replace(SubAll[,i], SubAll[,i]==1, 9)
  SubAll[,i] <- replace(SubAll[,i], SubAll[,i]==0, 10) }
SubAll$BoxProbestOverall <- rowMeans(SubAll[c(19,24,29,34,39,44,49,54,59,64)], na.rm = TRUE)
SubAll$BoxProbestUnlim <- rowMeans(SubAll[c(24,29,34)], na.rm = TRUE)
SubAll$BoxProbestLim <- rowMeans(SubAll[c(19,39,44,49,54,59,64)], na.rm = TRUE)
SubAll <- SubAll[-c(16,17,18,19,21,22,23,24,26,27,28,29,31,32,33,34,36,37,38,39,41,42,43,44,46,47,48,49,51,52,53,54,56,57,58,59,61,62,63,64)]
##IO
## No-limit
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD2) {
  Trial <- as.numeric(ThresholdBox12[i,1])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD2 <- IO  
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD3) {
  Trial <- as.numeric(ThresholdBox12[i,2])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD3 <- IO
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD4) {
  Trial <- as.numeric(ThresholdBox12[i,3])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD4 <- IO  
## Limit
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD5) {
  Trial <- as.numeric(ThresholdBox9[i,1])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD5 <- IO
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD6) {
  Trial <- as.numeric(ThresholdBox6[i,1])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD6 <- IO
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD7) {
  Trial <- as.numeric(ThresholdBox9[i,2])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD7 <- IO
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD8) {
  Trial <- as.numeric(ThresholdBox9[i,3])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD8 <- IO
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD9) {
  Trial <- as.numeric(ThresholdBox6[i,2])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD9 <- IO
IO <- as.numeric()
for (i in SubAll$BoxNormExtDtD10) {
  Trial <- as.numeric(ThresholdBox6[i,3])
  IO <- rbind(IO, Trial)
}
SubAll$BoxNormExtDtD10 <- IO
SubAll$BoxIOOverall <- rowMeans(SubAll[c(15,16,17,18,19,20,21,22,23,24)], na.rm = TRUE)
SubAll$BoxIOLim <- rowMeans(SubAll[c(15,19,20,21,22,23,24)], na.rm = TRUE)
SubAll$BoxIOUnlim <- rowMeans(SubAll[c(16,17,18)], na.rm = TRUE)
SubAll <- SubAll[-c(15,16,17,18,19,20,21,22,23,24)]

write.csv(SubAll, paste(getwd(), "/Cleaned data/SubAll.csv", sep=""))

SubsubAll <- SubAll[-c(4,5,6,7,8,9,10,11,12,13,14)]
write.csv(SubsubAll, paste(getwd(), "/Cleaned data/SubsubAll.csv", sep=""))

