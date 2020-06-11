#Data extraction BeadsTwojarTask
## Yet to do: Fix participant ID

path <- BeadsTwojarTaskPath
pattern <- "trials_2.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
row.names(DtDN) <- DtDName
DtDN2 <- DtDN

pattern <- "trials_3.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
row.names(DtDN) <- DtDName
DtDN3 <- DtDN

pattern <- "trials_4.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
row.names(DtDN) <- DtDName
DtDN4 <- DtDN

pattern <- "trials.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
row.names(DtDN) <- DtDName
DtDN1 <- DtDN

pattern <- "trials_5.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
row.names(DtDN) <- DtDName
DtDN5 <- DtDN

BeadsTwojarTaskDtD <- merge(DtDN1, DtDN2, by=0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN3, by.x = 1, by.y = 0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN4, by.x = 1, by.y = 0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN5, by.x = 1, by.y = 0)

row.names(BeadsTwojarTaskDtD) <- BeadsTwojarTaskDtD[,1]
BeadsTwojarTaskDtD <- BeadsTwojarTaskDtD[,-1]

rm(DtDN, DtDN1, DtDN2, DtDN3, DtDN4, DtDN5, DtDName, DtDPath, path, pattern)

write.csv(BeadsTwojarTaskDtD, paste(getwd(), "/Cleaned data/BeadsTwojarTaskDtD.csv", sep = ""))