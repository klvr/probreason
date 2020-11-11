#Data extraction BeadsTwojarTask

path <- BeadsTwojarTaskPath[1:428]
pattern <- "trials_2.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN2 <- DtDN

pattern <- "trials_3.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN3 <- DtDN

pattern <- "trials_4.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN4 <- DtDN

pattern <- "trials.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN1 <- DtDN

pattern <- "trials_5.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN5 <- DtDN

BeadsTwojarTaskDtD <- merge(DtDN1, DtDN2, by=0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN3, by.x = 1, by.y = 0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN4, by.x = 1, by.y = 0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN5, by.x = 1, by.y = 0)

row.names(BeadsTwojarTaskDtD) <- BeadsTwojarTaskDtD[,1]
BeadsTwojarTask1 <- BeadsTwojarTaskDtD[,-1]

path <- BeadsTwojarTaskPath[429:(length(BeadsTwojarTaskPath))]
pattern <- "trials_2.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN2 <- DtDN

pattern <- "trials_3.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN3 <- DtDN

pattern <- "trials_4.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN4 <- DtDN

pattern <- "trials.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,13])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,13])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN1 <- DtDN

pattern <- "trials_5.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTSkew <- do.call(rbind, lapply(DtDPath, function(x) psych::skew(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,12])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDN <- cbind(DtDN, RTMean, RTSkew)
row.names(DtDN) <- DtDName
DtDN5 <- DtDN

BeadsTwojarTaskDtD <- merge(DtDN1, DtDN2, by=0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN3, by.x = 1, by.y = 0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN4, by.x = 1, by.y = 0)
BeadsTwojarTaskDtD <- merge(BeadsTwojarTaskDtD, DtDN5, by.x = 1, by.y = 0)

BeadsTwojarTaskDtD[44,1] <- "HL07EN21" #See Manual-ID-fix.R
BeadsTwojarTaskDtD[25,1] <- "en08ar12"
BeadsTwojarTaskDtD[41,1] <- "kroase"

row.names(BeadsTwojarTaskDtD) <- BeadsTwojarTaskDtD[,1]
BeadsTwojarTask2 <- BeadsTwojarTaskDtD[,-1]

BeadsTwojarTask <- rbind(BeadsTwojarTask1, BeadsTwojarTask2)

colnames(BeadsTwojarTask) <- c("BeadsTwojarDtD1", "BeadsTwojarRTmean1", "BeadsTwojarRTSkew1","BeadsTwojarDtD2", "BeadsTwojarRTmean2", "BeadsTwojarRTSkew2","BeadsTwojarDtD3", "BeadsTwojarRTmean3", "BeadsTwojarRTSkew3","BeadsTwojarDtD4", "BeadsTwojarRTmean4", "BeadsTwojarRTSkew4","BeadsTwojarDtD5", "BeadsTwojarRTmean5", "BeadsTwojarRTSkew5")

rm(BeadsTwojarTask1, BeadsTwojarTask2, BeadsTwojarTaskDtD, DtDN, DtDN1, DtDN2, DtDN3, DtDN4, DtDN5, DtDName, RTMean, RTSkew, DtDPath, path, pattern, BeadsTwojarTaskPath)

BeadsTwojarTask <- BeadsTwojarTask[-c(142,143),]

write.csv(BeadsTwojarTask, paste(getwd(), "/Cleaned data/BeadsTwojarTask.csv", sep = ""))