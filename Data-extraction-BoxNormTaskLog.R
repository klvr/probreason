#Data extraction Box(Norm)TaskLog - REDESIGNED
## Two manual fixes, see line 68-70 - Task not healthy, e.g., participant 304 lost a round, and got answer to trial 1 recorded for trial 2. Correctly(ish) recorded as NA, however others, e.g., 012, get things recorded even with error.

#Set-up
BoxTaskDtD <- row.names(c("ID", "DtD1", "DtD2", "DtD3", "DtD4"))
BoxTaskDtD <- as.data.frame(BoxTaskDtD)

#Fix of one filepath
BoxTaskPathLog

#Boxes and trials
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

#DtD extraction
for (i in BoxTaskPathLog) {
  test <- read.delim(i)
  colnames(test) <- c("time","EXP" ,"press")
  test$EXP <- as.character(test$EXP)
  test <- test[grep("Keypress:*", test$press)[[1]]:nrow(test),]
  seen <- as.character(test[grep("Mouse:  Left button up*",test$press)-1,3][grepl("box_*",as.character(test[grep("Mouse:  Left button up*",test$press)-1,3]))]) #Boxes seen
  seen <- gsub(":.*", "", seen)
  if(sum(seen=="box")==1) {seen[seen=="box"] <- "box_a"}
  DtD1 <- sum(seen %in% NormCol[NormCol[,3]==1,1])
  DtD2 <- sum(seen %in% NormCol[NormCol[,3]==2,1])
  DtD3 <- sum(seen %in% NormCol[NormCol[,3]==3,1])
  DtD4 <- sum(seen %in% NormCol[NormCol[,3]==4,1])
  id <- paste(head(strsplit((strsplit(i, split ="_boxtaskreg/")[[1]][2]), split="")[[1]], n=3), collapse="")
  DtDPart <- cbind(id, DtD1, DtD2, DtD3, DtD4)
  BoxTaskDtD <- rbind(BoxTaskDtD, DtDPart)
}

#As numeric
BoxTaskDtD[,2] <- as.numeric(as.character(BoxTaskDtD[,2]))
BoxTaskDtD[,3] <- as.numeric(as.character(BoxTaskDtD[,3]))
BoxTaskDtD[,4] <- as.numeric(as.character(BoxTaskDtD[,4]))
BoxTaskDtD[,5] <- as.numeric(as.character(BoxTaskDtD[,5]))

#Removed completely failed runs (0 opened boxes)
BoxTaskDtD <- BoxTaskDtD[(rowSums(BoxTaskDtD[,-1])!=0),]

#Naming
row.names(BoxTaskDtD) <- paste("X", BoxTaskDtD$id, sep = "")
BoxNormTaskLog <- BoxTaskDtD[,-1]
colnames(BoxNormTaskLog) <- c("BoxNormDtD1","BoxNormDtD2","BoxNormDtD3","BoxNormDtD4")

#Replace 0 with NA to avoid accidental summing without warning
BoxNormTaskLog[BoxNormTaskLog == 0] <- NA

#Remove temp variables
rm(BoxTaskDtD, DtDPart, NormCol, NormCol1, NormCol2, NormCol3, NormCol4, test, BoxTaskPathLog, DtD1, DtD2, DtD3, DtD4, i, id, seen, sequence, Trial)

#Writing CSV
write.csv(BoxNormTaskLog, paste(getwd(), "/Cleaned data/BoxNormTaskLog.csv", sep =""))
