# Ideale Baysian Observer

# Step 1: Without prior/other information, i.e., purely "majority".
# Step 2: Integrate prior/other information

# 2018
## One Jar
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040
## Tone
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040
## Two Jars
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040, Seq4_8515
## Box Irreg
### Free sequence (extracted)
## Box Norm
### Free sequence (extracted)
# 2020
## Two Jars
### Seq2_8515, Seq3_8515, Seq1_6040, Seq3_6040, Seq4_8515
## Box Norm
### colour_sequences_12 (3 seqs), colour_sequences_6or9_a (3 seqs), colour_sequences_6or9_b (3 seqs)

# Actual sequences Beads tasks
Seq1_8515 <- c(rep(1, 9), 0, rep(1,10))
Seq2_8515 <- c(rep(1, 16), 0, rep(1, 3))
Seq3_8515 <- c(1, 0, rep(1, 5), 0, rep(1, 3), 0, rep(1, 5), 0, 1, 1)
Seq1_6040 <- c(1, 1, 0, 0, 1, 0, 0, rep(1, 5), 0, 1, 0, 1, 1, 1, 0, 1)
Seq3_6040 <- c(0, rep(1, 3), 0, 1, 0, 1, 1, 0, 0, 1, 0, rep(1, 4), 0, 1, 0)
Seq4_8515 <- c(rep(1,7),0,rep(1,12))

# Actual sequences Box task (2020 fixed)
seq_12_1 <- c(1,1,1,0,1,1,1,1,0,1,0,1) #0: Blue, 1: Red
seq_12_2 <- c(0,1,0,1,0,0,1,0,1,0,1,0) #0: Yellow, 1: Green
seq_12_3 <- c(0,0,1,0,1,0,1,0,0,1,0,0) #0: Purple, 1: White
seq_6or9a_1 <- c(0,0,0,1,0,0,0,0,1) #0: Light blue, 1: Red
seq_6or9a_2 <- c(1,0,0,1,0,0) #0: Yellow, 1: Light Green
seq_6or9a_3 <- c(1,0,0,0,1,0,1,0,0) #0: Light purple, 1: Yellowish white
seq_6or9b_1 <- c(0,1,0,1,0,1,0,1,0) #0: Red, 1: Green
seq_6or9b_2 <- c(0,0,1,0,1,0) #0: Pink, 1: Green
seq_6or9b_3 <- c(0,0,0,1,0,0) #0: Blue, 1: Light Yellow

# Test 1a
seq <- seq_12_1
x <- vector(mode = "numeric")
for (i in seq) {
p_grid <- seq(0,1,length.out = 1000)
prior <- rep(1, 1000)
x <- c(x, i)
likelihood <- dbinom(sum(x), size = length(x), prob = p_grid)
unstd.posterior <- likelihood*prior
posterior <- unstd.posterior/sum(unstd.posterior)
plot(p_grid, posterior, type="b")
samples <- sample(p_grid, size=1e4, replace=TRUE, prob=posterior)
print(mean(samples < 0.5))
}

# Test 1b
samples <- sample(p_grid, prob=posterior, size=1e4, replace=TRUE)
plot(samples)
library(rethinking)
dens(samples)
HPDI(samples, prob=0.5)

