c <- read.table(file="esen", sep = "\t", head=FALSE)

pdf(file="esenlearning.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

matplot (c$V1, c$V2, log="x", xlab="Lines of Training Bitext", ylab="BLEU score", col="blue", ylim = c(0, 25), xlim=c(100,1000000), pch=21)
matlines(c$V1, c$V2, col="blue")

dev.off()