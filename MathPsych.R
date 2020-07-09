#MathPsych relevant data
## Put inn BoxNormLog

MP <- merge(ARTEst, BeadsTwojarTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- merge(MP, BoxNormTaskXlsx, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- merge(MP, Cape, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- MP[-c(3,6,8,9,11,12,14,15,17,18,20,21)]
MP <- MP[-c(11,12,13,16,17,18,21,22,23,26,27,28,31,32,33,36,37,38,41,42,43)]
MP <- MP[-c(25,26,27,30,31,32,35,36,37,40)]

MP$BeadsTwojarDtDOverall <- rowSums(MP[c(5,6,7,8,9)])
seq <- seq(12,28,by=2)
for (i in seq) { MP[,i] <- as.numeric(as.character((MP[,i]))) }
MP$BoxNormExtDtDOverall <- rowSums(MP[c(12,14,16,18,20,22,24,26,28)])

seq <- seq(13,29,by=2)
for (i in seq) { MP[,i] <- as.numeric(as.character((MP[,i]))) }


#if(sum(seq)/length(seq) < .5) {seq <- ((seq*-1)+1)}
  
  


write.csv(MP, file = paste(getwd(), "/Cleaned data/MPData.csv", sep =""))
