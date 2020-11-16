#Data extraction CAPE-P

Path <- CapePath[grepl("CAPE_p.csv", CapePath)]
Cape2018 <- row.names(c("ID", "Score"))
Cape2018 <- as.data.frame(Cape2018)

for (i in Path) {
score <- read.csv(i)
id <- (as.character(score[51,2]))
capp <- c(2,5,6,7,10,12,14,16,18,21,24,26,28,30,32,34,36,37,45,46)
control <- c(22,33,44)
capp <- score[capp,]
control <- score[control,]
capp <- as.numeric(colSums(capp[4]))
control <- as.numeric(colSums(control[4]))
Cape2018 <- rbind(Cape2018,cbind(id, capp, control))
}

Cape2020 <- read.csv(paste(getwd(), "/Intermidiate data/music_data.csv", sep = ""))
control <- c(5,12,22)
capp <- c(1,2,3,4,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,23)
control <- control + 13
capp <- capp + 13
aq <- c(37:64)
id <- as.character(Cape2020[,2])
capp <- as.numeric(rowSums(Cape2020[,capp]))
control <- as.numeric(rowSums(Cape2020[,control]))
aq <- as.numeric(rowSums(Cape2020[,aq]))
Cape2020 <- cbind(id, capp, control, aq)

#Manual fix of participant-numbers
Cape2020 <- Cape2020[-1,]
Cape2018[,1] <- as.character(Cape2018[,1])
Cape2018[12,1] <- 312
Cape2018[14,1] <- 314
Cape2018[16,1] <- 316
Cape2018[18,1] <- 318
Cape2018[19,1] <- 319
Cape2018[20,1] <- 320
Cape2018[21,1] <- 321
Cape2018[22,1] <- 322
Cape2018[24,1] <- 324
Cape2018[25,1] <- 325
Cape2018[27:35,1] <- as.character(paste("00", seq(from=1, to=9), sep =""))
Cape2018[36:48,1] <- as.character(paste("0", seq(from=10, to=22), sep =""))
Cape2018[,1] <- paste("X", Cape2018[,1], sep ="")

Cape <- merge(Cape2020, Cape2018, all = TRUE)
Cape[,1] <- as.character(Cape[,1])
Cape[68,1] <- "kroase" #See Manual-ID-fix.R
Cape[1,1] <- "ad03im02"
Cape[6,1] <- "AU06NE01"
Cape[14,1] <- "ELEN1NT29"
Cape[24,1] <- "en05ar27"
Cape[42,1] <- "en08ar12"
Cape[69,1] <- "lavarn"
Cape[80,1] <- "nd03ir04"
Cape[89,1] <- "on06lf03"
Cape[104,1] <- "STERIG"
Cape[50,1] <- "EN05AR25"
Cape[40,1] <- "EN06AS30"
Cape[36,1] <- "EN6NE21"
Cape[91,1] <- "id06ik27"
Cape[97,1] <- "IE05LD08"
row.names(Cape) <- Cape[,1]
Cape <- Cape[,-1]
colnames(Cape) <- c("CapeP", "CapeControl", "AQ")

write.csv(Cape, paste(getwd(), "/Cleaned data/CAPE.csv", sep=""))

rm(Cape2018, Cape2020, score, CapePath, capp, control, i, id, Path)
