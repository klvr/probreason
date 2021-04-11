# Ideale Baysian Observer for Free Sequence Box-tasks (i.e., relies on data to run)
# Run after masterscript/merging is done, and "Ideal Baysian Observer.R" (sic)

#2018
## Irreg
BoxIrregIBO <- All[,46:51]
BoxIrregIBO$BoxIrregChoices <- as.character(BoxIrregIBO$BoxIrregChoices)
BoxIrregIBO$BoxIrregSeq <- as.character(BoxIrregIBO$BoxIrregSeq)
BoxIrregIBO$BoxIrregDtD1 <- as.numeric(as.character(BoxIrregIBO$BoxIrregDtD1))
BoxIrregIBO$BoxIrregDtD2 <- as.numeric(as.character(BoxIrregIBO$BoxIrregDtD2))
BoxIrregIBO$BoxIrregDtD3 <- as.numeric(as.character(BoxIrregIBO$BoxIrregDtD3))
BoxIrregIBO$BoxIrregDtD4 <- as.numeric(as.character(BoxIrregIBO$BoxIrregDtD4))
BoxIrregIBO$BoxIrregIBODtD1 <- as.character(BoxIrregIBO$BoxIrregSeq)
BoxIrregIBO$BoxIrregIBODtD1 <- strsplit(BoxIrregIBO$BoxIrregIBODtD1, split=",")
BoxIrregIBO$BoxIrregIBODtD2 <- as.character(BoxIrregIBO$BoxIrregSeq)
BoxIrregIBO$BoxIrregIBODtD2 <- strsplit(BoxIrregIBO$BoxIrregIBODtD2, split=",")
BoxIrregIBO$BoxIrregIBODtD3 <- as.character(BoxIrregIBO$BoxIrregSeq)
BoxIrregIBO$BoxIrregIBODtD3 <- strsplit(BoxIrregIBO$BoxIrregIBODtD3, split=",")
BoxIrregIBO$BoxIrregIBODtD4 <- as.character(BoxIrregIBO$BoxIrregSeq)
BoxIrregIBO$BoxIrregIBODtD4 <- strsplit(BoxIrregIBO$BoxIrregIBODtD4, split=",")
BoxIrregIBO$BoxIrregIBOChoice1 <- as.character(BoxIrregIBO$BoxIrregChoices)
BoxIrregIBO$BoxIrregIBOChoice1 <- strsplit(BoxIrregIBO$BoxIrregIBOChoice1, split=",")
BoxIrregIBO$BoxIrregIBOChoice1[!is.na(BoxIrregIBO$BoxIrregIBOChoice1)] <- sapply(BoxIrregIBO$BoxIrregIBOChoice1[!is.na(BoxIrregIBO$BoxIrregIBOChoice1)], "[[",1)
BoxIrregIBO$BoxIrregIBOChoice2 <- as.character(BoxIrregIBO$BoxIrregChoices)
BoxIrregIBO$BoxIrregIBOChoice2 <- strsplit(BoxIrregIBO$BoxIrregIBOChoice2, split=",")
BoxIrregIBO$BoxIrregIBOChoice2[!is.na(BoxIrregIBO$BoxIrregIBOChoice2)] <- sapply(BoxIrregIBO$BoxIrregIBOChoice2[!is.na(BoxIrregIBO$BoxIrregIBOChoice2)], "[[",2)
BoxIrregIBO$BoxIrregIBOChoice3 <- as.character(BoxIrregIBO$BoxIrregChoices)
BoxIrregIBO$BoxIrregIBOChoice3 <- strsplit(BoxIrregIBO$BoxIrregIBOChoice3, split=",")
BoxIrregIBO$BoxIrregIBOChoice3[!is.na(BoxIrregIBO$BoxIrregIBOChoice3)] <- sapply(BoxIrregIBO$BoxIrregIBOChoice3[!is.na(BoxIrregIBO$BoxIrregIBOChoice3)], "[[",3)
BoxIrregIBO$BoxIrregIBOChoice4 <- as.character(BoxIrregIBO$BoxIrregChoices)
BoxIrregIBO$BoxIrregIBOChoice4 <- strsplit(BoxIrregIBO$BoxIrregIBOChoice4, split=",")
BoxIrregIBO$BoxIrregIBOChoice4[!is.na(BoxIrregIBO$BoxIrregIBOChoice4)] <- sapply(BoxIrregIBO$BoxIrregIBOChoice4[!is.na(BoxIrregIBO$BoxIrregIBOChoice4)], "[[",4)
BoxIrregIBO$BoxIrregIBODtD1 
BoxIrregIBO$BoxIrregIBODtD2
BoxIrregIBO$BoxIrregIBODtD3
BoxIrregIBO$BoxIrregIBODtD4





