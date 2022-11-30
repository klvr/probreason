# Sequence, session-type, and experimenter

# Experimenter
# Based on ID's (self-made: 4, 0XX: Lu, 1XX: Wi, 3XX: Le)
## 1: Individually tested by Lu
## 2: Individually tested by Wi
## 3: Individually tested by Le
## 4: Group tested by G.
Experimenter <- c(rep(4, 74), rep(1, 22), rep(2,23), rep(3, 26), rep(4, 3))
All$Experimenter <- Experimenter

# Session-type
# Based on ID's (self-made: 1, XXX: 0)
## 0: Individually tested
## 1: Group tested
Session <- c(rep(1,74), rep(0,71), rep(1,3))
All$Session <- Session

# SequenceBO
# Based on ID for 2018-data (XXX; odd: 0, even: 1)
# Based on "Manual coding sequences Box Beads ART" (based on screenshots of file-creation, verified by what group they were tested in)
## 0: Beads before box
## 1: Box before beads
SequenceBO <- c(1,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,1,0,1,1,1,0,0,0,0,0,0,1,1,1,0,1,0,0,0,1,0,1,1,0,1,0,0,1,1,0,0,0,1,1,1,1,0,0,1,1,1,1,1,rep(c(0,1),11),rep(c(0,1),11),0,rep(c(0,1),13),rep(1,3))
All$SequenceBO <- SequenceBO


# SequenceBA
# Based on ID (0 for all 2018-data, XXX; based on "Manual coding sequences Box Beads ART" for 2020-data)
## 0: BoxBeads before ART
## 1: ART before BoxBeads
SequenceBA <- c(1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,1,1,0,0,1,1,0,0,1,1,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,rep(0,71),1,1,0)
All$SequenceBA <- SequenceBA

rm(Experimenter, Session, SequenceBO, SequenceBA)