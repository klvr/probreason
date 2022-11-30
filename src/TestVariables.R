#Test model
datared <- read.csv(paste(getwd(), "/Cleaned data/AllData.csv", sep =""))
row.names(datared) <- datared[,1]
datared <- datared[,-1]
datared <- datared[,-c(7:50)]
datared <- datared[,-c(7:50)]
datared <- datared[,-c(7:17)]
datared <- datared[,-c(38:43)]
datared <- datared[,-c(8)]

for (i in 1:ncol(datared)) {datared[,i] <- as.numeric(as.character(datared[,i]))}

#Task-variables
datared[complete.cases(datared[13:16]),"BeadsOnejarOverall"] <- rowMeans(datared[complete.cases(datared[13:16]),13:16])
datared[complete.cases(datared[17:20]),"BeadsToneOverall"] <- rowMeans(datared[complete.cases(datared[17:20]),17:20])
datared[complete.cases(datared[21:25]),"BeadsTwojarOverall"] <- rowMeans(datared[complete.cases(datared[21:25]),21:25])
datared[,"BeadsOverall"] <- rowMeans(datared[37:39], na.rm = TRUE)
datared[complete.cases(datared[26:29]),"BoxIrregOverall"] <- rowMeans(datared[complete.cases(datared[26:29]),26:29])
datared[complete.cases(datared[30:33]),"BoxNormOverall"] <- rowMeans(datared[complete.cases(datared[30:33]),30:33])
datared[complete.cases(datared[34:36]),"BoxNormExtOverall"] <- rowMeans(datared[complete.cases(datared[34:36]),34:36])
datared[,"BoxOverall"] <- rowMeans(datared[41:43], na.rm = TRUE)
datared[,"TaskOverall"] <- rowMeans(datared[c(40,44)], na.rm = TRUE)

#Cond-variables ##NONONO - Not complete cases###
datared[complete.cases(datared[c(13,14,17,18,21,22,25)]),"BeadsEasyOverall"] <- rowMeans(datared[complete.cases(datared[c(13,14,17,18,21,22,25)]),c(13,14,17,18,21,22,25)])
datared[complete.cases(datared[13:16]),"BeadsHardOverall"] <- rowMeans(datared[complete.cases(datared[13:16]),13:16])
datared[complete.cases(datared[13:16]),"BoxEasyOverall"] <- rowMeans(datared[complete.cases(datared[13:16]),13:16])
datared[complete.cases(datared[13:16]),"BoxHardOverall"] <- rowMeans(datared[complete.cases(datared[13:16]),13:16])
datared[complete.cases(datared[13:16]),"EasyOverall"] <- rowMeans(datared[complete.cases(datared[13:16]),13:16])
datared[complete.cases(datared[13:16]),"HardOverall"] <- rowMeans(datared[complete.cases(datared[13:16]),13:16])


#Notes:
#Factor-variables for condition, prob, free v fixed, other?
#Only keep IBO's, not raw
#Weighted by RT, skew, possibly reported conf or use that in another way
#Risk and Amb weighted by inverse when model-building
#Think about what I wrote in resluts-section
#Experimenter / session