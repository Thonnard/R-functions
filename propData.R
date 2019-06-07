# function to calculate proportions in tables/dataframes
#
# parameters
# data: table/dataframe (not tibbles)
# byRow: TRUE (default): calculates proportions by rows, otherwise by cols
# round: number of decimal places
# 
# examples 
# 
# propData(mytable, byRow=TRUE)
# propData(mytable, byRow=FALSE)

propData <- function(data, byRow=TRUE, round=2) {
  dataTemp <- data
  for (i in 1:nrow(data)) {
    for (y in 1:ncol(data)) {
      if(isTRUE(byRow)) {
        dataTemp[i,y] <- round(data[i,y]/sum(data[i,])*100,round)
        }
      else {
        dataTemp[i,y] <- round(data[i,y]/sum(data[,y])*100,round)}
        }
  }
  return(dataTemp)
}