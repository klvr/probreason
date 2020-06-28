#Data extraction BeadsToneTask

path <- BeadsToneTaskPath
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

BeadsToneTaskDtD <- merge(DtDN1, DtDN2, by=0)
BeadsToneTaskDtD <- merge(BeadsToneTaskDtD, DtDN3, by.x = 1, by.y = 0)
BeadsToneTaskDtD <- merge(BeadsToneTaskDtD, DtDN4, by.x = 1, by.y = 0)

row.names(BeadsToneTaskDtD) <- BeadsToneTaskDtD[,1]
BeadsToneTask <- BeadsToneTaskDtD[,-1]

rm(DtDN, DtDN1, DtDN2, DtDN3, DtDN4, DtDName, RTMean, RTSkew, DtDPath, path, pattern, BeadsToneTaskDtD, BeadsToneTaskPath)

colnames(BeadsToneTask) <- c("BeadsToneDtD1", "BeadsToneRTmean1", "BeadsToneRTSkew1","BeadsToneDtD2", "BeadsToneRTmean2", "BeadsToneRTSkew2","BeadsToneDtD3", "BeadsToneRTmean3", "BeadsToneRTSkew3","BeadsToneDtD4", "BeadsToneRTmean4", "BeadsToneRTSkew4")

write.csv(BeadsToneTask, paste(getwd(), "/Cleaned data/BeadsToneTask.csv", sep = ""))