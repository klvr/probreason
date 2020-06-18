# Probabilistic reasoning & information sampling

R-scripts for data extraction, cleaning and analysis.

Raw and clean data only uploaded to OSF (GDPR).

Download the data, run the "Loading-files.R"-script, and then use the task-wise script(s) for the task(s) you want data from.
To run the analysis-script, all task-wise extraction scripts must run first (unless you have the collected cleaned data file).

The following tasks are included:
- ART: Ambiguity and risk avoidance task (Levy et al.).
  - Data from 2018 and 2020.
- Beads Tasks:
  - BeadsOnejar: Beads drawing task (computerized version of the Philips and Edwards task).
    - Data from 2018.
  - BeadsTone: Beads drawing task, auditory version.
    - Data from 2018.
  - BeadsTwojar: Beads drawing task, two jar version (Huq et al.).
    - Data from 2018 and 2020.
      - Minor difference in two trials.
- Box Tasks:
  - BoxIrreg: Box opening task with disorganized placement of the boxes, no limit, two colours, ratio provided. Free sequences.
    - Data from 2018.
  - BoxNorm: Box opening task, with grid placement of the boxes, no limit, two colours, ratio provided. Free sequences.
    - Data from 2018.
  - BoxNew: Box opening task, with grid placement of the boxes, both no limit and limit trials, multiple colours, no ratio provided. Fixed sequences.
    - Data from 2020.

The following questionnaires are included:
- CAPE: Community assesment of psychotic traits.
  - Data from 2018 and 2020.
- FiveD: Five dimensional curiosity questionnaire.
  - Data from 2020.
- NfCC: Need for (cognitive) closure questionnaire.
  - Data from 2020

(Local) File-structure:
- All R-scripts in wd.
- Raw data/: Folder subfolders with raw-data.
- Intermidiate data/: Data saved before further use (e.g., ART long-format for hBayesDM, and hBayesDM outputs).
- Cleaned data/: CSV-files with extracted and cleaned data, both task-wise and collected.
- Obsolete scripts/: Scripts no longer in use, but might contain useful sniippets.
- Tasks and other files/: The tasks and questionnaires, as well as other non-data related files from OSF.
- Presentation Jan. 2020/: Brief task-presentation from Jan. 2020.

To-do:
- Sequences of tasks.
  - Use time-stamps to check for sequence for 2020.
- Experimenter logging.
  - 0XX -> Lu
  - 1XX -> Wib
  - 3XX -> Leo
- Quality check all extractions.
- hBayesDM Pareto fail, tuning needed(?).
- Master script for running sub-scripts.
- Exclusion according to prereg criteria.
- Merging.
- Ideal Baysian Observer.
- Analysis.

Random working notes:
- sum(rowSums(BeadsTask[1:5]) < 10) == 16 (21%) !