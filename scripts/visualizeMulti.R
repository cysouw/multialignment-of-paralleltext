# quick and dirty visualization of alignment-tables produced by multialignment
# Michael Cysouw <cysouw@mac.com>

read.multi <- function(table) {
	read.table(table, sep = "\t", quote = "")
}

plot.align <- function(table, cols) {
	
	langs <- as.numeric(table[,1])
	names <- levels(table[,1])
	
	# equal lengths
	line.max <- aggregate(table[,2] ~ langs, FUN = max)	
	fact <- max(line.max[,2])/line.max[,2]
	for (i in 1:max(langs)) {
		table[langs==i, 2] <- table[langs==i, 2] * fact[i]
	}
	
	plot(table[,2], as.numeric(table[,1]), type = "n", axes = F, xlab = "", ylab = "")
	text(table[,2], as.numeric(table[,1]), col= "grey", cex=.3, labels = table[,3])

	text(0, 1:max(langs), cex = .3, labels = names, pos = 2, xpd = NA)

	r <- rainbow(length(cols))
	for (i in seq_along(cols)) {
		sel <- table[,4]==cols[i]
		lines(table[sel,2], as.numeric(table[sel,1]), col = r[i], lwd = 0.5)
		text(table[sel,2], as.numeric(table[sel,1]), labels = table[sel,3], cex = .3, col = r[i])	
	}
}

# ======= Example ====
align <- read.multi("../germanic/40002001.csv")
plot.align(align, 6:12)