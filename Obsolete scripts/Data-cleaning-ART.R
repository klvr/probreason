#Data-cleaning Risk and Ambiguity Task
#Manually removed the fdsfdsfds-participant file, and kanhil_misforsto as these created a lot of trouble
#In the script, ghgj, htr645 and 56yg are removed as well. Important to leave those files in(!) however the
#solution I've gone for is not very good, as any additional data would destroy this.
#In the future incomplete data should be removed in the script, and not manually, but works _for now_.

#Get files ready
path <- "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort/" #Set to local path / directory of raw files for Ambiguity+Effort
EAmbiguity <- "EAmbiguity"
AmbiguityE <- "AmbiguityE"
EAFiles <- list.files(path = path, pattern = EAmbiguity)
AEFiles <- list.files(path = path, pattern = AmbiguityE)
EAFiles <- EAFiles[grepl("*.csv", EAFiles)]
AEFiles <- AEFiles[grepl("*.csv", AEFiles)]
EAID <- sapply(strsplit(EAFiles, split='_EAmbiguity', fixed=TRUE), function(x) (x[1]))
AEID <- sapply(strsplit(AEFiles, split='_AmbiguityE', fixed=TRUE), function(x) (x[1])) 
EAFiles <- paste(path, EAFiles, sep = "")
AEFiles <- paste(path, AEFiles, sep = "")

#Displayed gamble, used for both probability(prob) and ambiguity(ambig)
EADisp <- do.call(cbind, (lapply(EAFiles, function(x) as.character(read.csv(x)[15:135,3]))))
EADisp <- EADisp[,-1] #Incomplete cases
AEDisp <- do.call(cbind, (lapply(AEFiles, function(x) as.character(read.csv(x)[4:124,1]))))
AEDisp <- AEDisp[,-c(29,31)] #Incomplete cases
Disp <- cbind(EADisp, AEDisp)
Disp <- Disp[-61,] #Data is written with a break at line 61
prob <- Disp
ambig <- Disp

#Ambiguity level
ambig <- replace(ambig, ambig== "risky_blue_p13_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_blue_p25_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_blue_p38_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_red_p13_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_red_p25_urns.jpg",0)
ambig <- replace(ambig, ambig== "risky_red_p38_urns.jpg",0)
ambig <- replace(ambig, ambig=="ambiguous25_urn.jpg", 0.25)
ambig <- replace(ambig, ambig=="ambiguous50_urn.jpg", 0.50)
ambig <- replace(ambig, ambig=="ambiguous75_urn.jpg", 0.75)

#Objective probability of winning
prob <- replace(prob, prob=="ambiguous25_urn.jpg", 0.50)
prob <- replace(prob, prob=="ambiguous50_urn.jpg", 0.50)
prob <- replace(prob, prob=="ambiguous75_urn.jpg", 0.50)
prob <- replace(prob, prob=="risky_blue_p13_urns.jpg", 0.13)
prob <- replace(prob, prob=="risky_blue_p25_urns.jpg", 0.25)
prob <- replace(prob, prob=="risky_blue_p38_urns.jpg", 0.38)
prob <- replace(prob, prob=="risky_red_p13_urns.jpg", 0.13)
prob <- replace(prob, prob=="risky_red_p25_urns.jpg", 0.25)
prob <- replace(prob, prob=="risky_red_p38_urns.jpg", 0.38)

#Reward
EARew <- do.call(cbind, (lapply(EAFiles, function(x) read.csv(x)[15:135,4])))
EARew <- EARew[,-1] #Incomplete cases
AERew <- do.call(cbind, (lapply(AEFiles, function(x) read.csv(x)[4:124,2])))
AERew <- AERew[,-c(29,31)] #Incomplete cases
Reward <- cbind(EARew, AERew)
Reward <- Reward[-61,] #Data is written with a break at line 61
reward_var <- Reward
reward_fix <- Reward
reward_fix <- replace(reward_fix, !reward_fix=="0", 5) #Input fixed lottary reward

#Position of reward (red(negative) or blue(positive) as the winning colour), accounted for in the names for the risky, and doesn't matter for the amb-trils, unless one want to check for colour preferences/biases
EARewP <- do.call(cbind, (lapply(EAFiles, function(x) read.csv(x)[15:135,6])))
EARewP <- EARewP[,-1] #Incomplete cases
AERewP <- do.call(cbind, (lapply(AEFiles, function(x) read.csv(x)[4:124,4])))
AERewP <- AERewP[,-c(29,31)] #Incomplete cases
RewardP <- cbind(EARewP, AERewP)
RewardP <- RewardP[-61,] #Data is written with a break at line 61

#Participant choice (fixed or no-choice(0), or variable(1) lottary choosen)
EAChoice <- do.call(cbind, (lapply(EAFiles, function(x) as.character(read.csv(x)[15:135,"key_resp_2.keys"]))))
AEChoice <- do.call(cbind, (lapply(AEFiles, function(x) as.character(read.csv(x)[4:124,48]))))
AEChoice <- AEChoice[,-30] #Incomplete cases, however two are removed when reading, so this is the only (adjusted) removed manually
Choice <- cbind(EAChoice, AEChoice)
Choice <- Choice[-61,] #Data is written with a break at line 61
Choice <- replace(Choice, !Choice== "2",0)
Choice <- replace(Choice, Choice== "2",1)

#ID's
AEID <- AEID[-c(29,31)] #The incomplete cases removed from the ID-string
EAID <- EAID[-1]
ID <- c(EAID, AEID)

#Make ready for hBayesDM Linear Subjective Value Model
subjID <- rep(ID, each=120)
prob <- as.numeric(prob)
ambig <- as.numeric(ambig)
reward_var <- as.numeric(reward_var)
reward_fix <- as.numeric(reward_fix)
choice <- as.numeric(Choice)
Data <- as.data.frame(cbind(subjID, prob, ambig, reward_var, reward_fix, choice))
write.table(Data, file = "ART.txt", sep = "\t", row.names = FALSE) #Create txt-file to use find and replace to remove all ".. Bah.
#ART.txt (after find and replace) is now ready for cra_linear
