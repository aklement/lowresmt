c <- read.table(file="lesionreplacement.txt", sep = "\t", head=TRUE)

x <- c$BLEU
#names(x) <- c$Title

colorz <- c("green", "blue", "orange", "red", "orange", "blue", "blue", "blue", "green", "green")
fillz <- c(15, 15, 15, 15, 15, 15, 15, 15, 15, 15)
anglez <- c(135, 135, 135, 135, 45, 45, 45, 45, 45, 45)
spacez <- c(0.4, 0.4, 0.4, 0.4, 1.2, 0.4, 0.4, 0.4, 0.4, 1.2)

saxis <- 1.3
slabels <- 1.3
snames <- 1.3

pdf(file="lesionreplacement.pdf", height=4, width=11, onefile=TRUE, family='Helvetica', pointsize=12)
par(mar=c(1.0,4.8,1.0,0.5), new=FALSE, cex.lab=slabels)

bp <-barplot(x, density=fillz, col=colorz, angle=anglez, space=spacez, ylab="BLEU", cex.lab=slabels, cex.axis=saxis, cex.names=snames, ylim=c(0, 25), legend=F)
grid(nx = 0, ny = NULL, col = "black", lty = "dotted", lwd = 1, equilogs = FALSE)
#legend("topright", as.character(c$Title), cex=slabels, density=fillz, fill=colorz, bty="y", bg="white")
box()

height <- rbind(x)
text(bp, height, labels=format(height, 4), pos=3, cex=snames)

dev.off()
