c <- read.table(file="lesions.txt", sep = "\t", head=TRUE)

x <- c$BLEU
names(x) <- c$Title

colorz <- c("green", "green", "blue", "orange", "red")
fillz <- c(20, 20, 30, 40, 50)
anglez <- c(135, 45 , 45, 45, 45)

pdf(file="lesions.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)
par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=1.2)

bp <-barplot(x, density=fillz, col=colorz, angle=anglez, ylab="BLEU", cex.lab=1.2, ylim=c(0, 25), legend=F)
#grid(nx = 0, ny = NULL, col = "black", lty = "dotted", lwd = 1, equilogs = FALSE)
#legend("topright", as.character(c$Title), cex=1, density=fillz, fill=colorz, bty="y", bg="white")
box()

height <- rbind(x)
text(bp, height, labels = format(height, 4), pos = 3, cex = 1.2)

dev.off()
