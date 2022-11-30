# Analyses

# Load data
data <- read.csv("Cleaned data/20210811_BoxBeadsART_KK.csv")
row.names(data) <- data[,1]
data <- data[,-1]

#Summary variables
## Twojar
data$BeadsTwojarDtDOverall <- rowMeans(data[,c(31,34,37,40,43)], na.rm=TRUE)
data$BeadsTwojarIBOOverall <- rowMeans(data[,c(133:137)], na.rm=TRUE)

## Onejar
data$BeadsOnejarDtDOverall <- rowMeans(data[,c(7,10,13,16)], na.rm=TRUE)
data$BeadsOnejarIBOOverall <- rowMeans(data[,c(125:128)], na.rm=TRUE)

## Tone
data$BeadsToneDtDOverall <- rowMeans(data[,c(19,22,25,28)], na.rm=TRUE)
data$BeadsToneIBOOverall <- rowMeans(data[,c(129:132)], na.rm=TRUE)

## Irreg
data$BoxIrregDtDOverall <- rowMeans(data[,c(46:49)], na.rm=TRUE)
data$BoxIrregIBOOverall <- rowMeans(data[,c(138:141)], na.rm=TRUE)

## Norm
data$BoxNormDtDOverall <- rowMeans(data[,c(52:55)], na.rm=TRUE)
data$BoxNormIBOOverall  <- rowMeans(data[,c(142:145)], na.rm=TRUE)

## NormExtUnlim
data$BoxNormExtDtDUnlim  <- rowMeans(data[,c(61,66,71)], na.rm=TRUE)
data$BoxNormExtIBOUnlim  <- rowMeans(data[,c(146:148)], na.rm=TRUE)
data$BoxNormExtProbUnlim  <- rowMeans(data[,c(65,70,75)], na.rm=TRUE)
data$BoxNormExtOverconfUnlim1 <- ((data[,65]/10) - data[,146])
data$BoxNormExtOverconfUnlim2 <- ((data[,70]/10) - data[,147])
data$BoxNormExtOverconfUnlim3 <- ((data[,75]/10) - data[,148])
data$BoxNormExtOverconfUnlim <- rowMeans(data[,c(168:170)], na.rm=TRUE)

## NormExtLim
data$BoxNormExtDtDLim  <- rowMeans(data[,c(76,81,86,91,96,101)], na.rm=TRUE)
data$BoxNormExtIBOLim <- rowMeans(data[,c(149:154)], na.rm=TRUE)
data$BoxNormExtProbLim <- rowMeans(data[,c(80,85,90,95,100,105)], na.rm=TRUE)
data$BoxNormExtOverconfLim1 <- ((data[,80]/10) - data[,149])
data$BoxNormExtOverconfLim2 <- ((data[,85]/10) - data[,150])
data$BoxNormExtOverconfLim3 <- ((data[,90]/10) - data[,151])
data$BoxNormExtOverconfLim4 <- ((data[,95]/10) - data[,152])
data$BoxNormExtOverconfLim5 <- ((data[,100]/10) - data[,153])
data$BoxNormExtOverconfLim6 <- ((data[,105]/10) - data[,154])
data$BoxNormExtOverconfLim <- rowMeans(data[,c(175:180)], na.rm=TRUE)

# Variables where DtD == 1 in all trials (task-wise) is removed
## Twojar
twojarRem <- sum(is.na(data$BeadsTwojarDtDOverall))
data$BeadsTwojarDtDOverallE <- replace(data$BeadsTwojarDtDOverall, data$BeadsTwojarDtDOverall==1, NA)
twojarRem <- sum(is.na(data$BeadsTwojarDtDOverallE))-twojarRem
data$BeadsTwojarIBOOverallE <- replace(data$BeadsTwojarIBOOverall, data$BeadsTwojarDtDOverall==1, NA)

## Onejar
onejarRem <- sum(is.na(data$BeadsOnejarDtDOverall))
data$BeadsOnejarDtDOverallE <- replace(data$BeadsOnejarDtDOverall, data$BeadsOnejarDtDOverall==1, NA)
onejarRem <- sum(is.na(data$BeadsOnejarDtDOverallE))-onejarRem
data$BeadsOnejarIBOOverallE <- replace(data$BeadsOnejarIBOOverall, data$BeadsOnejarDtDOverall==1, NA)

## Tone
tonejarRem <- sum(is.na(data$BeadsToneDtDOverall))
data$BeadsToneDtDOverallE <- replace(data$BeadsToneDtDOverall, data$BeadsToneDtDOverall==1, NA)
tonejarRem <- sum(is.na(data$BeadsToneDtDOverallE))-tonejarRem
data$BeadsToneIBOOverallE <- replace(data$BeadsToneIBOOverall, data$BeadsToneDtDOverall==1, NA)

## Irreg
irregRem <- sum(is.na(data$BoxIrregDtDOverall))
data$BoxIrregDtDOverallE <- replace(data$BoxIrregDtDOverall, data$BoxIrregDtDOverall==1, NA)
irregRem <- sum(is.na(data$BoxIrregDtDOverallE))-irregRem
data$BoxIrregIBOOverallE <- replace(data$BoxIrregIBOOverall, data$BoxIrregDtDOverall==1, NA)

