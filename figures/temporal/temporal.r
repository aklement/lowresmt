
te <- read.table(file="terrorist.en", sep = "\t", head=FALSE)
ts <- read.table(file="terrorista.es", sep = "\t", head=FALSE)
as <- read.table(file="ataques.es", sep = "\t", head=FALSE)
rs <- read.table(file="riqueza.es", sep = "\t", head=FALSE)

r <- range(te$V1, ts$V2, as$V2, rs$V2)
x <- c(r[1]:r[2])
tey <- array(0, r[2] - r[1] + 1)
tsy <- array(0, r[2] - r[1] + 1)
asy <- array(0, r[2] - r[1] + 1)
rsy <- array(0, r[2] - r[1] + 1)
  
for (i in c(1:length(te$V1))) {
  tey[te[i, 1]] = te[i, 2]
}

for (i in c(1:length(ts$V1))) {
  tsy[ts[i, 1]] = ts[i, 2]
}

for (i in c(1:length(as$V1))) {
  asy[as[i, 1]] = as[i, 2]
}

for (i in c(1:length(rs$V1))) {
  rsy[rs[i, 1]] = rs[i, 2]
}

days = 0;
for (i in c(1:length(tey))) {
  if (tey[i] != 0 || tsy[i] != 0 || asy[i] != 0 || rsy[i] != 0) {
    days = days + 1;
  }
}

dd <- array(0, dim = c(days, 4))
k <- 0

for (i in c(1:length(tey))) {
  if (tey[i] != 0) {
    dd[k,1] <- tey[i]
  }
  if (tsy[i] != 0) {
    dd[k,2] <- -1 * tsy[i]
  }
  if (asy[i] != 0) {
    dd[k,3] <- -1 * asy[i]
  }
  if (rsy[i] != 0) {
    dd[k,4] <- -1 * rsy[i]
  }
  if (tey[i] != 0 || tsy[i] != 0 || asy[i] != 0 || rsy[i] != 0) {
    k = k+1;
  }
}

from <- 1
to <- 210

d <- array(0, dim = c(to-from+1, 4))
k <- 0
for (i in c(from:to)) {
  d[k,1] <- dd[i,1]
  d[k,2] <- dd[i,2]
  d[k,3] <- dd[i,3]
  d[k,4] <- dd[i,4]
  k = k+1;
}

colors <- c("red", "blue")

pdf(file="temporal.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

k = c(1,1,1,1,1,1,1)#1,1,1)#,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)            # k is the vector of weights
k = k/sum(k)

d[,1] = filter(d[,1], sides=2, k) / sum(d[,1])
d[,2] = - filter(d[,2], sides=2, k) / sum(d[,2])
d[,3] = - filter(d[,3], sides=2, k) / sum(d[,3])
d[,4] = - filter(d[,4], sides=2, k) / sum(d[,4])

r <- range(te$V1, ts$V2)

par(mar=c(0.25,2,0.25,0.5), mfrow=c(3,1), oma=c(2,0,0.25,0))

plot(d[,1], ylim = c(-0.015,0.015),  type="h", lwd=1.5, col=colors[1], xaxt='n', yaxt='n', ann = FALSE)
lines(d[,2], type="h", col=colors[2], lty=1, lwd=1.5)

legend("topright", cex=1.2, c("terrorist (en)","terrorista (es)"), col=colors, lty=c(1,1), lwd=1.5, bty="n");

mtext("Occurrences", side=2,line=0.5,font=1)

par(mar=c(0.25,2,0.25,0.5))

plot(d[,1], ylim = c(-0.015,0.015),  type="h", lwd=1.5, col=colors[1], xaxt='n', yaxt='n', ann = FALSE)
lines(d[,3], type="h", col=colors[2], lty=1, lwd=1.5)

legend("topright", cex=1.2, c("terrorist (en)","ataques (es)"), col=colors, lty=c(1,1), lwd=1.5, bty="n");

mtext("Occurrences", side=2,line=0.5,font=1)
#mtext("Time", side=1,line=0.5,font=1)

par(mar=c(0.25,2,0.25,0.5))

plot(d[,1], ylim = c(-0.015,0.015),  type="h", lwd=1.5, col=colors[1], xaxt='n', yaxt='n', ann = FALSE)
lines(d[,4], type="h", col=colors[2], lty=1, lwd=1.5)

legend("topright", cex=1.2, c("terrorist (en)","riqueza (es)"), col=colors, lty=c(1,1), lwd=1.5, bty="n");

mtext("Occurrences", side=2,line=0.5,font=1)
mtext("Time", side=1,line=0.5,font=1)


dev.off()
