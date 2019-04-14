'''
Input: ori.csv file
Output: rank_average_settling_time.csv
Function: Calculate all the settleing time and average them
Tips: If one of the settling time is out of the range of 240 sec,
	  results will be infinite (999999), for the specific kp & ki.
'''


import numpy as np
import pandas as pd
import csv

kp = []
ki = []
settling_time = []


with open('ori.csv', 'r') as f:
	reader = csv.reader(f)
	datas = list(reader)

for float_kp in np.arange(0.1, 325.2, 5):
	for float_ki in np.arange(0.1, 25.1, 5):
		
		print("------------------------------------------------------")
		float_kp = "{0:.2f}".format(round(float_kp,2))
		float_kp = float(float_kp)
		print("kp = " + str(float_kp))
		float_ki = "{0:.2f}".format(round(float_ki,2))
		float_ki = float(float_ki)
		print("ki = " + str(float_ki))
		
		i = 0
		settlingTime = 0.0
		for data in datas:
			if data[0] == str(float_kp) and data[1] == str(float_ki):
				i += 1
				print("\ni = " + str(i) + ":")
				print("Delay = " + data[2] + "sec")
				try:
					print("Single settling time = " + data[3])
					settlingTime += float(data[3])
				except ValueError:
					print("Single settling time = empty => 999999")
					settlingTime += 999999	
				print("Accumulative settling time = " + str(settlingTime))

		print("i = " + str(i))
		if i == 0:
			settlingTime = 999999
		else:
			settlingTime = settlingTime/i
			settlingTime = "{0:.4f}".format(round(settlingTime,4))
			settlingTime = float(settlingTime)
		print("Average settling time = " + str(settlingTime) + "\n")
		kp.append(float_kp)
		ki.append(float_ki)
		settling_time.append(settlingTime)

print(kp)
print(ki)
print(settling_time)


raw_data = {'kp': kp, 'ki': ki, 'Average Settling Time (sec)': settling_time}
df = pd.DataFrame(raw_data, columns = ['kp', 'ki', 'Average Settling Time (sec)'])
df.to_csv('rank_average_settling_time.csv')
