
dna_seq <- "ATACGACGACGAGACGACGACCAGCAGCGACATCCTACATCAGACACTATTACG"

seq_length <- nchar(dna_seq)
nucleotide_counts <- table(strsplit(dna_seq, "")[[1]])
nucleotide_percentages <- nucleotide_counts/seq_length * 100

library(stringr)
gc_count <- sum(str_count(dna_seq, "G") + str_count(dna_seq, "C"))
gc_content <- gc_count/seq_length * 100

cat("Length:\n")
print(seq_length)

cat("Counts:\n")
print(nucleotide_counts)

cat("Percentages:\n")
print(nucleotide_percentages)

cat("GC content (%):\n")
print(gc_content)


A_content <-sum(str_count(dna_seq, "A"))
cat("A_content:\n")
print(A_content)

C_content <-sum(str_count(dna_seq, "C"))
cat("C_content:\n")
print(C_content)

G_content <-sum(str_count(dna_seq, "G"))
cat("G_content:\n")
print(G_content)

T_content <-sum(str_count(dna_seq, "T"))
cat("T_content:\n")
print(T_content)

A_percentage <- A_content/seq_length 
cat("A_percentage:\n")
print(A_percentage)

C_percentage <- C_content/seq_length 
cat("C_percentage:\n")
print(C_percentage)

G_percentage <- G_content/seq_length 
cat("G_percentage:\n")
print(G_percentage)

T_percentage <- T_content/seq_length 
cat("T_percentage:\n")
print(T_percentage)


df <- data.frame(A_percentage, C_percentage, G_percentage, T_percentage)
print(df)

transposed_data <- t(df)

write.csv(transposed_data, file = "my_data.csv", row.names = FALSE)


library(seqLogo) 

df <-read.csv("my_data.csv")
df

p <- makePWM(df)
slotNames(p)
pwm(p)
ic(p)
consensus(p)
seqLogo(p)
seqLogo(p, ic.scale=FALSE)


seqLogo(p, fill=c(A="#4daf4a", C="#377eb8", G="#ffd92f", T="#e41a1c"),
        ic.scale=FALSE)


r <- makePWM(df, alphabet="RNA")
seqLogo(r, ic.scale=FALSE)


seqLogo(r, fill=c(A="#4daf4a", C="#377eb8", G="#ffd92f", U="#e41a1c"),
        ic.scale=FALSE)

