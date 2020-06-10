#Data extraction Risk and Ambiguity Task

path <- ARTaskPath
EAmbiguity <- "EAmbiguity"
AmbiguityE <- "AmbiguityE"
ambiguity <- "ambiguity"
trials <- "trials"
EAmbiguity <- path[grepl(pattern = EAmbiguity, path)]
AmbiguityE <- path[grepl(pattern = AmbiguityE, path)]
ambiguity <- path[grepl(pattern = ambiguity, path)]
ambiguity <- ambiguity[!grepl(pattern = trials, ambiguity)]

EADisp <- do.call(cbind, lapply(EAmbiguity, function(x) as.character(read.csv(x)[15:135,3])))
EARew <- do.call(cbind, lapply(EAmbiguity, function(x) read.csv(x)[15:135,4]))
EAID <- do.call(rbind, lapply(EAmbiguity, function(x) as.character(read.csv(x)[3, "participant"])))
EARewP <- do.call(cbind, lapply(EAmbiguity, function(x) read.csv(x)[15:135,6]))
EAChoice <- do.call(cbind, lapply(EAmbiguity, function(x) as.character(read.csv(x)[15:135, "key_resp_2.keys"])))
colnames(EADisp) <- EAID
colnames(EARew) <- EAID
colnames(EARewP) <- EAID
colnames(EAChoice) <- EAID[-c(1, 10)] #See line 29
EADisp <- EADisp[-61,]
EARew <- EARew[-61,]
EARewP <- EARewP[-61,]
EAChoice <- EAChoice[-61,]
EADisp <- EADisp[,-c(1, 10, 15)]
EARew <- EARew[,-c(1, 10, 15)]
EARewP <- EARewP[,-c(1, 10, 15)]
EAChoice <- EAChoice[,-c(13)] #Participant 1 and 10 not removed here, as they are not read in due to missing this variable, 15 from above is 13 here

AEDisp <- do.call(cbind, lapply(AmbiguityE, function(x) as.character(read.csv(x)[4:124,1])))
AERew <- do.call(cbind, lapply(AmbiguityE, function(x) read.csv(x)[4:124, 2]))
AEID <- do.call(rbind, lapply(AmbiguityE, function(x) as.character(read.csv(x)[3, "participant"])))
AERewP <- do.call(cbind, lapply(AmbiguityE, function(x) read.csv(x)[4:124, 4]))
AEChoice <- do.call(cbind, lapply(AmbiguityE, function(x) as.character(read.csv(x)[4:124, "key_resp_2.keys"])))
AEID[13]<- "en05ar27"
AEID[26]<- "ER08OM01"
colnames(AEDisp) <- AEID
colnames(AERew) <- AEID
colnames(AERewP) <- AEID
colnames(AEChoice) <- AEID[-29]
AEDisp <- AEDisp[-61,]
AERew <- AERew[-61,]
AERewP <- AERewP[-61,]
AEChoice <- AEChoice[-61,]
AEDisp <- AEDisp[,-c(29, 31)]
AERew <- AERew[,-c(29, 31)]
AERewP <- AERewP[,-c(29, 31)]
AEChoice <- AEChoice[,-30] #Same as line 29. 29 never recorded, 30 is the same as 31 above

AmDisp <- do.call(cbind, lapply(ambiguity, function(x) as.character(read.csv(x)[2:144,1])))
AmRew <- do.call(cbind, lapply(ambiguity, function(x) read.csv(x)[2:144,2]))
AmID <- do.call(rbind, lapply(ambiguity, function(x) paste("A", as.character(read.csv(x)[3, "participant"]), sep="")))
AmRewP <- do.call(cbind, lapply(ambiguity, function(x) read.csv(x)[2:144, 4]))
AmChoice <- do.call(cbind, lapply(ambiguity, function(x) as.character(read.csv(x)[2:144, "key_resp_2.keys"])))
AmChoice2 <- do.call(cbind, lapply(ambiguity, function(x) as.character(read.csv(x)[2:22, "key_resp_exp.keys"])))
AmChoice <- rbind(AmChoice2, AmChoice[-c(1:22),-28])
AmID[27:36] <- paste("A00", seq(0, 9), sep="")
AmID[37:49] <- paste("A0", seq(10, 22), sep="")
AmID[27] <- paste("A001")
colnames(AmDisp) <- AmID
colnames(AmRew) <- AmID
colnames(AmRewP) <- AmID
colnames(AmChoice) <-AmID[-27]
AmDisp <- AmDisp[-c(22,83),]
AmRew <- AmRew[-c(22,83),]
AmRewP <- AmRewP[-c(22,83),]
AmChoice <- AmChoice[-82,] #Same as line 29. 22 never recorded, 82 is the same as 83 above
AmDisp <- AmDisp[,-28]
AmRew <- AmRew[,-28]
AmRewP <- AmRewP[,-28]

Disp <- cbind(AEDisp, EADisp, AmDisp[1:120,])
prob <- Disp
ambig <- Disp

ambig <- replace(ambig, ambig== "risky_blue_p13_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_blue_p25_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_blue_p38_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_red_p13_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_red_p25_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_red_p38_urns.jpg",0)
ambig <- replace(ambig, ambig=="ambiguous25_urn.jpg", 0.25)
ambig <- replace(ambig, ambig=="ambiguous50_urn.jpg", 0.50)
ambig <- replace(ambig, ambig=="ambiguous75_urn.jpg", 0.75)

prob <- replace(prob, prob=="ambiguous25_urn.jpg", 0.50)
prob <- replace(prob, prob=="ambiguous50_urn.jpg", 0.50)
prob <- replace(prob, prob=="ambiguous75_urn.jpg", 0.50)
prob <- replace(prob, prob=="risky_blue_p13_urns.jpg", 0.13)
prob <- replace(prob, prob=="risky_blue_p25_urns.jpg", 0.25)
prob <- replace(prob, prob=="risky_blue_p38_urns.jpg", 0.38)
prob <- replace(prob, prob=="risky_red_p13_urns.jpg", 0.13)
prob <- replace(prob, prob=="risky_red_p25_urns.jpg", 0.25)
prob <- replace(prob, prob=="risky_red_p38_urns.jpg", 0.38)

Reward <- cbind(AERew, EARew, AmRew[1:120,])
reward_var <- Reward
reward_fix <- Reward
reward_fix <- replace(reward_fix, !reward_fix=="0", 5)

Choice <- cbind(AEChoice, EAChoice, AmChoice[1:120,])
Choice <- replace(Choice, !Choice== "2",0)
Choice <- replace(Choice, Choice== "2",1)

ID <- colnames(Choice)

subjID <- rep(ID, each=120)
prob <- as.numeric(prob)
ambig <- as.numeric(ambig)
reward_var <- as.numeric(reward_var)
reward_fix <- as.numeric(reward_fix)
choice <- as.numeric(Choice)
ARTaskhBayDM <- as.data.frame(cbind(subjID, prob, ambig, reward_var, reward_fix, choice))

write.table(ARTaskhBayDM, file = paste(getwd(), "/Intermidiate data/ART.txt", sep=""), sep = "\t", row.names = FALSE, quote = FALSE)

rm(AEChoice, AEDisp, AEID, AERew, AERewP, AmChoice, AmChoice2, AmDisp, AmID, AmRew, AmRewP, EAChoice, EADisp, EAID, EARew, EARewP, Reward, ambiguity, AmbiguityE, EAmbiguity, path, trials, Choice, Disp, ambig, choice, ID, prob, reward_fix, reward_var, subjID)