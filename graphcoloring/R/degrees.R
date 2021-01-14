degrees<-function(x){
  x=AdjMatrix(x)
  degrees <- matrix(-1L,nrow = nrow(x)) #pinakas vathwn koryfwn
  for(i in 1:nrow(degrees)){
    for(n in 1:nrow(degrees)){
      if(x[i,n]>0){
        degrees[i]=degrees[i]+1
      }
    }
  }
  return(degrees)
}
