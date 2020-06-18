#Data extraction CAPE-P (includes the three control-questions)

Path <- CapePath[grepl("CAPE_p.csv", CapePath)]
Cape2018 <- row.names(c("ID", "Score"))
Cape2018 <- as.data.frame(Cape2018)

for (i in Path) {
test <- read.csv(i)
id <- (as.character(test[51,2]))
capp <- c(2,5, 6,7,10,12,14,16,18,21,22,33,24,26,28,30,32,34,36,37,45,44,46)
test <- test[capp,]
totalt <- as.numeric(colSums(test[4]))
Cape2018 <- rbind(Cape2018,cbind(id, totalt))
}

cape2020 <- cbind(music[1], rowSums(music[2:24]))
colnames(Cape2018) <- c("ID", "Score")
colnames(cape2020) <- c("ID", "Score")
Cape2018$ID <- as.character(Cape2018$ID)
Cape2018$Score <- as.numeric(Cape2018$Score)
cape2020$ID <- as.character(cape2020$ID)
cape2020$Score <- as.numeric(cape2020$Score)
CapeScore <- rbind(Cape2018, cape2020) 

write.csv(CapeScore, paste(getwd(), "/Cleaned data/CAPE.csv", sep=""))