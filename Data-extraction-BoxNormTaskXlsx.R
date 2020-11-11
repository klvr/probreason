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

write.csv(BoxNormTaskXlsx, paste(getwd(), "/Cleaned data/BoxNormTaskXlsx.csv", sep =""))

rm(BoxTask, BoxTask1, BoxTask2, BoxTask3, BoxTask4, BoxTask6, BoxTask7, BoxTask8, BoxTask10, BoxTask11, BoxTask12, Run, i, ID, lengde, names, names2, path, pathspes, probest, tidperbox, valg, vartidperbox, BoxTaskPathXlsx)