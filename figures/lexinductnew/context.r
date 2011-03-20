c1 <- read.table(file="context.1.table", sep = "\t", head=TRUE)
c2 <- read.table(file="context.2.table", sep = "\t", head=TRUE)
c3 <- read.table(file="context.3.table", sep = "\t", head=TRUE)

len <- length(c1$Ave_Freq) - 1

x <- matrix(nrow = len, ncol = 3)
x[,1] <- c1$Ave_Freq[1:len+1]
x[,2] <- c2$Ave_Freq[1:len+1]
x[,3] <- c3$Ave_Freq[1:len+1]
x <- apply(x, 1, mean)

y1 <- matrix(nrow = len, ncol = 3)
y1[,1] <- c1$X1[1:len+1]
y1[,2] <- c2$X1[1:len+1]
y1[,3] <- c3$X1[1:len+1]
y1 <- apply(y1, 1, mean)

y10 <- matrix(nrow = len, ncol = 3)
y10[,1] <- c1$X10[1:len+1]
y10[,2] <- c2$X10[1:len+1]
y10[,3] <- c3$X10[1:len+1]
y10 <- apply(y10, 1, mean)

y100 <- matrix(nrow = len, ncol = 3)
y100[,1] <- c1$X100[1:len+1]
y100[,2] <- c2$X100[1:len+1]
y100[,3] <- c3$X100[1:len+1]
y100 <- apply(y100, 1, mean)

xrange <- range(0, x)
yrange <- range(0, y1, y10)

colors <- c("blue", "green")
names <- c("Top 1", "Top 10") 
types <- c(1, 1, 1)
pts <- c(1, 2, 3)

saxis <- 1.3
slabels <- 1.3

pdf(file="lexinductnew.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=slabels)

plot(xlim = xrange, ylim = yrange, x, y1, type="o", pch=pts[1], lty=types[1], lwd=2, col=colors[1], ann = FALSE, cex.axis=saxis)
lines(x, y10, type="o", pch=pts[2], lty=types[2], lwd=3, col=colors[2])
#lines(x, y100, type="o", pch=pts[3], lty=types[3], lwd=3, col=colors[2])

grid(col = "black", lty = "dotted", lwd = 1, equilogs = TRUE)

title(ylab="Accuracy, %")
title(xlab="Corpus Frequency")

legend("bottomright", cex=slabels, names, col=colors, lty=types, pch=pts, lwd=3, bty="y", bg="white");

dev.off()
