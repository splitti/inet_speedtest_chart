#!/usr/bin/python
import os
import sys
import csv
import datetime
import time
 
#run speedtest-cli
#rint 'running test'
speed = os.popen("/usr/local/bin/speedtest-cli --simple").read()
#rint 'done'
#split the 3 line result (ping,down and up)
lines = speed.split('\n')
#rint speed
ts = time.time()
now = time.strftime('%d.%m.%Y %H:%M:%S')
#if speedtest could not connect set the speeds to 0
if "Cannot" in speed:
	p = 0
	d = 0
	u = 0
#extract the values for ping, down and up values
else:
    p = lines[0][6:11]
    d = lines[1][10:16]
    u = lines[2][8:12]
#rint now,p, d, u
#save the data to a csv
out_file = open('speedtest.csv', 'a')
writer = csv.writer(out_file)
writer.writerow((now,p,d,u))
out_file.close()
