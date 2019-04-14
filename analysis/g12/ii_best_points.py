import pandas as pd
import numpy as np

breaker = 'g12'
kp = []
ki = []
delay = []
settlingTime = []


for delayValue in np.arange(0.01, 0.22, 0.01):
	delayValue = "{0:.2f}".format(round(delayValue,2))
	print(delayValue)

	address = '/Users/realgjl/OneDrive - University of Leeds/Nordic/cur_' + breaker + '/surf/'  \
			  + 'td_' + delayValue + '.xlsx'
	#print(address)


	d1 = pd.read_excel(address, skiprows=0, usecols=[0]) # column 1
	xn1 = np.matrix(np.array(d1).tolist())
	
	d2 = pd.read_excel(address, skiprows=0, usecols=[1]) # column 2
	xn2 = np.matrix(np.array(d2).tolist())
	
	d3 = pd.read_excel(address, skiprows=0, usecols=[2]) # column 3
	xn3 = np.matrix(np.array(d3).tolist())
	
	d4 = pd.read_excel(address, skiprows=0, usecols=[3]) # column 4
	xn4 = np.matrix(np.array(d4).tolist())
	
	nonZero_settlingTime = []
	for n in range(len(d4)):
		d = xn4[n,0]
		d = "{0:.4f}".format(round(d,4))
		d = float(d)
		if str(d) != 'nan':
			# print(d)
			nonZero_settlingTime.append(d)
			
	min_col4 = min(nonZero_settlingTime)
	min_col4 = "{0:.4f}".format(round(min_col4,4))
	min_col4 = float(min_col4)
	print("min = " + str(min_col4))


	for n in range(len(d4)):
		d = xn4[n,0]
		d = "{0:.4f}".format(round(d,4))
		# d = float(d)
		#print(d)
		if d == str(min_col4):
			# print("index = " + str(n))
			a = xn1[n,0]
			a = "{0:.2f}".format(round(a,2))
			a = float(a)
			b = xn2[n,0]
			b = "{0:.2f}".format(round(b,2))
			b = float(b)
			c = xn3[n,0]
			c = "{0:.2f}".format(round(c,2))
			c = float(c)
			d = float(d)
			kp.append(a)
			ki.append(b)
			delay.append(c)
			settlingTime.append(d)


print(kp)
print(ki)
print(delay)	
print(settlingTime)


raw_data = {'kp': kp, 'ki': ki, 'delay': delay, 'settling time': settlingTime}
df = pd.DataFrame(raw_data, columns = ['kp', 'ki', 'delay', 'settling time'])
df.to_excel('best_points.xlsx')
