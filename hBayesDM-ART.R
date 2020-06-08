#hBayesDM

StartTime <- cbind(Sys.time())

ARThBayesDMLinear <- hBayesDM::cra_linear(data = paste(getwd(), "/Cleaned data/ART.txt", sep=""),niter = 4000, nwarmup = 1000, indPars = "mean", nchain = 4, ncore = 4, nthin = 1, inits = "vb", vb = FALSE, inc_postpred = FALSE, adapt_delta = 0.95, stepsize = 1, max_treedepth = 10, modelRegressor = TRUE)
save(ARThBayesDMLinear, file ="hBayesDMLinear.RData")

plot(ARThBayesDMLinear, type = "trace") #Visually check convergence of the sampling chains (should look like "hairy caterpillars")

rhat(ARThBayesDMLinear) #All Rhat values should be less than or equal to 1.1

plot(ARThBayesDMLinear) #Plotting the posterior distributions of the hyper-parameters (distributions should be unimodal)

printFit(ARThBayesDMLinear) #Show the WAIC and LOOIC model fit estimates

LinearEndTime <- cbind(Sys.time())

ARThBayesDMExp <- hBayesDM::cra_exp(data = paste(getwd(), "/Cleaned data/ART.txt", sep=""),niter = 4000, nwarmup = 1000, indPars = "mean", nchain = 4, ncore = 4, nthin = 1, inits = "vb", vb = FALSE, inc_postpred = FALSE, adapt_delta = 0.95, stepsize = 1, max_treedepth = 10, modelRegressor = TRUE)
save(ARThBayesDMExp, file ="hBayesDMExp.RData")

plot(ARThBayesDMExp, type = "trace") #Visually check convergence of the sampling chains (should look like "hairy caterpillars")

rhat(ARThBayesDMExp) #All Rhat values should be less than or equal to 1.1

plot(ARThBayesDMExp) #Plotting the posterior distributions of the hyper-parameters (distributions should be unimodal)

printFit(ARThBayesDMExp) #Show the WAIC and LOOIC model fit estimates

ExpEndTime <- cbind(Sys.time())

save(c(StartTime, LinearEndTime, ExpEndTime), file = "time.RData")