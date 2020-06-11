#Data extraction BoxIrregTask
## Yet to do: Remove variables not for further use

BoxIrregDtD <- row.names(c("ID", "DtD1", "DtD2", "DtD3", "DtD4"))
BoxIrregDtD <- as.data.frame(BoxIrregDtD)

for(i in BoxIrregTaskPath) {
  print(i)
  IrrData <- read.delim(i)
  IrrData$EXP <- as.character(IrrData$EXP)
  colnames(IrrData) <- c("time","EXP" ,"press")
  data <- "DATA"
  PartInp <- IrrData[grepl(data, IrrData$EXP),]
  keypress1 <- "Keypress: j"
  keypress2 <- "Keypress: k"
  keypress3 <- "Keypress: space"
  keypressed1 <- row.names(IrrData[grepl(keypress1, IrrData$press),])
  keypressed2 <- row.names(IrrData[grepl(keypress2, IrrData$press),])
  keypressed3 <- row.names(IrrData[grepl(keypress3, IrrData$press),])
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
  boxchoice1 <- boxchoice1[seq(from = 1, to = length(boxchoice1), by = 2)]
  pressed1 <- as.character(IrrData$press[as.numeric(keypressed[2])])
  Trial1 <- cbind(boxchoice1, pressed1)
  boxchoice2 <- IrrData[as.numeric(keypressed[2]):as.numeric(keypressed[3]),]
  boxchoice2 <- boxchoice2[grepl(color, boxchoice2$press),]
  boxchoice2 <- strsplit(as.character(unique(boxchoice2$press)), split = ":")
  boxchoice2 <- unlist(boxchoice2)
  boxchoice2 <- boxchoice2[seq(from = 1, to = length(boxchoice2), by = 2)]
  pressed2 <- as.character(IrrData$press[as.numeric(keypressed[3])])
  Trial2 <- cbind(boxchoice2, pressed2)
  boxchoice3 <- IrrData[as.numeric(keypressed[3]):as.numeric(keypressed[4]),]
  boxchoice3 <- boxchoice3[grepl(color, boxchoice3$press),]
  boxchoice3 <- strsplit(as.character(unique(boxchoice3$press)), split = ":")
  boxchoice3 <- unlist(boxchoice3)
  boxchoice3 <- boxchoice3[seq(from = 1, to = length(boxchoice3), by = 2)]
  pressed3 <- as.character(IrrData$press[as.numeric(keypressed[4])])
  Trial3 <- cbind(boxchoice3, pressed3)
  boxchoice4 <- IrrData[as.numeric(keypressed[4]):as.numeric(keypressed[5]),]
  boxchoice4 <- boxchoice4[grepl(color, boxchoice4$press),]
  boxchoice4 <- strsplit(as.character(unique(boxchoice4$press)), split = ":")
  boxchoice4 <- unlist(boxchoice4)
  boxchoice4 <- boxchoice4[seq(from = 1, to = length(boxchoice4), by = 2)]
  pressed4 <- as.character(IrrData$press[as.numeric(keypressed[5])])
  Trial4 <- cbind(boxchoice4, pressed4)
  id <- strsplit(i, split ="_boxtaskirreg/")[1]
  id <- unlist(id)[1]
  id <- strsplit(id, split="")
  id <- tail(unlist(id), n=3)
  id <- paste(id, collapse="")
  DtDPart <- cbind(id, length(Trial1[,1]), length(Trial2[,1]), length(Trial3[,1]), length(Trial4[,1]))
  AllInfo <- as.character(c(id, Trial1[1,2], Trial2[1,2], Trial3[1,2], Trial4[1,2], Trial1[,1], Trial2[,1], Trial3[,1], Trial4[,1]))
  BoxIrregDtD <- rbind(BoxIrregDtD, DtDPart)
  }
colnames(BoxIrregDtD) <- c("ID", "DtD1", "DtD2", "DtD3", "DtD4")
write.csv(BoxIrregDtD, paste(getwd(), "/Cleaned data/BoxIrregTaskDtD.csv", sep =""))
