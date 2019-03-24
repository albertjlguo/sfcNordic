'''
Update at 2019/03/24
'''


import os
import shutil
import numpy as np
import PyRAMSES

def end_simulation(ram, case, flag):
	'''
	End the simulation without starting both the simulation and AGC:
	'''
	if ram.getEndSim() == 0:
		# End simulation and exit
		try:
			ram.endSim()
			print("endSim() successfully: no-simulation...")
		except:
			print("skip endSim(): no-simulation...")

	'''
	Make sure the process of simulation and the case is ended.
	'''

	del(ram)
	del(case)
	print("delete ram & case successfully")
	


def move_file(flag, kp, ki, td):
		'''
		Move cur file:
		'''
		
		# Open, read and re-write contents to another file (in public folder) (cur)
		with open("temp_display.cur") as f00:
				with open("temp_display_.cur", "w") as f01:
						for line in f00:
								if "error" not in line:
										f01.write(line)
		print("re-write cur successfully")

		# Copy the file (in public folder) to another prepared folder (cur)
		shutil.copy("temp_display_.cur", 'cur')
		print("copy cur successfully")

		# Rename the file in new folder (cur)
		os.rename('cur/temp_display_.cur', 
				  'cur/temp_display_' + str(kp) + '-' + str(ki) + '-' + str(td) + 's' + '.cur')
		print("rename cur successfully")


		'''
		Move output.trace file:
		'''
		
		# Open, read and re-write contents to another file (in public folder) (output.trace)
		with open("output.trace") as f10:
				with open("output_.trace", "w") as f11:
						for line in f10:
								if "error" not in line:
										f11.write(line)
		print("re-write output.trace successfully")

		# Copy the file (in public folder) to another prepared folder (output.trace)
		shutil.copy("output_.trace", 'output')
		print("copy output.trace successfully")

		# Rename the file in new folder (output.trace)
		os.rename('output/output_.trace',
				 'output/output_' + str(kp) + '-' + str(ki) + '-' + str(td) + 's' + '.trace')
		print("rename output.trace successfully")


		'''
		Delete cur & trace files:
		'''
		
		# Delete cur files in public folder
		os.unlink("temp_display.cur")
		os.unlink("temp_display_.cur")
		print("delete temp_display(_).cur successfully")

		# Delete trace: cont, disc, init, output(_)
		os.unlink("cont.trace")
		os.unlink("disc.trace")
		os.unlink("init.trace")
		os.unlink("output.trace")
		os.unlink("output_.trace")
		print("delete trace: cont, disc, init, output(_) successfully\n")




def sfc(kp, ki, td):
	
	'''
	Framework of sfc
	'''
	
	ram = PyRAMSES.sim()

	# Load saved test-case
	case = PyRAMSES.cfg('cmd.txt')

	# Add one observation more
	case.addRunObs('MS g2') # will plot in real-time the voltage on bus g1

	# Run simulation and pause at t=15 seconds
	start_time=15

	
	'''
	The simulation CANNOT be started => flag = 1:
	'''
	
	flag = 0
	try:
		ram.execSim(case,start_time)
	except:  # skip to end simulation & move files
		flag = 1
	
	
	'''
	Normal <=> flag = 0:
	'''
	
	if flag == 0:
		# Initialization
		comp_type = ['SYN']
		comp_name = ['g2']
		obs_name = ['Omega']
		errSum = 0.0
		t=500
		nominal_frequency = 1.0
		list_of_gens = ['g6', 'g7', 'g14', 'g15', 'g16']

		'''
		Run agc control:
		'''
		agc(ram, start_time, t, comp_type, comp_name, obs_name, nominal_frequency, errSum, kp, ki, list_of_gens, td)
	
	'''
	End simulation & Move files:
	'''
	
	end_simulation(ram, case, flag)
	move_file(flag, kp, ki, td)




def agc(ram, start_time, t, comp_type, comp_name, obs_name, nominal_frequency, errSum, kp, ki, list_of_gens, td):
	'''
	PI Control:
	'''
	
	for i in np.arange(start_time+1,t):
		#print("i = " + str(i))
		actual_frequency = ram.getObs(comp_type,comp_name, obs_name)[0] # g2
		error = nominal_frequency - actual_frequency
		if abs(error)<0.00001:
			error = 0.0
		#print("error = " + str(error))

		errSum += error * 1.0
		#print("errSum = " + str(errSum))
		output = float(kp) * float(error) + float(ki) * float(errSum)
		if abs(output)<0.00001:
			output = 0.0
		# print("output = " + str(output))

		# loop to send measurements to generators g6, g7, g14, g15, g16
		for gen in list_of_gens:
			command = 'CHGPRM TOR ' + gen + ' Tm0 ' + str(output/5.0) + ' 0'
			#print(str(ram.getSimTime()+0.01)+' '+command)
			td = float(td)
			ram.addDisturb(ram.getSimTime() + td, command)

		# Catch errors (voltages or frequency out of bound)
		try:
			ram.contSim(i) # be parallel under the for loop (for gen in list_of_gens).
		except:
			print("RAMSES error => break....., ready to kill gnuplot")
			return
		
		
		
if __name__ == '__main__':
	'''
	tuning kp & ki:
	'''
	
	if __name__ == '__main__':
		'''
		tuning kp & ki:
		'''
		
		for td in np.arange(0.01, 0.02, 0.02):  # td: 0.010 sec
			td = "{0:.2f}".format(round(td,2))
			for kp in np.arange(50.6, 199.7, 0.5):  # kp: 50.6-199.6
						
				if float(kp)>=50.6 and float(kp)<=99.6:  # kp: 50.6-99.6
					kp = "{0:.2f}".format(round(float(kp),2))
					for ki in np.arange(0.1, 0.57*float(kp), 0.5):  # ki: 0.1-0.57*kp
						ki = "{0:.2f}".format(round(float(ki),2))

						print("kp = " + str(kp))
						print("ki = " + str(ki))
						print("td = " + str(td))
						
						'''
						Run sfc:
						'''
						sfc(kp, ki, td)
						
				if float(kp)>=100.6 and float(kp)<=149.6:  # kp: 100.6-149.6
					kp = "{0:.2f}".format(round(float(kp),2))
					for ki in np.arange(0.1, 0.5355*float(kp), 0.5):  # ki: 0.1-0.5355*kp
						ki = "{0:.2f}".format(round(float(ki),2))

						print("kp = " + str(kp))
						print("ki = " + str(ki))
						print("td = " + str(td))
						
						'''
						Run sfc:
						'''
						sfc(kp, ki, td)
						
				if float(kp)>=150.6 and float(kp)<=199.6:  # kp: 150.6-199.6
					kp = "{0:.2f}".format(round(float(kp),2))
					for ki in np.arange(0.1, 0.4837*float(kp), 0.5):  # ki: 0.1-0.4837*kp
						ki = "{0:.2f}".format(round(float(ki),2))

						print("kp = " + str(kp))
						print("ki = " + str(ki))
						print("td = " + str(td))
						
						'''
						Run sfc:
						'''
						sfc(kp, ki, td)
						pass
				pass