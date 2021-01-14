FirstFit<-function(data){
x=AdjMatrix(data)
results <- matrix(nrow = ncol(x))
results[1]=1
availiable <- matrix(TRUE,nrow = ncol(x))
for(u in 2:ncol(x)){
  v=get_neighbors(u,x)
  if(is.null(v)==TRUE){
    results[u]=1 }
  else {for(i in 1:length(v)){
    i=v[i]
    if(is.na(results[i])==FALSE){
      availiable[results[i],1] = FALSE;
    }
  }
    for(cr in 1:ncol(x)){
      if(availiable[cr]){break}
    }
    results[u]=cr
    for(i in 1:length(v)){
      i=v[i]
      if(is.na(results[i])==FALSE){
        availiable[results[i],1] = TRUE;
      }
    }
  }
}
return(results)
}
