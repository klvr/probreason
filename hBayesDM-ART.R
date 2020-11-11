#hBayesDM - cra_linear & cra_exp

try({load(paste(getwd(), "/Intermidiate data/hBayesDMLinear.RData", sep=""))})
if (exists("ARThBayesDMLinear")) {print("Data loaded from file")} else {
ARThBayesDMLinear <- hBayesDM::cra_linear(data = paste(getwd(), "/Intermidiate data/ART.txt", sep=""),niter = 12000, nwarmup = 3000, indPars = "mean", nchain = 7, ncore = 7, nthin = 1, inits = "vb", vb = FALSE, inc_postpred = FALSE, adapt_delta = 0.95, stepsize = 1, max_treedepth = 10, modelRegressor = FALSE)
save(ARThBayesDMLinear, file ="Intermidiate data/hBayesDMLinear.RData")
}

ARTLinearEst <- ARThBayesDMLinear$allIndPars

plot(ARThBayesDMLinear, type = "trace", fontSize=11) #Visually check convergence of the sampling chains (should look like "hairy caterpillars")

hBayesDM::rhat(ARThBayesDMLinear) #All Rhat values should be less than or equal to 1.1
max(hBayesDM::rhat(ARThBayesDMLinear))

plot(ARThBayesDMLinear) #Plotting the posterior distributions of the hyper-parameters (distributions should be unimodal)

hBayesDM::printFit(ARThBayesDMLinear) #Show the WAIC and LOOIC model fit estimates

try({load(paste(getwd(), "/Intermidiate data/hBayesDMExp.RData", sep=""))})
if (exists("ARThBayesDMExp")) {print("Data loaded from file")} else {
  ARThBayesDMExp <- hBayesDM::cra_exp(data = paste(getwd(), "/Intermidiate data/ART.txt", sep=""),niter = 12000, nwarmup = 3000, indPars = "mean", nchain = 7, ncore = 7, nthin = 1, inits = "vb", vb = FALSE, inc_postpred = FALSE, adapt_delta = 0.95, stepsize = 1, max_treedepth = 10, modelRegressor = FALSE)
  save(ARThBayesDMExp, file ="Intermidiate data/hBayesDMExp.RData")
}

ARTExpEst <- ARThBayesDMExp$allIndPars

plot(ARThBayesDMExp, type = "trace") #Visually check convergence of the sampling chains (should look like "hairy caterpillars")

hBayesDM::rhat(ARThBayesDMExp) #All Rhat values should be less than or equal to 1.1
max(hBayesDM::rhat(ARThBayesDMExp))

plot(ARThBayesDMExp) #Plotting the posterior distributions of the hyper-parameters (distributions should be unimodal)

hBayesDM::printFit(ARThBayesDMExp) #Show the WAIC and LOOIC model fit estimates

ARTEst <- cbind(ARTLinearEst, ARTExpEst)
ARTEst[,1] <- as.character(ARTEst[,1])
ARTEst[1,1] <- paste("X", ARTEst[1,1], sep="")
ARTEst[2,1] <- paste("X", ARTEst[2,1], sep="")
ARTEst[78:148,1] <- gsub("A", "X", ARTEst[78:148,1])
ARTEst[39,1] <- "ON05NS23" #See Manual-ID-fix.R
ARTEst[73,1] <- "STERIG"
row.names(ARTEst) <- ARTEst[,1]
ARTEst <- ARTEst[,-c(1,5)]
names <- c("ARTRiskLinear", "ARTAmbigLinear", "ARTInverseLinear", "ARTRiskExp", "ARTAmbigExp", "ARTInverseExp")
colnames(ARTEst) <- names

write.csv(ARTEst, file = "Cleaned data/ARTEst.csv")

rm(names, ARThBayesDMLinear, ARThBayesDMExp, ARTExpEst, ARTLinearEst, ARTaskhBayDM)
