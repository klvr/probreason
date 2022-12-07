# 'Ambiguity Aversion is Not Related to Delusion Ideation nor Hasty Decision-Making in Two Sequential Information Sampling Tasks'

## Repository for R-scripts related to the article.

Raw and clean data only uploaded to the [OSF-repository](https://osf.io/k8w29/) (due to GDPR).

### Contains R-scripts for data extraction, cleaning, and analysis.

I.e., from raw data (as outputted by the materials used) to cleaned data, and to the analyses, tables, and figures as presented both in the main article as well as the supplementary material.

## Tasks and self-reports included.

#### The following behavioural tasks were used:

-   ART: Choice under Risk and Ambiguity Task (Levy et al., 2010).
    -   Data from 2018 and 2020.
-   Beads task information sampling paradigm (Philips and Edwards, 1966; Huq et al., 1988):
    -   BeadsTwojar: Beads drawing task, two-urn variant.
        -   Data from 2018 and 2020.
    -   BeadsOnejar: Beads drawing task, one-urn variant.
        -   Data from 2018.
    -   BeadsTone: Beads drawing task, auditory variant.
        -   Data from 2018.
-   Box task information sampling paradigm (Clark et al., 2006; Andreou et al., 2015; Balzan et al., 2017; Moritz et al., 2017)
    -   BoxNorm: Box opening task, with grid placement of the boxes, no sampling limit, ratio provided, free sequences.
        -   Data from 2018.
    -   BoxNormExt: Box opening task, with grid placement of the boxes, both sampling limit and non-limited trials, no ratio provided, fixed sequences, and self-reported confidence throughout.
        -   Data from 2020.
    -   BoxIrreg: Box opening task with disorganized placement of the boxes, no sampling limit, ratio provided, free sequences.
        -   Data from 2018.

#### The following self-report measures were used:

-   CAPE: Community Assessment of Psychic Experiences (Stefanis et al., 2002; positive symptoms sub-scale).
    -   Data from 2018 and 2020.
-   FiveD: Five dimensions of curiosity questionnaire (Kashdan et al., 2018).
    -   Data from 2020.
-   NfCC: Need for (cognitive) closure questionnaire (Roets & Van Hiel, 2011).
    -   Data from 2020

## Environment, package-versions or other issues:

If you have any issues with running any of the scripts, one solution is to use the ['renv'-package](https://rstudio.github.io/renv/articles/renv.html). Install this package on your local machine, and follow the guide in the link. By using the 'renv.lock' file and folder uploaded here you can recreate my local environment (i.e., specific versions of packages).

## How to use this repository:

This repository contains three main parts, that all can be used in isolation.

Part 1: All task files used to run the experiment(s) as done in the current article. See 'materials' in the project structure below.

Part 2 is the pipeline from raw/source data (as outputted by the material) to a collected, cleaned and summarised data-set (both within-task, and collected into one data-frame/file). Given that you have downloaded the raw data from OSF, and mirrored the structure as seen below, you can recreate the collective data file from scratch. See 'src' in the project structure below on how to proceed.

Part 3 is the pipeline from cleaned data (summary file), to the presented analyses, tables and plots. This part can be ran independently (given that you have downloaded the collective data file from OSF), or in conjunction with part 2 to recreate all presented data in the current article. See 'src' in the project structure below on how to proceed.

## Project structure:

    project/
    │   README.md                     - ReadMe file
    │   Probabilistic Reasoning.Rproj - RProject file
    |   renv.lock                     - File for recreating local R environment
    │
    └───data/ - Real data not pushed to GitHub
    │   │
    │   └───processed/ - All processed data files from scripts are saved here
    │   │   Happens automatically when running scripts. This section will not be updated
    │   │
    │   └───raw/ - All raw output files from the experiments. Treated as read-only
    │   │   │
    │   │   └───2018/ - All raw output files from 2018 (experiment 1)
    │   │   │   │
    │   │   │   └───raw_data_lsy/ - Collected by experimenter 'lsy'
    │   │   │   │   │ 
    │   │   │   │   └───301/ - Data from participant '301'
    │   │   │   │   :   │
    │   │   │   │   :   └───301_ambiguity/    - ART data
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*.csv
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*trials_2.csv
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*trials_3.csv
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*trials.csv
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*.xlsx
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*.psydat
    │   │   │   │   :   │   ID_ambiguity_1806lt_YEAR_Month_Date_*.log
    │   │   │   │   :   │
    │   │   │   │   :   └───301_boxtaskirreg/ - Box Irreg data
    │   │   │   │   :   │   ID_irregbox_task_norm_LANG_YEAR_Month_Date_*.csv
    │   │   │   │   :   │   ID_irregbox_task_norm_LANG_YEAR_Month_Date_*.psydat
    │   │   │   │   :   │   ID_irregbox_task_norm_LANG_YEAR_Month_Date_*.log
    │   │   │   │   :   │
    │   │   │   │   :   └───301_boxtaskreg/   - Box Norm data
    │   │   │   │   :   │   ID_box_task_YEAR_Month_Date_*.csv
    │   │   │   │   :   │   ID_box_task_YEAR_Month_Date_*.psydat
    │   │   │   │   :   │   ID_box_task_YEAR_Month_Date_*.log
    │   │   │   │   :   │
    │   │   │   │   :   └───301_cape/         - CAPE data
    │   │   │   │   :   │   ID_Cape-42_YEAR_Month_Date_*.csv
    │   │   │   │   :   │   ID_Cape-42_YEAR_Month_Date_*CAPE_p.csv
    │   │   │   │   :   │   ID_Cape-42_YEAR_Month_Date_*.xlsx
    │   │   │   │   :   │   ID_Cape-42_YEAR_Month_Date_*.psydat
    │   │   │   │   :   │
    │   │   │   │   :   └───301_DtDbeads/     - Beads two-urn data
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*.csv
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*trials_2.csv
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*trials_3.csv
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*trials_4.csv
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*trials_5.csv
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*trials.csv
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*.xlsx
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*.psydat
    │   │   │   │   :   │   ID_beads_task_DtD_norm_LANG_wb1_YEAR_Month_Date_*.log
    │   │   │   │   :   │
    │   │   │   │   :   └───301_notes/        - Debrief + misc
    │   │   │   │   :   │   post_session_questionnaire_ID.docx
    │   │   │   │   :   │
    │   │   │   │   :   └───301_onejar/       - Beads one-urn data
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*.csv
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*trials_2.csv
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*trials_3.csv
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*trials_4.csv
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*trials.csv
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*.xlsx
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*.psydat
    │   │   │   │   :   │   ID_onejar_beads_norm_LANG_YEAR_Month_Date_*.log
    │   │   │   │   :   │
    │   │   │   │   :   └───301_tone/         - Beads auditory data
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*.csv
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*trials_2.csv
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*trials_3.csv
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*trials_4.csv
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*trials.csv
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*.xlsx
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*.psydat
    │   │   │   │   :       ID_tone_task_YEAR_Month_Date_*.log
    │   │   │   │   :
    │   │   │   │   └───ID/ - Data from participant ID
    │   │   │   │   Participants 301-326
    │   │   │   │
    │   │   │   └───raw_data_lt/ - Collected by experimenter 'lt'
    │   │   │   │   Pariticpants 001-022
    │   │   │   │
    │   │   │   └───raw_data_wnh/ - Collected by experimenter 'wnh'
    │   │   │       Pariticpants 101-123
    │   │   │
    │   │   └───2020/ All raw output files from 2020 (experiment 2)
    |   |       |
    |   |       └───Ambiguity+Effort/ - ART data
    |   |       |   ID_EAmbiguity_YEAR_Month_Date_*.csv
    |   |       |   ID_AmbiguityE_YEAR_Month_Date_*.csv
    |   |       :
    |   |       |   ID_EAmbiguity_YEAR_Month_Date_*.psydat
    |   |       |   ID_AmbiguityE_YEAR_Month_Date_*.psydat
    |   |       :
    |   |       |   ID_AmbiguityE_YEAR_Month_Date_*.log
    |   |       |   ID_AmbiguityE_YEAR_Month_Date_*.log
    |   |       :
    |   |       └───beads DtD task/   - Beads two-urn data
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*.csv
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*trials_2.csv
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*trials_3.csv
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*trials_4.csv
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*trials_5.csv
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*trials.csv
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*.xlsx
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*.psydat
    |   |       |   ID_beads_task_DtD_v2020_YEAR_Month_Date_*.log
    |   |       :
    |   |       └───BoxTask/          - Box Norm Ext, NfCC, FiveD, & CAPE data
    |   |       |   ID_ID.xlsx
    |   |       :
    |   |       └───CAPE-P/           - CAPE data
    |   |       |   ID_language_expCAPE_loop_1.csv
    |   |       |   ID_language_expCAPE_loop_2.csv
    |   |       :
    |   |       music_data.csv        - CAPE data collected in other session
    |   |
    │   └───temp/ - Temporary files from scripts.
    │       Happens automatically when running scripts. This section will not be updated
    │
    └───materials/ - Task files for adminisering the tasks and self-reports
    |   |        NB: We are not the original creators of these, please refer to the
    |   |        original authors as cited in the article
    |   |
    |   └───2018/ - All files needed to run the tasks in experiment 1
    |   |   |
    |   |   └───Ambiguity/ - All files needed to run the ART    
    |   |   |
    |   |   └───Beads/ - All files needed to run the Beads tasks
    |   |   |
    |   |   └───Box/ - All files needed to run the Box tasks
    |   |   |
    |   |   └───CAPE/ - All files needed to adminster the CAPE
    |   |
    |   └───2020/ - All files needed to run the tasks in experiment 2
    |       |
    |       └───Ambiguity/ - All files needed to run the ART    
    |       |
    |       └───Beads/ - All files needed to run the Beads task
    |       |
    |       └───Box+SelfRep/ - All files needed to run the Box Ext task
    |                          Also administeres the NfCC, FiveD and CAPE
    |
    └───output/ - All output files (excluding pure processed data files).
    │   Happens automatically when running scripts. This section will not be updated.
    │
    └───renv/ - Files used by 'renv.lock' to recreate local R-session used.
    │
    └───src/ - All script files (function, extraction, clearning, analyses and plots).
    |          Run order in brackets:
    |          1-4: Extraction & summarizing raw data (source-wise) - Outputs in 'data/*'
    |          5:   Merging extracted data (across sources).        - Outputs in 'data/processed/'
    |          6-X: Analyses of merged data (for each experiment).  - Outputs in 'output/*'
    |          Y-Z: Plots to be used in the articles or otherwise.  - Outputs in 'output/*'
    |    jatos_extraction.R      - Script for extracting and summarising Dice-task files.    [3]
    |    merging_data.R          - Script for merging data across tasks.                     [5]
    |    pavlovia_extraction.R   - Script for extracting and summarising Box-task files.     [4]
    |    qualtrics_cleanup.R     - Script for cleaning up qualtrics files before extraction. [1]
    |    qualtrics_extraction.R  - Script for extracting and summarising qualtrics files.    [2]

#### To-do:

-   Add analysis scripts to GitHub.
-   Add link to GitHub at OSF.
-   Update src/ folder structure
