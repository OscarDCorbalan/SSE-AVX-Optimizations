# -*- coding: utf-8 -*-

import time
import subprocess
import filecmp

FFIB = open('figure.out', 'w')
FNUL = open('/dev/null', 'w')


N=5 #numero de veces a ejecutar para hacer la media
START = 500 #empezamos en START decimales
STEP = 500 #y vamos sumando STEP
END = 10001
print "num.decimales\ttiempo "
FFIB.write( "num. decimales\ttiempo " )

for i in range(START, END, STEP):
	tsum=0
	args=('./pi.2', str(i))	
	for j in range(N):		
		t0=time.time()
		p = subprocess.Popen( args, stdout=FNUL )
		p.wait()	
		t1=time.time() - t0
		tsum = tsum + t1
	tsum = tsum/5
	FFIB.write( str(i) + "\t\t" + str(tsum) + "\n" )
	print i, "\t\t", tsum

print "salida guardad en figure.out"
FFIB.close()
