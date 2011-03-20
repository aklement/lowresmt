import sys
import os
import commands

pref = sys.argv[1]
outf = open(pref + ".table", 'w')
numBins = 10

outf.write("Bin\t1\t5\t10\t20\t30\t40\t50\t60\t80\t100\t200\t300\t400\t500\n")

for i in range(0, numBins):

    inname = pref + "." + str(i) + ".eval"
    print "Processing " + inname

    inf = open(inname, 'r')
    inf.readline()

    outf.write(str(i))

    for line in inf:
        w = line.split()
        outf.write("\t" + w[1])

    outf.write("\n")
    inf.close()

outf.close()
