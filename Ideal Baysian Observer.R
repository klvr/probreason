# Ideale Baysian Observer
## Missing: 2018 extracted sequences and IBO for those

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

# Actual sequences Beads tasks
Seq1_8515 <- c(rep(1, 9), 0, rep(1,10))
Seq2_8515 <- c(rep(1, 16), 0, rep(1, 3))
Seq3_8515 <- c(1, 0, rep(1, 5), 0, rep(1, 3), 0, rep(1, 5), 0, 1, 1)
Seq1_6040 <- c(1, 1, 0, 0, 1, 0, 0, rep(1, 5), 0, 1, 0, 1, 1, 1, 0, 1)
Seq3_6040 <- c(0, rep(1, 3), 0, 1, 0, 1, 1, 0, 0, 1, 0, rep(1, 4), 0, 1, 0)
Seq4_8515 <- c(rep(1,7),0,rep(1,12))
AllBeadsSeq <- c("Seq1_8515", "Seq2_8515", "Seq3_8515","Seq4_8515", "Seq1_6040", "Seq3_6040")

# Actual sequences Box task (2020 fixed)
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

# Box
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

