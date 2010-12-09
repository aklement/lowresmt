import sys
import os


file = open(sys.argv[1], 'r')

for line in file:
	cs = line.split("\t")
	for c in cs:
		vs = c.split(":")
		print vs[0] + "\t" + vs[1]
	break
file.close()
