#Data extraction BeadsOnejarTask

path <- BeadsOnejarTaskPath
pattern <- "trials_2.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMedian <- do.call(rbind, lapply(DtDPath, function(x) median(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTsd <- do.call(rbind, lapply(DtDPath, function(x) sd(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTMedian, RTsd)
row.names(DtDN) <- DtDName
DtDN2 <- DtDN

pattern <- "trials_3.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMedian <- do.call(rbind, lapply(DtDPath, function(x) median(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTsd <- do.call(rbind, lapply(DtDPath, function(x) sd(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTMedian, RTsd)
row.names(DtDN) <- DtDName
DtDN3 <- DtDN

pattern <- "trials_4.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMedian <- do.call(rbind, lapply(DtDPath, function(x) median(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTsd <- do.call(rbind, lapply(DtDPath, function(x) sd(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTMedian, RTsd)
row.names(DtDN) <- DtDName
DtDN4 <- DtDN

pattern <- "trials.csv"
DtDPath <- path[grepl(pattern = pattern, path)]
DtDN <- do.call(rbind, lapply(DtDPath, function(x) sum(as.numeric(as.character(read.csv(x)[1:20,2])))))
RTMean <- do.call(rbind, lapply(DtDPath, function(x) mean(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTMedian <- do.call(rbind, lapply(DtDPath, function(x) median(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
RTsd <- do.call(rbind, lapply(DtDPath, function(x) sd(as.numeric(as.character(read.csv(x)[2:20,4])), na.rm = TRUE)))
DtDName <- do.call(rbind, lapply(DtDPath, function(x) as.character((read.csv(x)[,1:2])[(read.csv(x)[,1:2])=="participant",2])))
DtDName <- paste("X", DtDName, sep="")
DtDName <- sub("_.*", "", DtDName)
DtDN <- cbind(DtDN, RTMean, RTMedian, RTsd)
row.names(DtDN) <- DtDName
DtDN1 <- DtDN

BeadsOnejarTaskDtD <- merge(DtDN1, DtDN2, by=0)
BeadsOnejarTaskDtD <- merge(BeadsOnejarTaskDtD, DtDN3, by.x = 1, by.y = 0)
BeadsOnejarTaskDtD <- merge(BeadsOnejarTaskDtD, DtDN4, by.x = 1, by.y = 0)

row.names(BeadsOnejarTaskDtD) <- BeadsOnejarTaskDtD[,1]
BeadsOnejarTask <- BeadsOnejarTaskDtD[,-1]

rm(DtDN, DtDN1, DtDN2, DtDN3, DtDN4, DtDName, DtDPath, path, pattern, BeadsOnejarTaskDtD, RTMean, RTMedian, RTsd)

colnames(BeadsOnejarTask) <- c("BeadsOnejarDtD1", "BeadsOnejarRTmean1", "BeadsOnejarRTmedian1", "BeadsOnejarRTsd1", "BeadsOnejarDtD2", "BeadsOnejarRTmean2", "BeadsOnejarRTmedian2", "BeadsOnejarRTsd2", "BeadsOnejarDtD3", "BeadsOnejarRTmean3", "BeadsOnejarRTmedian3", "BeadsOnejarRTsd3", "BeadsOnejarDtD4", "BeadsOnejarRTmean4", "BeadsOnejarRTmedian4", "BeadsOnejarRTsd4")

write.csv(BeadsOnejarTask, paste(getwd(), "/Cleaned data/BeadsOnejarTask.csv", sep = ""))