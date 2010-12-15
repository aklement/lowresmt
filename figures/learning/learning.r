c <- read.table(file="learning.txt", sep = "\t", head=TRUE)

xrange <- range(0, c$Size)
yrange <- range(0, 20)

colors <- c("blue")
types <- c(1)
pts <- c(1)

saxis <- 1.3
slabels <- 1.3

pdf(file="learning.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=slabels)
plot(xlim=xrange, ylim=yrange, c$Size, c$BLEU, type="o", pch=pts[1], lty=1, lwd=2, col="blue", ann=F, cex.axis=saxis)
grid(col="black", lty="dotted", lwd=1.3, equilogs=T)
#legend("topleft", cex=1, names, col=colors, lty=types, pch=pts, lwd=3, bty="y", bg="white");

title(ylab="BLEU")
title(xlab="Number of tokens (x 1,000)")

dev.off()
