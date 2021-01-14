distinct<-function(x){
dis=c()
q=2
dis[1]<-x[1,1]
for(i in 1:nrow(x)){
  for (j in 1:ncol(x)){
        if(is.na(x[i,j])==FALSE){
        dis[q]<-x[i,j]
        q=q+1
        }
      }
    }
return(unique(dis))
}
