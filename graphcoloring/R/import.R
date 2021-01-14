import<-function(x,y)
{
  data <- read.table(x,sep= y,fill=TRUE,col.names=1:(max(count.fields(x, sep = y)))) #diavasma arxeiou
  data=data[, colSums(is.na(data)) != nrow(data)]
  return(data)
}