## Norm
NormRem <- sum(is.na(data$BoxNormDtDOverall))
data$BoxNormDtDOverallE <- replace(data$BoxNormDtDOverall, data$BoxNormDtDOverall==1, NA)
NormRem <- sum(is.na(data$BoxNormDtDOverallE))-NormRem
data$BoxNormIBOOverallE <- replace(data$BoxNormIBOOverall, data$BoxNormDtDOverall==1, NA)

## NormExtUnlim
normExtUnlimRem <- sum(is.na(data$BoxNormExtDtDUnlim))
data$BoxNormExtDtDUnlimE <- replace(data$BoxNormExtDtDUnlim, data$BoxNormExtDtDUnlim==1, NA)
normExtUnlimRem <- sum(is.na(data$BoxNormExtDtDUnlimE))-normExtUnlimRem
data$BoxNormExtIBOUnlimE <- replace(data$BoxNormExtIBOUnlim, data$BoxNormExtDtDUnlim==1, NA)
data$BoxNormExtProbUnlimE <- replace(data$BoxNormExtProbUnlim, data$BoxNormExtDtDUnlim==1, NA)
data$BoxNormExtOverconfUnlimE <- replace(data$BoxNormExtOverconfUnlim, data$BoxNormExtDtDUnlim==1, NA)

## NormExtLim
normExtLimRem <- sum(is.na(data$BoxNormExtDtDLim))
data$BoxNormExtDtDLimE <- replace(data$BoxNormExtDtDLim, data$BoxNormExtDtDLim==1, NA)
normExtLimRem <- sum(is.na(data$BoxNormExtDtDLimE))-normExtLimRem
data$BoxNormExtIBOLimE <- replace(data$BoxNormExtIBOLim, data$BoxNormExtDtDLim==1, NA)
data$BoxNormExtProbLimE <- replace(data$BoxNormExtProbLim, data$BoxNormExtDtDLim==1, NA)
data$BoxNormExtOverconfLimE <- replace(data$BoxNormExtOverconfLim, data$BoxNormExtDtDLim==1, NA)

# Remove ART results for extreme inverse temp (above 30)
artRem <- sum(data$ARTInverseLinear > 30)
data$ARTRiskLinearE <- replace(data$ARTRiskLinear, data$ARTInverseLinear > 30, NA)
data$ARTAmbigLinearE <- replace(data$ARTAmbigLinear, data$ARTInverseLinear > 30, NA)
data$ARTInverseLinearE <- replace(data$ARTInverseLinear, data$ARTInverseLinear > 30, NA)

