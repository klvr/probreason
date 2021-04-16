# Ideale Baysian Observer
# Run after masterscript/merging is done
# Run before IBO Free Sequence (relient on data, and variables from here)

# 2018
## One Jar
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040
## Tone
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040
## Two Jars
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040, Seq4_8515
## Box Irreg
### Free sequence (extracted)
## Box Norm
### Free sequence (extracted)
# 2020
## Two Jars
### Seq2_8515, Seq3_8515, Seq1_6040, Seq3_6040, Seq4_8515
## Box Norm
### colour_sequences_12 (3 seqs), colour_sequences_6or9_a (3 seqs), colour_sequences_6or9_b (3 seqs)

# Set up replacement data.frame
IBO <- All[,c(7,10,13,16,19,22,25,28,31,34,37,40,43,46,47,48,49,52,53,54,55,57,62,67,72,77,82,87,92,97,102)]
for (i in 1:ncol(IBO)) {IBO[,i] <- as.numeric(as.character(IBO[,i]))}

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

# Replace DtD with I(B)O in IBO data.frame (for all Beads-tasks, and fixed sequence Box-tasks [free sequence in IBO-FreeSequenceBox.R])
for (i in 1:length(IBO[,1])){
  IBO[i,1] <- ThresholdBeads[IBO[i,1],1]
  IBO[i,2] <- ThresholdBeads[IBO[i,2],2]
  IBO[i,3] <- ThresholdBeads[IBO[i,3],5]
  IBO[i,4] <- ThresholdBeads[IBO[i,4],6]
  IBO[i,5] <- ThresholdBeads[IBO[i,5],1]
  IBO[i,6] <- ThresholdBeads[IBO[i,6],2]
  IBO[i,7] <- ThresholdBeads[IBO[i,7],5]
  IBO[i,8] <- ThresholdBeads[IBO[i,8],6]
  IBO[i,9] <- ThresholdBeads[IBO[i,9],1]
  IBO[i,10] <- ThresholdBeads[IBO[i,10],2]
  IBO[i,11] <- ThresholdBeads[IBO[i,11],5]
  IBO[i,12] <- ThresholdBeads[IBO[i,12],6]
  IBO[i,13] <- ThresholdBeads[IBO[i,13],4]
  IBO[i,23] <- ThresholdBox12[IBO[i,23],1]
  IBO[i,24] <- ThresholdBox12[IBO[i,24],2]
  IBO[i,25] <- ThresholdBox12[IBO[i,25],3]
  IBO[i,26] <- ThresholdBox9[IBO[i,26],1]
  IBO[i,27] <- ThresholdBox6[IBO[i,27],1]
  IBO[i,28] <- ThresholdBox9[IBO[i,28],2]
  IBO[i,29] <- ThresholdBox9[IBO[i,29],3]
  IBO[i,30] <- ThresholdBox6[IBO[i,30],2]
  IBO[i,31] <- ThresholdBox6[IBO[i,31],3]
}


#Box free sequence recoding
## Irreg
### Trial1
sequence <- c(0,0,0,1,0,0,0,0,0,0,1,0,0,0,1)
Trial <- rep(1,15)
IrregCol1 <- paste(rep("box_",15),seq(1,15,1),sep="")
IrregCol1 <- cbind(IrregCol1,sequence, Trial)
### Trial2
sequence <- c(1,1,1,1,1,0,1,1,1,0,1,1,0,1,1)
Trial <- rep(2,15)
IrregCol2 <- paste(rep("box_",15),seq(60,74,1),sep="")
IrregCol2 <- cbind(IrregCol2, sequence, Trial)
### Trial3
sequence <- c(1,0,1,1,0,1,0,1,0,1,1,0,0,1,1)
Trial <- rep(3,15)
IrregCol3 <- paste(rep("box_",15),seq(75,89,1),sep="")
IrregCol3 <- cbind(IrregCol3,sequence, Trial)
### Trial4
sequence <- c(1,0,0,1,0,0,1,0,0,0,1,0,0,0,1)
Trial <- rep(4,15)
IrregCol4 <- paste(rep("box_",15),seq(90,104,1),sep="")
IrregCol4 <- cbind(IrregCol4, sequence, Trial)
### All
IrregCol <- rbind(IrregCol1,IrregCol2,IrregCol3,IrregCol4)
## Norm
### Trial1
sequence <- c(0,0,0,1,0,0,0,0,0,0,1,0,0,0,1)
Trial <- rep(1,15)
NormCol1 <- paste(rep("box_",15),seq(1,15,1),sep="")
NormCol1 <- cbind(NormCol1, sequence, Trial)
### Trial2
sequence <- c(1,1,1,1,1,0,1,1,1,0,1,1,0,1,1)
Trial <- rep(2,15)
NormCol2 <- c("box_a",paste(rep("box_",14),seq(16,29,1),sep=""))
NormCol2 <- cbind(NormCol2, sequence, Trial)
### Trial3
sequence <- c(1,0,1,1,0,1,0,1,0,1,1,0,0,1,1)
Trial <- rep(3,15)
NormCol3 <- paste(rep("box_",15),seq(30,44,1),sep="")
NormCol3 <- cbind(NormCol3, sequence, Trial)
### Trial4
sequence <- c(1,0,0,1,0,0,1,0,0,0,1,0,0,0,1)
Trial <- rep(4,15)
NormCol4 <- paste(rep("box_",15),seq(45,59,1),sep="")
NormCol4 <- cbind(NormCol4, sequence, Trial)
### All
NormCol <- rbind(NormCol1, NormCol2, NormCol3, NormCol4)

rm(list = c("AllBeadsSeq", "AllBoxSeqLimit6", "AllBoxSeqLimit9", "AllBoxSeqUnlimit", "high", "i", "lengde", "low", "probh", "probhigh", "probl", "problow", "seq", "Seq_12_1", "Seq_12_2", "Seq_12_3", "Seq_6or9a_1","Seq_6or9a_2","Seq_6or9a_3","Seq_6or9b_1","Seq_6or9b_2","Seq_6or9b_3", "sequence", "Threshold", "ThresholdSeq", "Seq1_6040", "Seq1_8515", "Seq2_8515", "Seq3_6040", "Seq3_8515", "Seq4_8515", "IrregCol1","IrregCol2","IrregCol3","IrregCol4","NormCol1","NormCol2","NormCol3","NormCol4"))
  
  
