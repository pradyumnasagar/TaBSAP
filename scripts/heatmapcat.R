library(pheatmap)
t1 <- read.table("mappp.tsv", header = TRUE, sep = "\t")
t2 <- t1[,-1]
row.names(t2) <- t1[,1]
annotation_row = data.frame(
                    SampleType = factor(rep(c(grpname), c(grpcat)))
                )
rownames(annotation_row) = paste("sample", 1:totll, sep = "")
pdf("mappp.pdf", onefile=FALSE)

pheatmap(t2, cluster_rows=TRUE, cluster_cols=FALSE, annotation_row = annotation_row, fontsize=8)
dev.off()
q()

