library(pathview)
library(gage)
library(gageData)

# working directory setup
setwd("C:/Users/CancerTeam/Desktop/rstudio¿¬½À")
res = read.delim("RNA_seq_example.txt", header = T, row.names = 1)
dim(res);View(res)

# Human KEGG pathway data 
data(kegg.sets.hs)
str(kegg.sets.hs)

## set only signaling and metabolism
data(sigmet.idx.hs)
kegg.sets.hs = kegg.sets.hs[sigmet.idx.hs]
head(kegg.sets.hs,3)

## data organization
dim(res)
foldchanges = res$log2FoldChange

names(foldchanges)=rownames(res)

head(foldchanges)
head(kegg.sets.hs)

## get the results
keggres=gage(foldchanges,gsets=kegg.sets.hs,same.dir=T)
str(keggres)
View(keggres)
lapply(keggres,head)

### see expression variance
#positive
keggrespathways=rownames(lapply(keggres, head, 5)$greater)
#negative
keggrespathways=rownames(lapply(keggres, head, 5)$less)
#get the IDs
keggresids=substr(keggrespathways, start = 1, stop = 8)
keggresids

plot_pathway=function(pid)pathview(gene.data=foldchanges,pathway.id=pid,species="hsa")
plot_pathway("hsa03060")

#positive's pathway visualiztion
tmp=sapply(keggresids, plot_pathway)

