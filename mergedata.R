### David Thonnard
### v2. 23/04/2013
### thonnard.david@gmail.com

mergedata <- function(){

#intro
writeLines("\nDavid Thonnard\nv1 15-11-2012\n\nThis function merges data files (data seperated by tabs) into an output file.\n")

#Warning message
writeLines("WARNING: Saving to the same file will merge all data instead of overwriting existing data or creating a new file!\n")

# prompt messages
# input eg: "C:/Users/David/Desktop/Data/Data.dat"
# output eg: "C:/Users/David/Desktop/Data/Data.dat"
input <- readline("Input directory: ")
if(input == "") {stop("Please enter a valid input location file!\n\nFile was not saved!")}

output <- readline ("Output file: ")
if(output == "") {stop("Please enter a valid output file!\n\nFile was not saved!")}

#skip how many lines?
x <- 1
x <- readline("How many lines in the original data files should be skipped? (default: 1) ")

#create file message
writeLines("\nCreating File...\n")

helpfunctie1 <- function(bron)
{
list.files(path = bron, full.names=TRUE)
}

bestanden2 <- helpfunctie1(input)

helpfunctie2 <- function(lijst)
{
do.call("rbind", lapply(lijst, read.table, sep="\t", skip=x, fill=T))
}

data <- helpfunctie2(bestanden2)

#choose whether you want to add a header
headerornot <- readline("Data matrix with header (column names)? (Y/N) ")
if(headerornot == "Y" | headerornot == "y") {

#choose whether you want to use a header from a specific data file
useheader <- readline("Use a header from a specific data file? (Y/N) ")

if(useheader == "Y" | useheader == "y") {
#choose file that contains header you wish to use
readheader <- readline("Header file: ")
if(readheader == "") {stop("Please enter a valid header file!\n\nFile was not saved!")}
tempdata <- read.table(readheader, sep="\t", header=T, fill = T)
header <- colnames(tempdata)
names(data) <- header
#adding header message
writeLines("\nExtracting header...\n")}

else {writeLines("\nA standard header was added (V1, V2, etc).\n")}

#save file
write.table(data, file = output, sep="\t", row.names=F)
}

else {
write.table(data, file = output, sep="\t", row.names=F, col.names=F)
writeLines("\nData matrix created without column names...\n")
}

#end message
writeLines("Done!")
}