test <- BoxIrregIBO
test <- BoxIrregIBO[!is.na(BoxIrregIBO$BoxIrregIBODtD1),]
for (i in 1:nrow(test)){
  Trial1 <- test[i,7][[1]][1:test[i,1]]
  Trial2 <- test[i, 7][[1]][(1+test[i,1]):(test[i,1]+test[i,2])]
  Trial3 <- test[i, 7][[1]][(1+test[i,1]+test[i,2]):(test[i,1]+test[i,2]+test[i,3])]
  Trial4 <- test[i, 7][[1]][(1+test[i,1]+test[i,2]+test[i,3]):(test[i,1]+test[i,2]+test[i,3]+test[i,4])]
  Trial1 <- IrregCol[IrregCol[,1] %in% Trial1 ==TRUE,2]
  Trial2 <- IrregCol[IrregCol[,1] %in% Trial2 ==TRUE,2]
  Trial3 <- IrregCol[IrregCol[,1] %in% Trial3 ==TRUE,2]
  Trial4 <- IrregCol[IrregCol[,1] %in% Trial4 ==TRUE,2]
}


for (i in BoxIrregIBO[!is.na(BoxIrregIBO$BoxIrregIBODtD1),]) {test[i,"test"] <- test[i, 7][[1]][1:test[i,1]]}
test[80, 7][[1]][1:test[80,1]]
test[80, 7][[1]][(1+test[80,1]):(test[80,1]+test[80,2])]
test[80, 7][[1]][(1+test[80,1]+test[80,2]):(test[80,1]+test[80,2]+test[80,3])]
test[80, 7][[1]][(1+test[80,1]+test[80,2]+test[80,3]):(test[80,1]+test[80,2]+test[80,3]+test[80,4])]



##Yuppers
IrregCol[,1] <- paste("\"",IrregCol[,1],"\"",sep="")

seq <- seq(1,60,1)
for(x in grep(TRUE,!is.na(BoxIrregIBO[,7]))){
  for (i in seq) {BoxIrregIBO[x,7] <- sub(IrregCol[i,1],IrregCol[i,2], as.character(BoxIrregIBO[x,7]), fixed = TRUE)}}
for(x in grep(TRUE,!is.na(BoxIrregIBO[,8]))){
  for (i in seq) {BoxIrregIBO[x,8] <- sub(IrregCol[i,1],IrregCol[i,2], as.character(BoxIrregIBO[x,8]), fixed = TRUE)}}
for(x in grep(TRUE,!is.na(BoxIrregIBO[,9]))){
  for (i in seq) {BoxIrregIBO[x,9] <- sub(IrregCol[i,1],IrregCol[i,2], as.character(BoxIrregIBO[x,9]), fixed = TRUE)}}
for(x in grep(TRUE,!is.na(BoxIrregIBO[,10]))){
  for (i in seq) {BoxIrregIBO[x,10] <- sub(IrregCol[i,1],IrregCol[i,2], as.character(BoxIrregIBO[x,10]), fixed = TRUE)}}

