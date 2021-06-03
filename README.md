# Probabilistic reasoning & information sampling

### R-scripts for data extraction, cleaning and analysis.

#### Raw and clean data only uploaded to OSF (due to GDPR). Link:

#### Download the data, clone this repository, run the "MasterScript-DataExtractionMerging.R"-script, to extract, clean and merge all data, or use the "Loading-files.R"-script and choose task-wise script(s) for the task(s) you want data from. At the current time, this masterscript must be run line by line.
#### To run the analysis-script, the script above must run first, unless you already have the AllData.csv file, by either running the extraction scripts, or downloaded from OSF.

#### The following tasks are included:
- ART: Ambiguity and risk avoidance task (Levy et al.).
  - Data from 2018 and 2020.
- Beads Tasks (Philips and Edwards, 1966; Huq et al., 1988):
  - BeadsOnejar: Beads drawing task.
    - Data from 2018.
  - BeadsTone: Beads drawing task, auditory version.
    - Data from 2018.
  - BeadsTwojar: Beads drawing task, two jar version (Huq et al.).
    - Data from 2018 and 2020.
      - (Very) Minor difference in one (first) trial.
- Box Tasks:
  - BoxIrreg: Box opening task with disorganized placement of the boxes, no limit, two colours, ratio provided. Free sequences.
    - Data from 2018.
  - BoxNorm: Box opening task, with grid placement of the boxes, no limit, two colours, ratio provided. Free sequences.
    - Data from 2018.
  - BoxNormExt: Box opening task, with grid placement of the boxes, both no limit and limit trials, multiple colours, no ratio provided. Fixed sequences.
    - Data from 2020.

#### The following questionnaires are included:
- CAPE: Community assesment of psychotic traits.
  - Data from 2018 and 2020.
- AQ: Autism Spectrum Quotient (Baron-Cohen et al. 2006).
  - Data from 2020.
- FiveD: Five dimensional curiosity questionnaire.
  - Data from 2020.
- NfCC: Need for (cognitive) closure questionnaire.
  - Data from 2020

#### (Local) File-structure:
- All R-scripts in wd.
- Raw data/: Folder subfolders with raw-data.
- Intermidiate data/: Data saved before further use (e.g., ART long-format for hBayesDM, and hBayesDM outputs).
- Cleaned data/: CSV-files with extracted and cleaned data, both task-wise and collected.
- Obsolete scripts/: Scripts no longer in use, but might contain useful snippets.
- Tasks and other files/: The tasks and questionnaires, as well as other non-data related files from OSF.
- Presentation Jan. 2020/: Brief task-presentation from Jan. 2020.
- Presentation Aug. 2020/: Brief presentation for PhD pitch, August 2020.
- Analyses/: Random files saved relating to analyses.
- Article/: All files relating to the final article.

#### To-do:
- Exclusion according to prereg criteria, and flagging.
- Add analysis scripts to GitHub.
- Add link to OSF and vice versa
- Clean up project for easier overview for reviewers and interested readers.

#### _Could_ be improved / collected:
- Extract decisions for all Beads and Box tasks.

#### Other (random) notes:
- Variance in ambig and risk attitude estimations.
- Quantify degree of correct probability estimation during Box-task.
- Wrong choice after plenty of draws - Flagging (Beads and Box tasks).
- Extreme probability without decision (Box2020) - Flagging/taking as choice.
- Box-limit: Encountered "time-out", effect on next trial(s). Including in practice trial.
- Different decision-tactics/inference heuristics as models. E.g., streaks.
- Temprature measurement for beads and box.