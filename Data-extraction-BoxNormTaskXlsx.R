#Data extraction Box(Norm)TaskXlsx

path <- BoxTaskPathXlsx

#Create BoxTask-sheets
BoxTask <- row.names(c("ID", "lengde", "tidperbox", "vartidperbox", "valg", "probest"))
BoxTask <- as.data.frame(BoxTask)
BoxTask1 <- BoxTask
BoxTask2 <- BoxTask
BoxTask3 <- BoxTask
BoxTask4 <- BoxTask
BoxTask6 <- BoxTask
BoxTask7 <- BoxTask
BoxTask8 <- BoxTask
BoxTask10 <- BoxTask
BoxTask11 <- BoxTask
BoxTask12 <- BoxTask
NFCC <- row.names(c("ID", "NFCC"))
NFCC <- as.data.frame(NFCC)
FDim <- row.names(c("ID", "FDTot", "FDJoy", "FDDep", "FDStress", "FDSocial", "FDThrill"))
FDim <- as.data.frame(FDim)

#Extract from xlsx-files
for (i in path) {
  try({
  print(i)
  pathspes <- i
  #Sheet 1
  lengde <- length(read.xlsx(pathspes, sheet=1)[,5])
  if (lengde == 4) {lengde <- 3}
  tidperbox <- mean((read.xlsx(pathspes, sheet=1)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=1)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=1)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=1)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask1 <- rbind(BoxTask1,Run)
  #Sheet 2
  lengde <- length(read.xlsx(pathspes, sheet=2)[,5])
  if (lengde == 13) {lengde <- 12}
  tidperbox <- mean((read.xlsx(pathspes, sheet=2)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=2)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=2)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=2)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask2 <- rbind(BoxTask2,Run)
  #Sheet 3
  lengde <- length(read.xlsx(pathspes, sheet=3)[,5])
  if (lengde == 13) {lengde <- 12}
  tidperbox <- mean((read.xlsx(pathspes, sheet=3)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=3)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=3)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=3)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask3 <- rbind(BoxTask3,Run)
  #Sheet 4
  lengde <- length(read.xlsx(pathspes, sheet=4)[,5])
  if (lengde == 13) {lengde <- 12}
  tidperbox <- mean((read.xlsx(pathspes, sheet=4)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=4)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=4)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=4)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask4 <- rbind(BoxTask4,Run)
  #Sheet 6
  lengde <- length(read.xlsx(pathspes, sheet=6)[,5])
  if (lengde == 10) {lengde <- 9}
  tidperbox <- mean((read.xlsx(pathspes, sheet=6)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=6)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=6)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=6)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask6 <- rbind(BoxTask6,Run)
  #Sheet 7
  lengde <- length(read.xlsx(pathspes, sheet=7)[,5])
  if (lengde == 7) {lengde <- 6}
  tidperbox <- mean((read.xlsx(pathspes, sheet=7)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=7)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=7)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=7)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask7 <- rbind(BoxTask7,Run)
  #Sheet 8
  lengde <- length(read.xlsx(pathspes, sheet=8)[,5])
  if (lengde == 10) {lengde <- 9}
  tidperbox <- mean((read.xlsx(pathspes, sheet=8)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=8)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=8)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=8)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask8 <- rbind(BoxTask8,Run)
  #Sheet 10
  lengde <- length(read.xlsx(pathspes, sheet=10)[,5])
  if (lengde == 10) {lengde <- 9}
  tidperbox <- mean((read.xlsx(pathspes, sheet=10)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=10)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=10)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=10)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask10 <- rbind(BoxTask10,Run)
  #Sheet 11
  lengde <- length(read.xlsx(pathspes, sheet=11)[,5])
  if (lengde == 7) {lengde <- 6}
  tidperbox <- mean((read.xlsx(pathspes, sheet=11)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=11)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=11)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=11)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask11 <- rbind(BoxTask11,Run)
  #Sheet 12
  lengde <- length(read.xlsx(pathspes, sheet=12)[,5])
  if (lengde == 7) {lengde <- 6}
  tidperbox <- mean((read.xlsx(pathspes, sheet=12)[1:lengde,4]))
  vartidperbox <- psych::skew((read.xlsx(pathspes, sheet=12)[1:lengde,4]))
  valg <- (read.xlsx(pathspes, sheet=12)[lengde,5])
  probest <- (read.xlsx(pathspes, sheet=12)[lengde,3])
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  Run <- cbind(ID, lengde, tidperbox, vartidperbox, valg, probest)
  BoxTask12 <- rbind(BoxTask12,Run)
  #NFCC
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  NFCCSum <- sum((read.xlsx(pathspes, sheet=5))[,3])
  NFCCSum <- cbind(ID, NFCCSum)
  NFCC <- rbind(NFCC, NFCCSum)
  #FiveD
  ID <- sub(".*?ID_(.*?).xlsx.*", "\\1", i)
  FDJoy <- sum((read.xlsx(pathspes, sheet=9))[1:5,3])
  FDDep <- sum((read.xlsx(pathspes, sheet=9))[6:10,3])
  FDStress <- sum(8 - (read.xlsx(pathspes, sheet=9))[11:15,3])
  FDSocial <- sum((read.xlsx(pathspes, sheet=9))[16:20,3])
  FDThrill <- sum((read.xlsx(pathspes, sheet=9))[21:25,3])
  FDTot <- sum(FDJoy, FDDep,FDStress, FDSocial, FDThrill)
  FDAll <- cbind(ID, FDTot, FDJoy, FDDep, FDStress, FDSocial,FDThrill)
  FDim <- rbind(FDim, FDAll)
})
}

