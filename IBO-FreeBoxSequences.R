#Recoding of sequences for Box2018

##Load all potential sequences for 8515
Seq8515 <- read.csv('0.85_0.15_Sequences.csv')
Seq8515 <- Seq8515[,-1]
colnames(Seq8515) <- NULL
for (i in 1:ncol(Seq8515)) {
  Seq8515[,i] <- as.character(Seq8515[,i])
  Seq8515[,i] <- replace(Seq8515[,i], Seq8515[,i]=="True", 1)
  Seq8515[,i] <- replace(Seq8515[,i], Seq8515[,i]=="False", 0)
  Seq8515[,i] <- as.numeric(Seq8515[,i])
}

##Load all potential sequences for 6040
Seq6040 <- read.csv('0.6_0.4_Sequences.csv')
Seq6040 <- Seq6040[,-1]
colnames(Seq6040) <- NULL
for (i in 1:ncol(Seq6040)) {
  Seq6040[,i] <- as.character(Seq6040[,i])
  Seq6040[,i] <- replace(Seq6040[,i], Seq6040[,i]=="True", 1)
  Seq6040[,i] <- replace(Seq6040[,i], Seq6040[,i]=="False", 0)
  Seq6040[,i] <- as.numeric(Seq6040[,i])
}

##IBOs for 8515
ExSeq <- c(rep(0, times = IBO[135,18]-IBO[135,32]),rep(1, times = IBO[135,32]))
ExSeqR <- (ExSeq*-1)+1
ExSeq <- as.data.frame(rbind(ExSeq))
ExSeqR <- as.data.frame(rbind(ExSeqR))
RedSeq <- Seq8515[,1:(length(ExSeq))]
Stop1 <- mean(Seq8515[,1])
if (ncol(ExSeq)==1) {print(Stop1)} else {
sum <- NULL
sumR <- NULL
for (i in 1:nrow(Seq8515)) {
  tf <- rowSums(ExSeq == RedSeq[i,])==length(ExSeq)
  sum <- c(sum,tf)
  tfR <- rowSums(ExSeqR == RedSeq[i,])==length(ExSeqR)
  sumR <- c(sumR, tfR)
}
sum <- sum(sum)
sumR <- sum(sumR)
if (sum > sumR) {sum/(sum+sumR)} else {sumR/(sum+sumR)}
}

##IBOs for 6040
ExSeq <- c(rep(0, times = IBO[135,18]-IBO[135,32]),rep(1, times = IBO[135,32]))
ExSeqR <- (ExSeq*-1)+1
ExSeq <- as.data.frame(rbind(ExSeq))
ExSeqR <- as.data.frame(rbind(ExSeqR))
RedSeq <- Seq6040[,1:(length(ExSeq))]
Stop1 <- mean(Seq6040[,1])
if (ncol(ExSeq)==1) {print(Stop1)} else {
  sum <- NULL
  sumR <- NULL
  for (i in 1:nrow(Seq6040)) {
    tf <- rowSums(ExSeq == RedSeq[i,])==length(ExSeq)
    sum <- c(sum,tf)
    tfR <- rowSums(ExSeqR == RedSeq[i,])==length(ExSeqR)
    sumR <- c(sumR, tfR)
  }
  sum <- sum(sum)
  sumR <- sum(sumR)
  if (sum > sumR) {sum/(sum+sumR)} else {sumR/(sum+sumR)}
}

#Sequences:
for (i in 1:nrow(IBO)) {
  if(is.na(IBO[i,19]) + is.na(IBO[i,33]) == 0){
    if(IBO[i,19] == 0){Seq1 <- NULL} else {Seq1 <- rep(0, times = IBO[i,19])}
    if(IBO[i,33] == 0){Seq2 <- NULL} else {Seq2 <- rep(1, times = IBO[i,33])}
    ExSeq <- c(Seq1,Seq2)
    print(ExSeq)
  }
}