for (x in grep(TRUE,!is.na(BoxIrregIBO[,7]))){ BoxIrregIBO[x,7] <- sum(as.numeric(strsplit(BoxIrregIBO[x,7][[1]], "\\D+")[[1]][-1])[1:BoxIrregIBO[x,1]])}
for (x in grep(TRUE,!is.na(BoxIrregIBO[,8]))){ BoxIrregIBO[x,8] <- sum(as.numeric(strsplit(BoxIrregIBO[x,8][[1]], "\\D+")[[1]][-1])[(BoxIrregIBO[x,1]+1):BoxIrregIBO[x,1]+BoxIrregIBO[x,2]])}
for (x in grep(TRUE,!is.na(BoxIrregIBO[,9]))){ BoxIrregIBO[x,9] <- sum(as.numeric(strsplit(BoxIrregIBO[x,9][[1]], "\\D+")[[1]][-1])[(BoxIrregIBO[x,2]+1):BoxIrregIBO[x,3]])}
for (x in grep(TRUE,!is.na(BoxIrregIBO[,10]))){ BoxIrregIBO[x,10] <- sum(as.numeric(strsplit(BoxIrregIBO[x,10][[1]], "\\D+")[[1]][-1])[(BoxIrregIBO[x,3]+1):BoxIrregIBO[x,4]])}




 
  ## Norm
BoxNormIBO <- All[,52:56]

#DON'T RUN CODE FROM UNDER HERE - ONLY FOR REUSE#
##############################################################

# Actual sequences Beads-tasks
Seq1_8515 <- c(rep(1, 9), 0, rep(1,10))
Seq2_8515 <- c(rep(1, 16), 0, rep(1, 3))
Seq3_8515 <- c(1, 0, rep(1, 5), 0, rep(1, 3), 0, rep(1, 5), 0, 1, 1)
Seq1_6040 <- c(1, 1, 0, 0, 1, 0, 0, rep(1, 5), 0, 1, 0, 1, 1, 1, 0, 1)
Seq3_6040 <- c(0, rep(1, 3), 0, 1, 0, 1, 1, 0, 0, 1, 0, rep(1, 4), 0, 1, 0)
Seq4_8515 <- c(rep(1,7),0,rep(1,12))
AllBeadsSeq <- c("Seq1_8515", "Seq2_8515", "Seq3_8515","Seq4_8515", "Seq1_6040", "Seq3_6040")

# Actual sequences Box-task (2020)
Seq_12_1 <- c(1,1,1,0,1,1,1,1,0,1,0,1) #0: Blue, 1: Red
Seq_12_2 <- c(0,1,0,1,0,0,1,0,1,0,1,0) #0: Yellow, 1: Green
Seq_12_3 <- c(0,0,1,0,1,0,1,0,0,1,0,0) #0: Purple, 1: White
Seq_6or9a_1 <- c(0,0,0,1,0,0,0,0,1) #0: Light blue, 1: Red
Seq_6or9a_2 <- c(1,0,0,1,0,0) #0: Yellow, 1: Light Green
Seq_6or9a_3 <- c(1,0,0,0,1,0,1,0,0) #0: Light purple, 1: Yellowish white
Seq_6or9b_1 <- c(0,1,0,1,0,1,0,1,0) #0: Red, 1: Green
Seq_6or9b_2 <- c(0,0,1,0,1,0) #0: Pink, 1: Green
Seq_6or9b_3 <- c(0,0,0,1,0,0) #0: Blue, 1: Light Yellow
AllBoxSeqUnlimit <- c("Seq_12_1","Seq_12_2","Seq_12_3")
AllBoxSeqLimit6 <- c("Seq_6or9a_2","Seq_6or9b_2","Seq_6or9b_3")
AllBoxSeqLimit9  <- c("Seq_6or9a_1","Seq_6or9a_3","Seq_6or9b_1")

# Beads
## BF/MAP between the two competing hypothesis (i.e., correct jar vs. wrong jar), using evidence for 1 / evidence for 1+2
ThresholdBeads <- as.numeric()
for (i in AllBeadsSeq) {
  seq <- eval(parse(text = i))
  seq <- cumsum(seq)
  lengde <- seq(1, length(seq), by = 1)
  low <- (as.numeric(unlist(strsplit(i, "_[0-9][0-9]"))[2]) / 100)
  high <- 1-low
  Threshold <- (dbinom(seq, lengde, prob = high) / (dbinom(seq, lengde, prob = low)+dbinom(seq, lengde, prob = high)))
  ThresholdBeads <- cbind(ThresholdBeads, Threshold)
}
colnames(ThresholdBeads) <- AllBeadsSeq

