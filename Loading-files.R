#Script for loading data-files

#Keep all data-files in the current work-directory (getwd()) in a folder called "Raw Data". Can be kept in sub-folders
## Raw data (as of now) downloaded from https://osf.io/k8w29/ (entire raw data folder) and https://osf.io/n7qwd/ (the two [top] raw data folders)
## Ideally, just extract the files from OSF directly into the "Raw Data" folder, without moving anything, as some experimenters has made some differences in naming files
#AAA# One exception, the CAPE-P came extracted, raw data is incomplete

### File-structure (for me) is as follows: Raw Data / Year / Task-wise[2020] & Experimenter-wise[2018; lsy/lt/wnh] - No files / folders have been moved nor renamed
### with the exception of moving the lt-folder out of the lsy-folder
### getwd():"/Users/klevjer/R Projects/Probabilistic Reasoning"
### dir("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw Data"): "2018" "2020"
### dir("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw Data/2018"): "raw_data_lsy" "raw_data_lt"  "raw_data_wnh"
### dir("/Users/klevjer/R Projects/Probabilistic Reasoning/Raw Data/2020"): "Ambiguity+Effort" "beads DtD task"   "BoxTask"          "CAPE-P"

#IMPORTANT: Files-names must contain the task-name! See line 23
## This is not the case for the 2020-data for the Box-task, which are loaded manually

#List all files
path <- paste(getwd(), "/Raw Data", sep="")
allfiles <- list.files(path, recursive = TRUE, all.files = FALSE, full.names = TRUE)

#Seperate into task-wise lists
tasks <- c("ambiguity", "beads_task", "onejar", "tone", "irreg", "_box_task_", "Cape")
for(i in seq(tasks)) {
  name <- paste(tasks[i], "Path", sep = "")
  files <- allfiles[grepl(tasks[i], allfiles, ignore.case = TRUE)]
  files <- files[grepl("*.csv", files)]
  assign(name, files)
}

#ART
ARTaskPath <- ambiguityPath #Rename

#Beads
BeadsTwojarTaskPath <- beads_taskPath #Rename

#OneJar
BeadsOnejarTaskPath <- onejarPath #Rename

#Tone
BeadsToneTaskPath <- tonePath #Rename

#irregbox
BoxIrregTaskPath <- irregPath #Rename

#_box_task_
BoxTaskPath <- `_box_task_Path` #Rename
Error <- "irreg"
BoxTaskPath <- BoxTaskPath[grep(Error, BoxTaskPath, invert=TRUE)] #Remove incorrectly fetched files (naming/placement errors)
ManualPath <- paste(getwd(),"/Raw Data/2020/BoxTask", sep = "")
ManualPath <- list.files(ManualPath, pattern = "ID_", recursive = TRUE, all.files = FALSE, full.names = TRUE) #Adds the non-box-named files
BoxTaskPath <- c(BoxTaskPath, ManualPath) #Fuse together

#Clean-up
rm(`_box_task_Path`, allfiles, ambiguityPath, beads_taskPath, Error, files, i, irregPath, ManualPath, name, onejarPath, path, tasks, tonePath)