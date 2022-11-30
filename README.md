# 'Ambiguity Aversion is Not Related to Delusion Ideation nor Hasty Decision-Making in Two Sequential Information Sampling Tasks'

## Repository for R-scripts related to the article.

Raw and clean data only uploaded to the [OSF-repository](https://osf.io/z9wye/) (due to GDPR).

### Contains R-scripts for data extraction, cleaning, and analysis.

I.e., from raw data (as outputted by the materials used) to cleaned data, and to the analyses, tables, and figures as presented both in the main article as well as the supplementary material.

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

#### Download the data, clone this repository, run the "MasterScript-DataExtractionMerging.R"-script, to extract, clean and merge all data, or use the "Loading-files.R"-script and choose task-wise script(s) for the task(s) you want data from. At the current time, this masterscript must be run line by line.

#### To run the analysis-script, the script above must run first, unless you already have the AllData.csv file, by either running the extraction scripts, or downloaded from OSF.

#### (Local) File-structure:

-   All R-scripts in wd.
-   Raw data/: Folder subfolders with raw-data.
-   Intermidiate data/: Data saved before further use (e.g., ART long-format for hBayesDM, and hBayesDM outputs).
-   Cleaned data/: CSV-files with extracted and cleaned data, both task-wise and collected.
-   Obsolete scripts/: Scripts no longer in use, but might contain useful snippets.
-   Tasks and other files/: The tasks and questionnaires, as well as other non-data related files from OSF.
-   Presentation Jan. 2020/: Brief task-presentation from Jan. 2020.
-   Presentation Aug. 2020/: Brief presentation for PhD pitch, August 2020.
-   Analyses/: Random files saved relating to analyses.
-   Article/: All files relating to the final article.

#### To-do:

-   Add analysis scripts to GitHub.
-   Add link to OSF and vice versa.

