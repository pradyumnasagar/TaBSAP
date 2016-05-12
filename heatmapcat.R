library(pheatmap)
t1 <- read.table("mappp.tsv", header = TRUE, sep = "\t")
t2 <- t1[,-1]
row.names(t2) <- t1[,1]
annotation_row = data.frame(
                    SampleType = factor(rep(c(grpname), c(grpcat)))
                )
rownames(annotation_row) = paste("sample", 1:totll, sep = "")
pdf("mappp.pdf")
dev.off()
q()

