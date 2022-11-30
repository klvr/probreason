# Box tasks decoding - Sequence

colorirreg <- read.csv2(paste(getwd(), "/Tasks and other files/ColorBoxsIrreg.csv", sep=""))
names <- c("Irreg1", "Color1", "Irreg2", "Color2", "Irreg3", "Color3", "Irreg4", "Color4")
colnames(colorirreg) <- names

colornorm <- read.csv2(paste(getwd(), "/Tasks and other files/ColorBoxsNorm.csv", sep=""))
names <- c("Norm1", "Color1", "Norm2", "Color2", "Norm3", "Color3", "Norm4", "Color4")
colnames(colornorm) <- names