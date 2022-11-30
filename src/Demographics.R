# Demographics - Collected from informed consent forms
## Age, sex, and area of study

## 2018
### Gender: 1:male, 0: female
genderp1 <- c(rep(1,10), 0, 0, 1, 0, rep(1,5), 0, 1)
genderp2 <- c(1,0,1,rep(0,5),1,0,0,1,0,1,rep(0,3))
genderp3 <- c(0,0,1,0,1,rep(0,5),1,0,1,0,1,0,1,0,0,1,0,0)
genderp4 <- c(1,1,0,1,1,1,0,0)
gendermissing <- c(rep(NA,3)) #3 participant debrief-forms missing
gender <- c(genderp1,genderp2,genderp3,genderp4, gendermissing)
### Age
agep1 <- c(26,21,24,27,22,27,23,22,23,21,22,22,21,23,18,22,22,21,30,26,23)
agep2 <- c(23,27,NA,32,24,22,21,21,25,28,19,19,24,22,34,20,22)
agep3 <- c(22,21,20,21,22,19,21,33,29,21,26,27,26,22,24,26,27,22,23,25,28,24)
agep4 <- c(27,36,24,23,24,34,24,23)
agemissing <- c(rep(NA,3)) #3 participant debrief-forms missing
age <- c(agep1,agep2,agep3,agep4, agemissing)
### Area of study: 1:psychology, 0:not psychology
studyp1 <- c(rep(0,21))
studyp2 <- c(0,0,NA,NA,1,rep(0,7),1,rep(0,4))
studyp3 <- c(1,rep(0,4),1,1,rep(0,5),1,1,0,rep(1,4),0,1,1)
studyp4 <- c(1,rep(0,7))
studymissing <- c(rep(NA,3)) #3 participant debrief-forms missing
study <- c(studyp1,studyp2,studyp3,studyp4, studymissing)
### Session: 0: 2018
session <- rep(0,71)
### Combined
Demo2018 <- cbind(gender,age,study,session)

## 2020
### Gender: 1:male, 0:female
gender <- c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,1,1,1, NA)
### Age
age <- c(21,23,23,23,23,23,22,21,21,22,22,20,20,21,34,25,20,23,21,24,21,22,21,25,21,22,20,21,19,31,32,20,22,20,24,NA,24,21,22,31,20,21,22,21,21,21,19,20,21,20,20,22,20,21,21,22,22,21,21,24,20,22,20,24,20,23,22,23,20,23,21,23,20,27,20,29, NA)
### Area of study: 1:psychology
study <- c(rep(1,77))
### Session: 1: 2020
session <- c(rep(1,77))
### Combined
Demo2020 <- cbind(gender,age,study,session)

## Combined
Demo <- rbind(Demo2018,Demo2020)

rm(Demo2018, Demo2020, age, agemissing, agep1, agep2, agep3, agep4, gender, gendermissing, genderp1, genderp2, genderp3, genderp4, session, study, studymissing, studyp1, studyp2, studyp3, studyp4)

write.csv(Demo, paste(getwd(),"/Cleaned data/Demo.csv", sep=""))


