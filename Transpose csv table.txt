#Installing the right package for the job
install.packages("data.table")

#Calling in the library to use
library(data.table)

#Import geno file
Geno <- read.csv("Transpose geno file.csv", row.names = 1, header = TRUE)

#Transpose
t_Geno <- transpose(Geno)

#get rows and colnames in order
colnames(t_Geno) <- rownames(Geno)
rownames(t_Geno) <- colnames(Geno)


#Export CSV File
write.csv(t_Geno, file = "t_Geno.csv")
