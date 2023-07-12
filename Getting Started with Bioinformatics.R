#Session 1

#How to import and view a txt file into R

#Import and view a txt file into R 
df <- read.table('CRD.txt', header = TRUE, sep='\t') 
#View data
df 


#How to import and view a excel files into R


#install.packages("openxlsx", dependencies = TRUE)

#Import and view an excel file into R, but this time we will use a package ‘openxlsx’ 

library(openxlsx)
df <- read.xlsx('test.xlsx')
df

#Read and view a .csv file

#Import and view a csv file into R 
df = read.csv('df.csv', header = TRUE, sep=',')
df

#Check whether data has been loaded or not

#Import and view a csv file into R 
df = read.csv('df.csv', header = TRUE, sep=',')

#Check dimensions of data
dim(df)

#Check top 10 rows of the data using head() function

#Import and view a csv file into R 
df = read.csv('filename.csv', header = TRUE, sep=',')

#Check top rows of data
head(df)


#Print data using either print() function or write object name. Here, in our case, we defined object's name as df

#Import and view a csv file into R 
df = read.csv('filename.csv', header = TRUE, sep=',')

#print data
print(df)


# or print dataframe
df


#Example R function


seq_length <- function (seq) {
  length <- nchar(seq)
 print(length)
}

#Execute function, print the length of given sequence
seq_length("ATCTGGCAATGC")


#Session 2


#Load data:

#data frame (df) 
df = read.table('https://raw.githubusercontent.com/pine-bio-support/DataScience/main/Final_cell_lines_RNA-expression_FPKM_values_1000genes_with_NA.txt',row.names=1, header = TRUE, sep="\t") 

#Remove a column in R, n is number of the column from a dataframe, e.g. data[, -n]

#Remove a row, n is number of the column from a dataframe 
newdata = df[-1,] 


#Remove a column from dataframe
datanew = df[,-1] 
#Remove a header
names(df) <- NULL 



#convert the dataframe to numeric format
datanew <- as.data.frame(apply(datanew, 2, as.numeric))
#Remove NAs from a dataset 
Cleandata = na.exclude(datanew)


#calculate row sums
cleandata_rowsum = rowSums(Cleandata)

#filter clean data based on rowsums
datanew <- Cleandata[cleandata_rowsum > 0, ]

logdata = log(datanew+1) 
boxplot(logdata)

#Load Data
df = read.table('https://code.omicslogic.com/assets/datasets/15_genes/CellLines_15Genes.txt',header = TRUE, sep='\t')

#Remove 1st column
df=df[,-1]


#Descriptive statistics 
summary(df)


#Convert into matrix
df=as.matrix(df)


#Draw a boxplot
boxplot(df, col='red')


# Draw a Heatmap
heatmap(df)

#Draw Boxplot
﻿boxplot(df, col="red", las=2, main="Boxplot")


#Session 3


library(Biostrings) 
library(DECIPHER) 

seq <- DNAString("AGTGTCCCTG") 
print(seq) 

len <- length(seq) 
print(len) 

#Compute frequency of Each nucleotide and GC content in the sequence

c= letterFrequency(seq, "C", as.prob = T) 
print(c) 
g= letterFrequency(seq, "G", as.prob = T)
print(g)


a= letterFrequency(seq, "A", as.prob = T)
print(a)


t= letterFrequency(seq, "T", as.prob = T)
print(t)


#Compute the gc content in a sequence
gc= letterFrequency(seq, "GC", as.prob = T)
print(gc)


#Read the fasta file in R
fastaFile <- readDNAStringSet("seq1.fasta")

#Extract names of sequences
seq_name = names(fastaFile)
print(seq_name)

#Extract sequences
sequence = paste(fastaFile)
print(sequence)

#Compute the length of sequence
len = width(fastaFile)
print(len)

#Count nucleotide in the sequence
count = table(strsplit(sequence, "")[[1]])
print(count)

#Session 4

#load libraries
library(Biostrings)

seq <- DNAString("ATGCCGTGGTAAAGCCTTAAG")

#or

seq <- readDNAStringSet("seq.fasta")

print(seq)

#Create reverse complement of the sequence
rev = reverseComplement(seq)
print(rev)









































































































