coef_variation<-function(x){
  degrees=degrees(x)
  m=length(distinct(x))
  cv=0
  for(i in 1:m){
    cv=cv+((degrees[i]-mean(degrees))^2)
  }
  cv=sqrt((1/m)*cv)/mean(degrees)*100
  return(cv)
}
