#Data extraction Box(Norm)TaskLog
## Two manual fixes, see line 68-70

BoxTaskDtD <- row.names(c("ID", "DtD1", "DtD2", "DtD3", "DtD4"))
BoxTaskDtD <- as.data.frame(BoxTaskDtD)

for(i in BoxTaskPathLog) {
  print(i)
  IrrData <- read.delim(i)
  colnames(IrrData) <- c("time","EXP" ,"press")
  IrrData$EXP <- as.character(IrrData$EXP)
  data <- "DATA"
  PartInp <- IrrData[grepl(data, IrrData$EXP),]
  keypress1 <- "Keypress: j"
  keypress2 <- "Keypress: k"
  keypress3 <- "Keypress: space"
  keypress4 <- "Keypress: escape"
  if((sum(IrrData$press == keypress4)) == 1) next
  keypressed1 <- row.names(IrrData[grepl(keypress1, IrrData$press),])
  keypressed2 <- row.names(IrrData[grepl(keypress2, IrrData$press),])
  keypressed3 <- row.names(IrrData[grepl(keypress3, IrrData$press),])
  if((length(keypressed1)+length(keypressed2)) < 4) next
  if(length(keypressed3)==0) {keypressed3 <- 1}
  keypressed <- c(keypressed1, keypressed2, keypressed3[1])
  keypressed <- as.numeric(keypressed)
  keypressed <- sort(keypressed)
  space <- "space"
  spacepressed <- row.names(IrrData[grepl(space, IrrData$press),])
  color <- "fillColor"
  boxchoice1 <- IrrData[as.numeric(keypressed[1]):as.numeric(keypressed[2]),]
  boxchoice1 <- boxchoice1[grepl(color, boxchoice1$press),]
  boxchoice1 <- strsplit(as.character(unique(boxchoice1$press)), split = ":")
  boxchoice1 <- unlist(boxchoice1)
  if (length(boxchoice1) != 0) {boxchoice1 <- boxchoice1[seq(from = 1, to = length(boxchoice1), by = 2)]}
  pressed1 <- as.character(IrrData$press[as.numeric(keypressed[2])])
  Trial1 <- cbind(boxchoice1, pressed1)
  boxchoice2 <- IrrData[as.numeric(keypressed[2]):as.numeric(keypressed[3]),]
  boxchoice2 <- boxchoice2[grepl(color, boxchoice2$press),]
  boxchoice2 <- strsplit(as.character(unique(boxchoice2$press)), split = ":")
  boxchoice2 <- unlist(boxchoice2)
  if (length(boxchoice2) != 0) {boxchoice2 <- boxchoice2[seq(from = 1, to = length(boxchoice2), by = 2)]}
  pressed2 <- as.character(IrrData$press[as.numeric(keypressed[3])])
  Trial2 <- cbind(boxchoice2, pressed2)
  boxchoice3 <- IrrData[as.numeric(keypressed[3]):as.numeric(keypressed[4]),]
  boxchoice3 <- boxchoice3[grepl(color, boxchoice3$press),]
  boxchoice3 <- strsplit(as.character(unique(boxchoice3$press)), split = ":")
  boxchoice3 <- unlist(boxchoice3)
  if (length(boxchoice3) != 0) {boxchoice3 <- boxchoice3[seq(from = 1, to = length(boxchoice3), by = 2)]}
  pressed3 <- as.character(IrrData$press[as.numeric(keypressed[4])])
  Trial3 <- cbind(boxchoice3, pressed3)
  boxchoice4 <- IrrData[as.numeric(keypressed[4]):as.numeric(keypressed[5]),]
  boxchoice4 <- boxchoice4[grepl(color, boxchoice4$press),]
  boxchoice4 <- strsplit(as.character(unique(boxchoice4$press)), split = ":")
  boxchoice4 <- unlist(boxchoice4)
  if (length(boxchoice4) != 0) {boxchoice4 <- boxchoice4[seq(from = 1, to = length(boxchoice4), by = 2)]}
  pressed4 <- as.character(IrrData$press[as.numeric(keypressed[5])])
  Trial4 <- cbind(boxchoice4, pressed4)
  id <- strsplit(i, split ="_boxtaskreg/")[1]
  id <- unlist(id)[1]
  id <- strsplit(id, split="")
  id <- tail(unlist(id), n=3)
  id <- paste(id, collapse="")
  Alt <- c(Trial1, Trial2, Trial3, Trial4)
  DtDPart <- cbind(id, length(Trial1[,1]), length(Trial2[,1]), length(Trial3[,1]), length(Trial4[,1]), paste(Alt, collapse = ","))
  BoxTaskDtD <- rbind(BoxTaskDtD, DtDPart)
}
BoxTaskDtD$id <- as.character(BoxTaskDtD$id)
BoxTaskDtD[29,1] <- "010" #manual fix for one participant id
BoxTaskDtD[41,2] <- as.numeric("5") #manual fix for one DtD
BoxTaskDtD[41,6] <- NA
row.names(BoxTaskDtD) <- paste("X", BoxTaskDtD$id, sep = "")
BoxTaskDtD <- BoxTaskDtD[-1]
colnames(BoxTaskDtD) <- c("BoxNormDtD1","BoxNormDtD2","BoxNormDtD3","BoxNormDtD4", "BoxNormSeqChoice")
BoxNormTask <- BoxTaskDtD

rm(BoxTaskDtD, DtDPart, IrrData, PartInp, Trial1, Trial2, Trial3, Trial4, Alt, boxchoice1, boxchoice2, boxchoice3, boxchoice4, color, data, i, id, keypress1, keypress2, keypress3, keypress4, keypressed, keypressed1, keypressed2, keypressed3, pressed1, pressed2, pressed3, pressed4, space, spacepressed)

write.csv(BoxNormTask, paste(getwd(), "/Cleaned data/BoxNormTask.csv", sep =""))
