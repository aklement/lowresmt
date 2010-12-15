cf <- read.table(file="wikinews.freq/context.eval", sep = "\t", head=TRUE)
cr <- read.table(file="wikinews.rand/context.eval", sep = "\t", head=TRUE)

xrange <- range(0, cf$K, cr$K)
yrange <- range(0, 60)

colors <- c("blue", "green")
names <- c("Most Frequent", "Random") 
types <- c(1, 1)
pts <- c(1, 2)

saxis <- 1.3
slabels <- 1.3

pdf(file="lexinduct.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=slabels)

plot(xlim = xrange, ylim = yrange, cf$K, cf$Accuracy.TopK, type="o", pch=pts[1], lty=types[1], lwd=2, col=colors[1], ann = FALSE, cex.axis=saxis)
lines(cr$K, cr$Accuracy.TopK, type="o", pch=pts[2], lty=types[2], lwd=3, col=colors[2])

grid(col = "black", lty = "dotted", lwd = 1, equilogs = TRUE)

title(ylab="Accuracy")
title(xlab="Top-k")

legend("topleft", cex=slabels, names, col=colors, lty=types, pch=pts, lwd=3, bty="y", bg="white");

dev.off()
