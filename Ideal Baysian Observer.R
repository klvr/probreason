# Ideale Baysian Observer

# 2018
## One Jar
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040
## Tone
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040
## Two Jars
### Seq1_8515, Seq3_8515, Seq1_6040, Seq3_6040, Seq4_8515
# 2020
## Two Jars
### Seq2_8515, Seq3_8515, Seq1_6040, Seq3_6040, Seq4_8515

# Actual sequences
Seq1_8515 <- c(rep(1, 9), 0, rep(1,10))
Seq2_8515 <- c(rep(1, 16), 0, rep(1, 3))
Seq3_8515 <- c(1, 0, rep(1, 5), 0, rep(1, 3), 0, rep(1, 5), 0, 1, 1)
Seq1_6040 <- c(1, 1, 0, 0, 1, 0, 0, rep(1, 5), 0, 1, 0, 1, 1, 1, 0, 1)
Seq3_6040 <- c(0, rep(1, 3), 0, 1, 0, 1, 1, 0, 0, 1, 0, rep(1, 4), 0, 1, 0)
Seq4_8515 <- c(rep(1,7),0,rep(1,12))

# Flat prior (need to check instructions! Probably different priors in One vs. Two Jars task)
flatprior <- function(x) {
p_grid1 <- seq(from = 0, to = 1, length = 1000)
prob_p1 <- rep(1, 1000)
y <- 0
a <- 0
repeat {
a <- a+1
z <- sum(x[1:a])
y <- y+1
prob_data1 <- dbinom(z, size = y, prob = p_grid1)
posterior1 <- prob_data1 * prob_p1
posteriornorm1 <- posterior1 / sum(posterior1)
#set.seed(100)
samples1 <- sample(x = p_grid1, prob = posteriornorm1, size = 1000, replace = TRUE)
print(mean(samples1))
lines(mean(samples1), add = TRUE)
if (a==21) {
break
 }
}
}



