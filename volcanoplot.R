## Load the data
setwd("C:/Users/CancerTeam/Desktop")
Data <- read.table(GSE18842_DEG.xlsx,header=T,skip=1) 
## header=T, skip=1옆에 부분은 첫줄 스킵하겠다는거

# excel파일 읽기
library(readxl)
Data<- read_excel("C:/Users/CancerTeam/Desktop/GSE18842_DEG.xlsx")
head(Data)# 데이터를 잘 불렀는지 체크 (데이터의 앞부분과 뒷부분(?) 출력)


####### create a Volcano plot
volcanoData <- cbind(Data$logFC, -log10(Data$P.Value))
colnames(volcanoData) <- c("logFC", "-log10Pval")
head(volcanoData)

plot(volcanoData, pch=19) ## pch는 숫자에 따라 그래프에 나타나는 모양이 다름(ex.원, 박스 등)

