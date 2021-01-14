conf_density<-function(x){
  x=AdjMatrix(x)
  dens=0
  f=0
  for(i in 1:ncol(x)){
    for(m in i:nrow(x)){
      if (x[m,i]>0){        #ypologismos density
        dens=dens+1
      }
      f=f+1
    }
  }
  dens=(dens-ncol(x))/f
  return(dens)
}
