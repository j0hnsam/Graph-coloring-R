get_neighbors <- function(x,data){ #neighbors function
  q=1
  neighbors=c()
  for(i in 1:ncol(data))
  {
    if(data[x,i]>0 && x!=i)
    {
      neighbors[q]<-i
      q=q+1

    }
  }
  return (neighbors)
}