#Combine all sheets/info, set ID as rownames and remove redundencies
row.names(BoxTask1) <- BoxTask1[,1]
BoxTask1 <- BoxTask1[-1]
row.names(BoxTask2) <- BoxTask2[,1]
BoxTask2 <- BoxTask2[-1]
row.names(BoxTask3) <- BoxTask3[,1]
BoxTask3 <- BoxTask3[-1]
row.names(BoxTask4) <- BoxTask4[,1]
BoxTask4 <- BoxTask4[-1]
row.names(BoxTask6) <- BoxTask6[,1]
BoxTask6 <- BoxTask6[-1]
row.names(BoxTask7) <- BoxTask7[,1]
BoxTask7 <- BoxTask7[-1]
row.names(BoxTask8) <- BoxTask8[,1]
BoxTask8 <- BoxTask8[-1]
row.names(BoxTask10) <- BoxTask10[,1]
BoxTask10 <- BoxTask10[-1]
row.names(BoxTask11) <- BoxTask11[,1]
BoxTask11 <- BoxTask11[-1]
row.names(BoxTask12) <- BoxTask12[,1]
BoxTask12 <- BoxTask12[-1]

BoxNormTaskXlsx <- merge(BoxTask1, BoxTask2, by=0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask3, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask4, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask6, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask7, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask8, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask10, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask11, by.x = 1, by.y = 0)
BoxNormTaskXlsx <- merge(BoxNormTaskXlsx, BoxTask12, by.x = 1, by.y = 0)

BoxNormTaskXlsx[1,1] <- "EN3HN11" #see "Manual-ID-fix.R"
BoxNormTaskXlsx[2,1] <- "X4621"
BoxNormTaskXlsx[3,1] <- "X7743"
BoxNormTaskXlsx[15,1] <- "EN04IR22"
BoxNormTaskXlsx[32,1] <- "EN06IR08"
BoxNormTaskXlsx[52,1] <- "MA06HA94"
BoxNormTaskXlsx[47,1] <- "kroase"
BoxNormTaskXlsx[58,1] <- "NE05EL22"

row.names(BoxNormTaskXlsx) <- BoxNormTaskXlsx[,1]
BoxNormTaskXlsx <- BoxNormTaskXlsx[-1]
names <- c("BoxNormExtDtD", "BoxNormExtRTmean", "BoxNormExtRTSkew", "BoxNormExtChoice", "BoxNormExtProbest")
names <- rep(names, each = 1, times = 5)
names2 <- rep(1:10, each = 5)
names <- paste(names, names2, sep = "")
colnames(BoxNormTaskXlsx) <- names

#Manual fixes
BoxNormTaskXlsx <- BoxNormTaskXlsx[-46,] #remove duplicate

#Prob.est direction fix
probestcol <- c(5,10,15,20,25,30,35,40,45,50)
for (i in probestcol) {
  seq <- (1:length(BoxNormTaskXlsx[,5]))
  BoxNormTaskXlsx[,i] <- as.numeric(as.character(BoxNormTaskXlsx[,i]))
  for (x in seq) {
    if(BoxNormTaskXlsx[x,i] < 5) {BoxNormTaskXlsx[x,i] <- 10-BoxNormTaskXlsx[x,i]}
  }
}

