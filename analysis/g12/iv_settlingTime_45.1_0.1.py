import numpy as np
import pandas as pd
import csv

with open('ori.csv', 'r') as f:
	reader = csv.reader(f)
	datas = list(reader)

best_kp = 45.10
best_ki = 0.10

kp = []
ki = []
delay = []
settling_time = []

for data in datas:
	if data[0] == str(best_kp) and data[1] == str(best_ki):
		settlingTime = float(data[3])
		settlingTime = "{0:.4f}".format(round(settlingTime,4))
		settlingTime = float(settlingTime)
		settling_time.append(settlingTime)
		
		d = float(data[2])  #delay
		d = "{0:.2f}".format(round(d,2))
		d = float(d)
		delay.append(d)
		
		kp.append(best_kp)
		ki.append(best_ki)
print(kp)
print(ki)
print(delay)
print(settling_time)


raw_data = {'kp': kp, 'ki': ki, 'delay (sec)': delay, 'Settling Time (sec)': settling_time}
df = pd.DataFrame(raw_data, columns = ['kp', 'ki', 'delay (sec)', 'Settling Time (sec)'])
df.to_excel('settlingTime_' + str(best_kp) + '_' + str(best_ki) + '.xlsx')
