manager <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,5,5,NA,2)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager,date,country
                          ,gender,age,q1,q2,q3,q4,q5,stringsAsFactors = F)

#新变量的创建方法
mydata <-data.frame(x1 = c(2,2,6,4),x2 = c(3,4,2,8))
mydata$sumx <- mydata$x1+mydata$x2
mydata$meanx <- (mydata$x1+mydata$x2)/2

attach(mydata)
mydata$sumx <- x1+x2
mydata$meanx <- (x1+x2)/2
detach(mydata)

##这种方法比较好
mydata <- transform(mydata,sumx = x1+x2,meanx = (x1+x2)/2)

#variable[condition] <- expression将仅在condition的值为TRUE时执行赋值
leadership$age[leadership$age == 99]<-NA #
leadership$agecat[leadership$age >75 ]<-"Elder"
leadership$agecat[leadership$age >=55&leadership$age <=75 ] <- "Middle Aged"
leadership$agecat[leadership$age <55 ]<-"Young"

##更紧凑的写法
leadership <- within(leadership,{
  agecat <- NA
  agecat[age >75] <- "Elder"
  agecat[age<=55$agecat<=75] <- "Middle Aged"
  agecat[age<55] <- "Young"
})

##变量的重命名
#reanme(dataframe,c(oldname = "newname",oldname = "newname"))

leadership
newdata = na.omit(leadership)
newdata

##日期转换
#as.Date(x,input_format)
myformat <- "%m/%d/%y"
leadership$date<- as.Date(leadership$date,myformat)

#日期转为字符
#strDates <- as.character(dates)

##排序
newdata2 <- leadership[order(leadership$age),]
newdata2

#数据集的合并 ，类似mysql的join
#total <- merge(dataframe1,dataframe2,by = "ID")
#不需要公共索引 ，用total<- cbind(A,B)


































