# Data cleaning -> For fast analysis of effort (correct and RT), DtD 3th bead (afaik, one unnumberd, then 2-5 numbered), Pv_a ambiguity
# All notes based on one random file from each task.
# All raw files are left untouched, in their original folder (after unzipping download from OSF)

# Todo:
  # grepl for filenames

  # Beads counting
    # Files at: "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/Ambiguity+Effort"
    # For Effort - Ambiguity: [2:11, 31] correct/wrong, [2:11, 32] RT
    # For Ambiguity - Effort: [126:135, "key_resp_6.corr] c/w, [126:135, "key_resp_6.rt"] RT
      # Be aware: The column-numbers used by read.csv does not correspond to the actual number of columns(?) Use names, not numbers

  # DtD 3th bead
    # Files at "/Users/klevjer/R Projects/Probabilistic Reasoning/Raw data/beads DtD task"
    # Todo / Notes:
      # Optimal / Baysian probabilities needed, seq_1, 6040 set.
      # Participants draws a lot of beads, then stops, draws more, etc. Need a way to examine this.
      # Simply using numbers drawn, and response times is not enough, what if someone makes a terrible mistake, like after 15 beads still goes for the clearly less likely.

  # Ambiguity
    # Files at
    # Todo / Notes:
      # Many response times are lower than 2sec, this should be impossible. Are all in realisty X_i + 2sec?
      # Ambiguity v. risk
      # 50% lottery vs. on-screen by RT
      # I have the presented amounts, however not the presented odds (excpt. what can be read from presented file-names)
      # Would be helpful to calculate the optimal, so one could classify diviation from the optimal for both risk and ambiguity, and then compare.
        # Also to see if RT increases (drastically) when they don't differ a lot, otherwise this could be a way to quantify a participants treshold.
