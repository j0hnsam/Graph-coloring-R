stats<-function(x){
  stats<-matrix(ncol=7,nrow = 1) #genikos pinakas dedomenwn
  colnames(stats) <- c("|V|","Conf_Density","Min","Med","Max","Mean","CoefVariation")
  degrees=degrees(x)
  stats[1,1]=length(distinct(x))
  stats[1,2]=conf_density(x)
  stats[1,3]=min(degrees)
  stats[1,4]=median(degrees)
  stats[1,5]=max(degrees)
  stats[1,6]=mean(degrees)
  stats[1,7]=coef_variation(x)
  return(stats)
}
