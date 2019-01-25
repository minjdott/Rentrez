#Assignment 3

library(rentrez)

ncbi_ids<-c("HQ433692.1","HQ433694.1","HQ433691.1")
#ncbi_ids is now a vector of words "HQ433692.1","HQ433694.1" and "HQ433691.1"

Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
?entrez_fetch
#db : name of the database to use
#id:vector--unique IDs for records in database db(in this case ncbi ids)
#rettype :format in which to get data 
#making a character vector called Bburg that consists of "HQ433692.1","HQ433694.1","HQ433691.1" which are NCBI identifiers for three sequences of a gene. 
#those three sequences are received from NCBI data base "nuccore" in fasta format

str(Bburg)
summary(Bburg)

?strsplit
library(dplyr)


bburg<-gsub("\n","",Bburg) #getting rid of the new line command(\n) in Bburg so I can work better with the string data

#use of strsplit to extract only the sequences out of Bburg(bburg)
X<-unlist(strsplit(bburg,">")) #spliting bburg at ">" ,where each sequence ends 
#use of unlist() function to vectorize each split line
x<-unlist(strsplit(X,"sequence")) #spliting the new X at the word "sequence", which is where each sequence starts, putting it into a new value "x"
#in x, the sequences are line [2],[4] and[6]

sequence<-c(x[[2]],x[[4]],x[[6]]) #making a vector of the sequences only 
str(sequence)
write.csv(sequence,"Sequences.csv")
#saving the vector as a csv file called "Sequences"