#Recoding final choice
## 1: Correct, 0: Incorrect, -1: Didn't make a choice
seq <- (1:length(BoxNormTaskXlsx[,4]))
BoxNormTaskXlsx[,4] <- as.character(BoxNormTaskXlsx[,4])
for (i in seq){if(BoxNormTaskXlsx[i,4]=="Red"){BoxNormTaskXlsx[i,4] <- "1"}}
BoxNormTaskXlsx[,9] <- as.character(BoxNormTaskXlsx[,9])
for (i in seq){if(BoxNormTaskXlsx[i,9]=="Red"){BoxNormTaskXlsx[i,9] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,9]=="Blue"){BoxNormTaskXlsx[i,9] <- "0"}}
BoxNormTaskXlsx[,14] <- as.character(BoxNormTaskXlsx[,14])
for (i in seq){if(BoxNormTaskXlsx[i,14]=="Yellow"){BoxNormTaskXlsx[i,14] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,14]=="Green"){BoxNormTaskXlsx[i,14] <- "0"}}
BoxNormTaskXlsx[,19] <- as.character(BoxNormTaskXlsx[,19])
for (i in seq){if(BoxNormTaskXlsx[i,19]=="Purple"){BoxNormTaskXlsx[i,19] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,19]=="White"){BoxNormTaskXlsx[i,19] <- "0"}}
BoxNormTaskXlsx[,24] <- as.character(BoxNormTaskXlsx[,24])
for (i in seq){if(BoxNormTaskXlsx[i,24]=="Light blue"){BoxNormTaskXlsx[i,24] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,24]=="Red"){BoxNormTaskXlsx[i,24] <- "0"}}
BoxNormTaskXlsx[,29] <- as.character(BoxNormTaskXlsx[,29])
for (i in seq){if(BoxNormTaskXlsx[i,29]=="Yellow"){BoxNormTaskXlsx[i,29] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,29]=="Light Green"){BoxNormTaskXlsx[i,29] <- "0"}}
BoxNormTaskXlsx[,34] <- as.character(BoxNormTaskXlsx[,34])
for (i in seq){if(BoxNormTaskXlsx[i,34]=="Light purple"){BoxNormTaskXlsx[i,34] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,34]=="Yellowish white"){BoxNormTaskXlsx[i,34] <- "0"}}
BoxNormTaskXlsx[,39] <- as.character(BoxNormTaskXlsx[,39])
for (i in seq){if(BoxNormTaskXlsx[i,39]=="Red"){BoxNormTaskXlsx[i,39] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,39]=="Green"){BoxNormTaskXlsx[i,39] <- "0"}}
BoxNormTaskXlsx[,44] <- as.character(BoxNormTaskXlsx[,44])
for (i in seq){if(BoxNormTaskXlsx[i,44]=="Pink"){BoxNormTaskXlsx[i,44] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,44]=="Green"){BoxNormTaskXlsx[i,44] <- "0"}}
BoxNormTaskXlsx[,49] <- as.character(BoxNormTaskXlsx[,49])
for (i in seq){if(BoxNormTaskXlsx[i,49]=="Blue"){BoxNormTaskXlsx[i,49] <- "1"}}
for (i in seq){if(BoxNormTaskXlsx[i,49]=="Light Yellow"){BoxNormTaskXlsx[i,49] <- "0"}}

write.csv(BoxNormTaskXlsx, paste(getwd(), "/Cleaned data/BoxNormTaskXlsx.csv", sep =""))

FDim[,1] <- as.character(FDim[,1])
FDim[,2] <- as.numeric(as.character(FDim[,2]))
FDim[,3] <- as.numeric(as.character(FDim[,3]))
FDim[,4] <- as.numeric(as.character(FDim[,4]))
FDim[,5] <- as.numeric(as.character(FDim[,5]))
FDim[,6] <- as.numeric(as.character(FDim[,6]))
FDim[,7] <- as.numeric(as.character(FDim[,7]))
FDim[1,1] <- "EN3HN11" #see "Manual-ID-fix.R"
FDim[2,1] <- "X4621"
FDim[3,1] <- "X7743"
FDim[15,1] <- "EN04IR22"
FDim[32,1] <- "EN06IR08"
FDim[52,1] <- "MA06HA94"
FDim[47,1] <- "kroase"
FDim[58,1] <- "NE05EL22"
#Manual fixes
FDim <- FDim[-45,] #remove duplicate
row.names(FDim) <- FDim[,1]
FDim <- FDim[,-1]
write.csv(FDim, paste(getwd(), "/Cleaned data/FiveDimensions.csv", sep =""))

NFCC[,1] <- as.character(NFCC[,1])
NFCC[,2] <- as.numeric(as.character(NFCC[,2]))
NFCC[1,1] <- "EN3HN11" #see "Manual-ID-fix.R"
NFCC[2,1] <- "X4621"
NFCC[3,1] <- "X7743"
NFCC[15,1] <- "EN04IR22"
NFCC[32,1] <- "EN06IR08"
NFCC[52,1] <- "MA06HA94"
NFCC[47,1] <- "kroase"
NFCC[58,1] <- "NE05EL22"
#Manual fixes
NFCC <- NFCC[-45,] #remove duplicate
row.names(NFCC) <- NFCC[,1]
write.csv(NFCC, paste(getwd(), "/Cleaned data/NFCC.csv", sep =""))

rm(BoxTask, BoxTask1, BoxTask2, BoxTask3, BoxTask4, BoxTask6, BoxTask7, BoxTask8, BoxTask10, BoxTask11, BoxTask12, Run, i, ID, lengde, names, names2, path, pathspes, probest, tidperbox, valg, vartidperbox, BoxTaskPathXlsx, FDAll, NFCCSum, FDDep, FDJoy, FDSocial, FDStress, FDThrill, FDTot, probestcol, seq, x)