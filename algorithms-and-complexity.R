toronto<-matrix(ncol=8,nrow = 13) #genikos pinakas dedomenwn
colnames(toronto) <- c("Name","|V|","Density","Min","Med","Max","Mean","CV")
toronto[1,1]="toronto/hec-s-92.stu"
toronto[2,1]="toronto/sta-f-83.stu"
toronto[3,1]="toronto/yor-f-83.stu"
toronto[4,1]="toronto/ute-s-92.stu"
toronto[5,1]="toronto/ear-f-83.stu"
toronto[6,1]="toronto/tre-s-92.stu"
toronto[7,1]="toronto/lse-f-91.stu"
toronto[8,1]="toronto/kfu-s-93.stu"
toronto[9,1]="toronto/rye-s-93.stu"
toronto[10,1]="toronto/car-f-92.stu"
toronto[11,1]="toronto/uta-s-92.stu"
toronto[12,1]="toronto/car-s-91.stu"
toronto[13,1]="toronto/pur-s-93.stu"
for(w in 1:13){
data <- read.table(toronto[w,1],sep=" ",fill=TRUE,col.names=1:(max(count.fields(toronto[w,1], sep = " ")))) #diavasma arxeiou
data <- data[ -c(ncol(data)) ]
k=0                       #k=synolikes eggrafes
for(i in 1:ncol(data)){
  for(j in 1:nrow(data)){
    if (is.na(data[j,i])){
      k=k+1
    }
  }
}
k=ncol(data)*nrow(data)-k
m=max(data, na.rm = TRUE) #m=megistos arithos mathimatwn

data2 <- matrix(0L,nrow = m, ncol = m)   #pinakas geitoneikotitas arxikopoihsh me 0
for(j in 1:nrow(data)){
  t=ncol(data)                        
  for(i in 1:ncol(data)){           #ypologismos stilwn gia kathe grammh
    if(is.na(data[j,i])){
      t=t-1
    }
  }
  for(i in 1:t){  
    for(n in i:t){    
        data2[data[j,n],data[j,i]]=1    
        data2[data[j,i],data[j,n]]=1
    }
  }
}

dens=0
f=0
for(i in 1:ncol(data2)){
  for(m in i:nrow(data2)){
    if (data2[m,i]>0){        #ypologismos density
      dens=dens+1
    }
    f=f+1
  }
}
dens=(dens-m)/f

degrees <- matrix(-1L,nrow = m) #pinakas vathwn koryfwn 
for(i in 1:nrow(degrees)){
  for(n in 1:nrow(degrees)){
    if(data2[i,n]==1){
      degrees[i]=degrees[i]+1
    }
  }
}


median <- matrix(nrow = m)
min=degrees[i]
max=degrees[i]
mean=0

for(i in 1:m){
    if (degrees[i]<min){
      min=degrees[i]
    }
    if (degrees[i]>max){
      max=degrees[i]
    }
    mean=mean+degrees[i]
    median[i]=degrees[i]
}

mean=mean/m
median=median[order(median[,1],decreasing=FALSE),]
if(m%%2==1){
  median=median[m/2+0.5]
}else{
  median=(median[m/2]+median[m/2+1])/2
}

cv=0
for(i in 1:m){
  cv=cv+((degrees[i]-mean)^2)
}
cv=sqrt((1/m)*cv)/mean*100

toronto[w,2]=m
toronto[w,3]=dens
toronto[w,4]=min
toronto[w,5]=median
toronto[w,6]=max
toronto[w,7]=mean
toronto[w,8]=cv
}
  
  
  
  
  
  
  
  
  
  
  
