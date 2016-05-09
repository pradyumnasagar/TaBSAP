library(pheatmap)
t1 <- read.table("mappp.tsv", header = TRUE, sep = "\t")
t2 <- t1[,-1]
row.names(t2) <- t1[,1]
pdf("mappp.pdf")
pheatmap(t2, cluster_rows=FALSE, cluster_cols=FALSE, fontsize=8)
dev.off()
q()