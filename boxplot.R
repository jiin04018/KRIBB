# package 설치
install.packages("ggplot2")
install.packages("ggpubr")
install.packages("readxl")

# excel file 읽기 (count file일 경우 normalization, cg024194012)
library(readxl)
AGXT2 <- read_excel("C:/Users/CancerTeam/Desktop/최지인/엑셀파일/rs37370.xlsx")

# ggpubr2 이용해서 boxplot 그리기
library(ggpubr)
compare_means(cg02419401~rs37370, data = AGXT2)
p <- ggboxplot(AGXT2, x = "rs37370", group="rs37370", y = "cg02419401", ylab = "cg02419401", 
               fill= "grey", add = "jitter")

# Kruskal Wallis p-value 추가하기
p + stat_compare_means()

version