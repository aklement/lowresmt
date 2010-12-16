c <- read.table(file="phrasetable.txt", sep = "\t", head=TRUE)

x <- c$BLEU
names(x) <- c$Source

colorz <- c("red", "blue", "blue", "blue", "blue","blue")
fillz <- c(15, 15, 15, 15, 15, 15, 15, 15)
anglez <- c(45, 135, 135, 135, 135, 135, 45, 135)

saxis <- 1.3
slabels <- 1.3
snames <- 1.3

pdf(file="[phrasetable.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)
par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=slabels)

bp <-barplot(x, density=fillz, col=colorz, angle=anglez, ylab="BLEU", cex.lab=slabels, cex.axis=saxis, cex.names=snames, ylim=c(0, 25), legend=F)
#grid(nx = 0, ny = NULL, col = "black", lty = "dotted", lwd = 1, equilogs = FALSE)
#legend("topright", as.character(c$Title), cex=slabels, density=fillz, fill=colorz, bty="y", bg="white")
box()

height <- rbind(x)
text(bp, height, labels=format(height, 4), pos=3, cex=snames)

dev.off()
