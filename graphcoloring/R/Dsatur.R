Dsatur<-function(data){
  x=AdjMatrix(data)
  degrees=degrees(data)
  dsatur <-matrix(0L,nrow=ncol(x))
  results <- matrix(0L,nrow = ncol(x))
  results[c(which.max(degrees)),]<- 1
  neighbors<-matrix(get_neighbors(which.max(degrees),x),nrow = length(get_neighbors(which.max(degrees),x)))
  dsatur[neighbors]=dsatur[neighbors]+1
  dsatur[c(which.max(degrees)),]<- -ncol(x)*ncol(x)
  degrees[c(which.max(degrees)),]<- -ncol(x)*ncol(x)
  for(i in 2:ncol(x)){
    if(degrees[which.max(degrees)]==0){
      results[c(which.max(degrees)),]<- 1
      dsatur[c(which.max(degrees)),]<- -ncol(x)*ncol(x)
      degrees[c(which.max(degrees)),]<- -ncol(x)*ncol(x)
    }
    else{
      max=max(dsatur)
      p=0
      for(j in 1:length(dsatur)){
        if(max==dsatur[j]){
          p=p+1
        }
      }
      if(p>1){
        max=1
        neighbors<-matrix(get_neighbors(which.max(degrees),x),nrow = length(get_neighbors(which.max(degrees),x)))
        for(p in 1:max(results)){
          c=1
          for(j in 1:length(neighbors)){
            if(results[neighbors[j]]==p){
              c=c+1
            }
          }
          if(c==1 & max==1){
            color=p
            max=2
          }
          if(p==max(results) & max==1){
            color=p+1
          }
        }
        results[c(which.max(degrees)),]<- color
        dsatur[c(which.max(degrees)),]<- -ncol(x)*ncol(x)
        degrees[c(which.max(degrees)),]<- -ncol(x)*ncol(x)
        dsatur[neighbors]=dsatur[neighbors]+1
      }
      else{
        max=1
        neighbors<-matrix(get_neighbors(which.max(dsatur),x),nrow = length(get_neighbors(which.max(dsatur),x)))
        for(p in 1:max(results)){
          c=1
          for(j in 1:length(neighbors)){
            if(results[neighbors[j]]==p){
              c=c+1
            }
          }
          if(c==1 & max==1){
            color=p
            max=2
          }
          if(p==max(results) & max==1){
            color=p+1
          }
        }
        results[c(which.max(dsatur)),]<- color
        degrees[c(which.max(dsatur)),]<- -ncol(x)*ncol(x)
        dsatur[c(which.max(dsatur)),]<- -ncol(x)*ncol(x)
        dsatur[neighbors]=dsatur[neighbors]+1
      }
    }
  }
  return(results)
}
