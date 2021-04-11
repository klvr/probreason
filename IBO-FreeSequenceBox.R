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
test <- BoxIrregIBO
test <- BoxIrregIBO[!is.na(BoxIrregIBO$BoxIrregIBODtD1),]
BoxIrregIBO <- BoxIrregIBO[!is.na(BoxIrregIBO$BoxIrregIBODtD1),]
BoxIrregIBORow <- as.numeric()
BoxIrregIBOCol <- as.numeric()
for (i in 1:nrow(test)){
  Trial1 <- test[i,7][[1]][1:test[i,1]]
  Trial2 <- test[i, 7][[1]][(1+test[i,1]):(test[i,1]+test[i,2])]
  Trial3 <- test[i, 7][[1]][(1+test[i,1]+test[i,2]):(test[i,1]+test[i,2]+test[i,3])]
  Trial4 <- test[i, 7][[1]][(1+test[i,1]+test[i,2]+test[i,3]):(test[i,1]+test[i,2]+test[i,3]+test[i,4])]
  Trial1 <- IrregCol[IrregCol[,1] %in% Trial1 ==TRUE,2]
  Trial2 <- IrregCol[IrregCol[,1] %in% Trial2 ==TRUE,2]
  Trial3 <- IrregCol[IrregCol[,1] %in% Trial3 ==TRUE,2]
  Trial4 <- IrregCol[IrregCol[,1] %in% Trial4 ==TRUE,2]
  Trial1IBO <- dbinom(sum(as.numeric(Trial1)), length(as.numeric(Trial1)), prob = 0.85) / (dbinom(sum(as.numeric(Trial1)), length(as.numeric(Trial1)), prob = 0.85) + dbinom(sum(as.numeric(Trial1)), length(as.numeric(Trial1)), prob = 0.15))
  Trial2IBO <- dbinom(sum(as.numeric(Trial2)), length(as.numeric(Trial2)), prob = 0.85) / (dbinom(sum(as.numeric(Trial2)), length(as.numeric(Trial2)), prob = 0.85) + dbinom(sum(as.numeric(Trial2)), length(as.numeric(Trial2)), prob = 0.15))
  Trial3IBO <- dbinom(sum(as.numeric(Trial3)), length(as.numeric(Trial3)), prob = 0.60) / (dbinom(sum(as.numeric(Trial3)), length(as.numeric(Trial3)), prob = 0.60) + dbinom(sum(as.numeric(Trial3)), length(as.numeric(Trial3)), prob = 0.40))
  Trial4IBO <- dbinom(sum(as.numeric(Trial4)), length(as.numeric(Trial4)), prob = 0.60) / (dbinom(sum(as.numeric(Trial4)), length(as.numeric(Trial4)), prob = 0.60) + dbinom(sum(as.numeric(Trial4)), length(as.numeric(Trial4)), prob = 0.40))
  if(Trial1IBO < 0.5) {Trial1IBO <- (1-Trial1IBO)}
  if(Trial2IBO < 0.5) {Trial2IBO <- (1-Trial2IBO)}
  if(Trial3IBO < 0.5) {Trial3IBO <- (1-Trial3IBO)}
  if(Trial4IBO < 0.5) {Trial4IBO <- (1-Trial4IBO)}
  BoxIrregIBORow <- cbind(length(Trial1), length(Trial2), length(Trial3), length(Trial4), sum(as.numeric(Trial1)), sum(as.numeric(Trial2)), sum(as.numeric(Trial3)), sum(as.numeric(Trial4)), Trial1IBO, Trial2IBO, Trial3IBO, Trial4IBO)
  BoxIrregIBOCol <- rbind(BoxIrregIBOCol, BoxIrregIBORow)
}
colnames(BoxIrregIBOCol) <- c("BoxIrregDtD1","BoxIrregDtD2","BoxIrregDtD3","BoxIrregDtD4","BoxIrregOneColObs1", "BoxIrregOneColObs2", "BoxIrregOneColObs3", "BoxIrregOneColObs4", "BoxIrregIBO1","BoxIrregIBO2","BoxIrregIBO3","BoxIrregIBO4") 
IBO[!is.na(IBO[,14]),14] <- BoxIrregIBOCol[,9]
IBO[!is.na(IBO[,14]),15] <- BoxIrregIBOCol[,10]
IBO[!is.na(IBO[,14]),16] <- BoxIrregIBOCol[,11]
IBO[!is.na(IBO[,14]),17] <- BoxIrregIBOCol[,12]

