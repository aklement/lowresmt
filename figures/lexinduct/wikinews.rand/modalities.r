c <- read.table(file="context.eval", sep = "\t", head=TRUE)
t <- read.table(file="time.eval", sep = "\t", head=TRUE)
e <- read.table(file="edit.eval", sep = "\t", head=TRUE)
all <- read.table(file="aggmrr.eval", sep = "\t", head=TRUE)

xrange <- range(0, c$K, t$K, e$K, all$K)
yrange <- range(0, 85)

colors <- c("blue", "green", "magenta", "red")
names <- c("Context", "Time", "EditDistance", "Aggregate") 
types <- c(1, 1, 1, 1)
pts <- c(1, 2, 3, 4)
tsize <- 1.6
t1size <- 1.3

pdf(file="wikinewsrand.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=tsize)

plot(xlim = xrange, ylim = yrange, c$K, c$Accuracy.TopK, type="o", pch=pts[1], lty=types[1], lwd=2, col=colors[1], ann = FALSE, cex.axis=t1size)
lines(t$K, t$Accuracy.TopK, type="o", pch=pts[2], lty=types[2], lwd=3, col=colors[2])
lines(e$K, e$Accuracy.TopK, type="o", pch=pts[3], lty=types[3], lwd=3, col=colors[3])
lines(all$K, all$Accuracy.TopK, type="o", pch=pts[4], lty=types[4], lwd=3, col=colors[4])

grid(col = "black", lty = "dotted", lwd = 1, equilogs = TRUE)

#title(ylab="Accuracy")
title(xlab="k")

legend("topleft", cex=1, names, col=colors, lty=types, pch=pts, lwd=3, bty="y", bg="white");

dev.off()