# Box-fixed sequence
## Combinatorics, yields a number between 0 and 1, where 1 is IO can make a certain choice
ThresholdBox12 <- as.numeric()
for (i in AllBoxSeqUnlimit) {
  seq <- eval(parse(text = i))
  if(sum(seq)/length(seq) < .5) {seq <- ((seq*-1)+1)}
  probl <- 6
  probh <- 6
  problow <- probl - cumsum(seq)
  probhigh <- probh - cumsum((seq*-1)+1)
  ThresholdSeq <- probhigh / (probhigh+problow)
  ThresholdSeq <- replace(ThresholdSeq, ThresholdSeq>1, 1)
  ThresholdBox12 <- cbind(ThresholdBox12, ThresholdSeq)
}
colnames(ThresholdBox12) <- AllBoxSeqUnlimit
ThresholdBox9 <- as.numeric()
for (i in AllBoxSeqLimit9) {
  seq <- eval(parse(text = i))
  if(sum(seq)/length(seq) < .5) {seq <- ((seq*-1)+1)}
  probl <- 6
  probh <- 6
  problow <- probl - cumsum(seq)
  probhigh <- probh - cumsum((seq*-1)+1)
  ThresholdSeq <- probhigh / (probhigh+problow)
  ThresholdSeq <- replace(ThresholdSeq, ThresholdSeq>1, 1)
  ThresholdBox9 <- cbind(ThresholdBox9, ThresholdSeq)
}
colnames(ThresholdBox9) <- AllBoxSeqLimit9
ThresholdBox6 <- as.numeric()
for (i in AllBoxSeqLimit6) {
  seq <- eval(parse(text = i))
  if(sum(seq)/length(seq) < .5) {seq <- ((seq*-1)+1)}
  probl <- 6
  probh <- 6
  problow <- probl - cumsum(seq)
  probhigh <- probh - cumsum((seq*-1)+1)
  ThresholdSeq <- probhigh / (probhigh+problow)
  ThresholdSeq <- replace(ThresholdSeq, ThresholdSeq>1, 1)
  ThresholdBox6 <- cbind(ThresholdBox6, ThresholdSeq)
}
colnames(ThresholdBox6) <- AllBoxSeqLimit6

#Box free sequence recoding
## Irreg
### Trial1
sequence <- c(0,0,0,1,0,0,0,0,0,0,1,0,0,0,1)
IrregCol1 <- paste(rep("box_",15),seq(1,15,1),sep="")
IrregCol1 <- cbind(IrregCol1,sequence)
### Trial2
sequence <- c(1,1,1,1,1,0,1,1,1,0,1,1,0,1,1)
IrregCol2 <- paste(rep("box_",15),seq(60,74,1),sep="")
IrregCol2 <- cbind(IrregCol2, sequence)
### Trial3
sequence <- c(1,0,1,1,0,1,0,1,0,1,1,0,0,1,1)
IrregCol3 <- paste(rep("box_",15),seq(75,89,1),sep="")
IrregCol3 <- cbind(IrregCol3,sequence)
### Trial4
sequence <- c(1,0,0,1,0,0,1,0,0,0,1,0,0,0,1)
IrregCol4 <- paste(rep("box_",15),seq(90,104,1),sep="")
IrregCol4 <- cbind(IrregCol4, sequence)
## Norm
### Trial1
sequence <- c(0,0,0,1,0,0,0,0,0,0,1,0,0,0,1)
NormCol1 <- paste(rep("box_",15),seq(1,15,1),sep="")
NormCol1 <- cbind(NormCol1, sequence)
### Trial2
sequence <- c(1,1,1,1,1,0,1,1,1,0,1,1,0,1,1)
NormCol2 <- c("box",paste(rep("box_",14),seq(16,29,1),sep=""))
NormCol2 <- cbind(NormCol2, sequence)
### Trial3
sequence <- c(1,0,1,1,0,1,0,1,0,1,1,0,0,1,1)
NormCol3 <- paste(rep("box_",15),seq(30,44,1),sep="")
NormCol3 <- cbind(NormCol3, sequence)
### Trial4
sequence <- c(1,0,0,1,0,0,1,0,0,0,1,0,0,0,1)
NormCol4 <- paste(rep("box_",15),seq(45,59,1),sep="")
NormCol4 <- cbind(NormCol4, sequence)

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

