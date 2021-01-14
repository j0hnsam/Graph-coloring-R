AdjMatrix<-function(data){
  k=0                       #k=synolikes eggrafes
  m=length(distinct(data)) #m=megistos arithos mathimatwn
  data2 <- matrix(0L,nrow = m, ncol = m)   #pinakas geitoneikotitas arxikopoihsh me 0
  for(j in 1:nrow(data)){
    t=ncol(data)
    for(i in 1:ncol(data)){           #ypologismos stilwn gia kathe grammh
      if(is.na(data[j,i])){
        t=t-1
      }
    }
    for(i in 1:t){
      k=k+1
      for(n in i:t){
        data2[data[j,n],data[j,i]]=data2[data[j,n],data[j,i]]+1
        if(data[j,i]!=data[j,n]){data2[data[j,i],data[j,n]]=1}
      }
    }
  }
  return(data2)
}
