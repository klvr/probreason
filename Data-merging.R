# Merging from env
## Script for merging after running the data-extraction scripts (i.e., not by using the CSV-files)

All <- merge(ARTEst, BeadsOnejarTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, BeadsToneTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, BeadsTwojarTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, BoxIrregTask, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, BoxNormTaskLog, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, BoxNormTaskXlsx, by = "row.names", all.x = TRUE, all.y = TRUE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, Cape, by = "row.names", all.x = TRUE, all.y = FALSE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, NFCC, by = "row.names", all.x = TRUE, all.y = FALSE)
row.names(All) <- All[,1]
All <- All[,-1]

All <- merge(All, FDim, by = "row.names", all.x = TRUE, all.y = FALSE)
row.names(All) <- All[,1]
All <- All[,-1]
All <- All[,-109]