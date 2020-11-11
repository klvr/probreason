# Manual fixing of ID's and removals in BoxBeadsART 2020 participants.
## Based on missing data, missing ID's and computer ID and timestamps. Err on the side of losing data rather than "overmatching".

# Spelling errors in ID.
## HL07EN21 swapped HL in BeadsTask - Fixed in Data-extraction-BeadsTwojarTask.R
## ON05NS23 omitted 23 in ART - Fixed in hBayesDM-ART.R
## EN06IR08 misslabeled ER06IR08 in BoxTask - Fixed in Data-extraction-BoxNormXlsx.R
## EN04IR22 noncapetilized EN04ir22 in BoxTask - Fixed in Data-extraction-BoxNormXlsx.R
## en08ar12 misslabeled as en09ar12 in BeadsTask - Fixed in Data-extraction-BeadsTwojarTask.R
## kanhil labeled kanhil_misforstod in BoxTask - Duplicate removed in Data-extraction-BoxNormXlsx.R
## STERIG decapitalized as sterig in ART - Fixed in hBayesDM-ART.R

# Missing ID's matched by timestamps, sequence, and computer ID.
## 1 (Box) is EN3HN11 - Fixed in Data-extraction-BoxNormXlsx.R
## *blank* (Beads) is en05ar27 - Fixed in Data-extraction-BeadsTwojarTask.R

# Clearly test-runs by experimenters based on time-stamps and/or names.
## 56yg (ART) - Removed in ART-extraction
## ghgj (ART) - Removed in ART-extraction
## 43gref (Beads) - Removed in Beads-extraction
## test (multiple) - Removed
## fdsfdsfds (ART) - Removed in ART-extraction
## htr645 (ART) - Removed in ART-extraction
## 432few (Beads) - Removed in Beads-extraction
## 543543 (Beads) - Removed in Beads-extraction
## er34er34 (Beads & Box) - Removed
## hjkhjk (Beads) - Removed in Beads-extraction