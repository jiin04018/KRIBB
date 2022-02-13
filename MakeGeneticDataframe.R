gene=paste0("gene", 1:50) ## 50개 유전자 이름 벡터 생성
sample=paste0("sample", 1:5) ## 5개 샘플 이름 벡터 생성
gene
sample

# 250개 정규분포 난수로 matrix생성, 옅은 유전자 수, 행은 샘플 수
expression=matrix(rnorm(250), nrow = 50, ncol = 5)
colnames(expression)=sample
rownames(expression)=gene
expression
# 벡터와 행렬을 붙여 데이터 프레임으로 생성
exam.df=data.frame(gene, expression)
exam.df

class(exam.df)
dim(exam.df)
