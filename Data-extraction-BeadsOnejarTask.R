#Data extraction BeadsOnejarTask

path <- BeadsOnejarTaskPath
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

BeadsOnejarTaskDtD <- merge(DtDN1, DtDN2, by=0)
BeadsOnejarTaskDtD <- merge(BeadsOnejarTaskDtD, DtDN3, by.x = 1, by.y = 0)
BeadsOnejarTaskDtD <- merge(BeadsOnejarTaskDtD, DtDN4, by.x = 1, by.y = 0)

row.names(BeadsOnejarTaskDtD) <- BeadsOnejarTaskDtD[,1]
BeadsOnejarTaskDtD <- BeadsOnejarTaskDtD[,-1]

rm(DtDN, DtDN1, DtDN2, DtDN3, DtDN4, DtDName, DtDPath, path, pattern)