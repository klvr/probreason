#MathPsych relevant data
## Put inn BoxNormLog

#Merging relevant data
MP <- merge(ARTEst, BeadsTwojarTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- merge(MP, BoxNormTaskXlsx, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

MP <- merge(MP, Cape, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(MP) <- MP[,1]
MP <- MP[,-1]

#Removing stuff not needed for MathPsych
MP <- MP[-c(3,6,8,9,11,12,14,15,17,18,20,21)]
MP <- MP[-c(11,12,13,16,17,18,21,22,23,26,27,28,31,32,33,36,37,38,41,42,43)]
MP <- MP[-c(25,26,27,30,31,32,35,36,37,40)]

#Calculate Overall DtD Beads, DtD 60/40, and DtD 8515
MP$BeadsTwojarDtDOverall <- rowSums(MP[c(5,6,7,8,9)])
seq <- seq(12,28,by=2)
MP$BeadsTwojarDtD8515 <- rowSums(MP[c(5,6,9)])
MP$BeadsTwojarDtD6040 <- rowSums(MP[c(7,8)])
#Calculate Overall DtD Bo, limited, and no-limit
for (i in seq) { MP[,i] <- as.numeric(as.character((MP[,i]))) }
MP$BoxNormExtDtDOverall <- rowSums(MP[c(12,14,16,18,20,22,24,26,28)])
MP$BoxNormExtDtDNolimit <- rowSums(MP[c(12,14,16)])
MP$BoxNormExtDtDNLimit <- rowSums(MP[c(18,20,22,24,26,28)])

#Reversing Prob.est. so 10 always indicates the estimated probability in the objectivly true direction
seq <- seq(13,29,by=2)
for (i in seq) { MP[,i] <- as.numeric(as.character((MP[,i]))) }
seq <- seq(15,29,by=2)
for (i in seq) {MP[,i] <- 10-MP[,i] }
#Adding overall mean prob.est.
MP$BoxNormExtProbestOverall <- rowMeans(MP[(c(12,14,16,18,20,22,24,26,28)+1)])
MP$BoxNormExtProbestNolimit <- rowMeans(MP[(c(12,14,16)+1)])
MP$BoxNormExtProbestNLimit <- rowMeans(MP[(c(18,20,22,24,26,28)+1)])

write.csv(MP, file = paste(getwd(), "/Cleaned data/MPData.csv", sep =""))