# Z-scored variables
## Twojar
data$BeadsTwojarDtDOverallZ <- (data$BeadsTwojarDtDOverallE - mean(data$BeadsTwojarDtDOverallE, na.rm = TRUE)) / sd(data$BeadsTwojarDtDOverallE, na.rm = TRUE)
data$BeadsTwojarIBOOverallZ <- (data$BeadsTwojarIBOOverallE - mean(data$BeadsTwojarIBOOverallE, na.rm = TRUE)) / sd(data$BeadsTwojarIBOOverallE, na.rm = TRUE)
## Onejar
data$BeadsOnejarDtDOverallZ <- (data$BeadsOnejarDtDOverallE - mean(data$BeadsOnejarDtDOverallE, na.rm = TRUE)) / sd(data$BeadsOnejarDtDOverallE, na.rm = TRUE)
data$BeadsOnejarIBOOverallZ <- (data$BeadsOnejarIBOOverallE - mean(data$BeadsOnejarIBOOverallE, na.rm = TRUE)) / sd(data$BeadsOnejarIBOOverallE, na.rm = TRUE)
## Tone
data$BeadsToneDtDOverallZ <- (data$BeadsToneDtDOverallE - mean(data$BeadsToneDtDOverallE, na.rm = TRUE)) / sd(data$BeadsToneDtDOverallE, na.rm = TRUE)
data$BeadsToneIBOOverallZ <- (data$BeadsToneIBOOverallE - mean(data$BeadsToneIBOOverallE, na.rm = TRUE)) / sd(data$BeadsToneIBOOverallE, na.rm = TRUE)
## Irreg
data$BoxIrregDtDOverallZ <- (data$BoxIrregDtDOverallE - mean(data$BoxIrregDtDOverallE, na.rm = TRUE)) / sd(data$BoxIrregDtDOverallE, na.rm = TRUE)
data$BoxIrregIBOOverallZ <- (data$BoxIrregIBOOverallE - mean(data$BoxIrregIBOOverallE, na.rm = TRUE)) / sd(data$BoxIrregIBOOverallE, na.rm = TRUE)
## Norm
data$BoxNormDtDOverallZ <- (data$BoxNormDtDOverallE - mean(data$BoxNormDtDOverallE, na.rm = TRUE)) / sd(data$BoxNormDtDOverallE, na.rm = TRUE)
data$BoxNormIBOOverallZ <- (data$BoxNormIBOOverallE - mean(data$BoxNormIBOOverallE, na.rm = TRUE)) / sd(data$BoxNormIBOOverallE, na.rm = TRUE)
data[row.names(data)=="X326","BoxNormDtDOverallZ"] <- NA
data[row.names(data)=="X326","BoxNormIBOOverallZ"] <- NA
## NormExtUmlim
data$BoxNormExtDtDUnlimZ <- (data$BoxNormExtDtDUnlimE - mean(data$BoxNormExtDtDUnlimE, na.rm = TRUE)) / sd(data$BoxNormExtDtDUnlimE, na.rm = TRUE)
data$BoxNormExtIBOUnlimZ <- (data$BoxNormExtIBOUnlimE - mean(data$BoxNormExtIBOUnlimE, na.rm = TRUE)) / sd(data$BoxNormExtIBOUnlimE, na.rm = TRUE)
data$BoxNormExtProbUnlimZ <- (data$BoxNormExtProbUnlimE - mean(data$BoxNormExtProbUnlimE, na.rm = TRUE)) / sd(data$BoxNormExtProbUnlimE, na.rm = TRUE)
data$BoxNormExtOverconfUnlimZ <- (data$BoxNormExtOverconfUnlimE - mean(data$BoxNormExtOverconfUnlimE, na.rm = TRUE)) / sd(data$BoxNormExtOverconfUnlimE, na.rm = TRUE)
## NormExtLim
data$BoxNormExtDtDLimZ <- (data$BoxNormExtDtDLimE - mean(data$BoxNormExtDtDLimE, na.rm = TRUE)) / sd(data$BoxNormExtDtDLimE, na.rm = TRUE)
data$BoxNormExtIBOLimZ <- (data$BoxNormExtIBOLimE - mean(data$BoxNormExtIBOLimE, na.rm = TRUE)) / sd(data$BoxNormExtIBOLimE, na.rm = TRUE)
data$BoxNormExtProbLimZ <- (data$BoxNormExtProbLimE - mean(data$BoxNormExtProbLimE, na.rm = TRUE)) / sd(data$BoxNormExtProbLimE, na.rm = TRUE)
data$BoxNormExtOverconfLimZ <- (data$BoxNormExtOverconfLimE - mean(data$BoxNormExtOverconfLimE, na.rm = TRUE)) / sd(data$BoxNormExtOverconfLimE, na.rm = TRUE)
## Risk
data$ARTRiskLinearZ <- (data$ARTRiskLinearE - mean(data$ARTRiskLinearE, na.rm = TRUE)) / sd(data$ARTRiskLinearE, na.rm = TRUE)
## Amb
data$ARTAmbigLinearZ <- (data$ARTAmbigLinearE - mean(data$ARTAmbigLinearE, na.rm = TRUE)) / sd(data$ARTAmbigLinearE, na.rm = TRUE)
## Inverse
data$ARTInverseLinearZ <- (data$ARTInverseLinear - mean(data$ARTInverseLinear, na.rm = TRUE)) / sd(data$ARTInverseLinear, na.rm = TRUE)
## CAPE-P
data$CapePZ <- (data$CapeP - mean(data$CapeP, na.rm = TRUE)) / sd(data$CapeP, na.rm = TRUE)
## AQ
data$AQZ <- (data$AQ - mean(data$AQ, na.rm = TRUE)) / sd(data$AQ, na.rm = TRUE)
## NFC
data$NFCCSumZ <- (data$NFCCSum - mean(data$NFCCSum, na.rm = TRUE)) / sd(data$NFCCSum, na.rm = TRUE)
## FD
data$FDJoyZ <- (data$FDJoy - mean(data$FDJoy, na.rm = TRUE)) / sd(data$FDJoy, na.rm = TRUE)
data$FDDepZ <- (data$FDDep - mean(data$FDDep, na.rm = TRUE)) / sd(data$FDDep, na.rm = TRUE)
data$FDStressZ <- (data$FDStress - mean(data$FDStress, na.rm = TRUE)) / sd(data$FDStress, na.rm = TRUE)
data$FDSocialZ <- (data$FDSocial - mean(data$FDSocial, na.rm = TRUE)) / sd(data$FDSocial, na.rm = TRUE)
data$FDThrillZ <- (data$FDThrill - mean(data$FDThrill, na.rm = TRUE)) / sd(data$FDThrill, na.rm = TRUE)

# Collective variable for BoxUnlim and BoxNorm
data$BoxNormIBOCollectedZ <- rowSums(data[,c(212,214)], na.rm=TRUE)

# Reduced data set
dataRed <- data
dataRed <- dataRed[,c(121,122,123,124,155:232)]
dataRed <- dataRed[,-c(18:20,25:30)]
dataRed <- dataRed[,c(1,2,3,4,44:73)]

# Write data
write.csv(data, "Cleaned data/data_full.csv")
write.csv(dataRed, "Cleaned data/data_red.csv")