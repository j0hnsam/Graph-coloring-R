check_algo<-function(data,results){
  x=AdjMatrix(data)
  check=TRUE
  for(i in 1:ncol(data)){
   neighbors=get_neighbors(i,x)
    for(j in 1:length(neighbors)){
      if(!is.null(neighbors)){
      if(results[i]==results[neighbors[j]]){
        check=FALSE
      }
    }
    }
  }
  return(check)
}
