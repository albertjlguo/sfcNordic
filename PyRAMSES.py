
# Initialization
import os
import shutil

# Run simple simulation
## Load module
import PyRAMSES

## Load simulator
for ki in range(2):
	for kp in range(2):
		
		print("kp = " + str(kp))
		print("ki = " + str(ki))
		
		ram = PyRAMSES.sim()
		
		# Load saved test-case
		case = PyRAMSES.cfg('cmd.txt')

		# Add one observation more
		case.addRunObs('MS g2') # will plot in real-time the voltage on bus g1
		
		# Run simulation and pause at t=15 seconds
		start_time=15
		ram.execSim(case,start_time)
		comp_type = ['TOR']
		comp_name = ['g14']
		prm_name = ['Tm0']
		ram.getPrm(comp_type, comp_name, prm_name)
		
		# Initialization
		comp_type = ['SYN']
		comp_name = ['g2']
		obs_name = ['Omega']
		errSum = 0
		t=240
		nominal_frequency = 1.0
		list_of_gens = ['g14', 'g15', 'g16', 'g17', 'g18']
		
		# PI Control
		for i in range(start_time+1,t):
			#print("i = " + str(i))
			actual_frequency = ram.getObs(comp_type,comp_name, obs_name)[0]
			error = nominal_frequency - actual_frequency
			if abs(error)<0.00001:
				error = 0.0
			#print("error = " + str(error))
			errSum += error * 1.0
			#print("errSum = " + str(errSum))
			output = kp * error + ki * errSum
			if abs(output)<0.00001:
				output = 0.0
			# loop to send measurements to generators g14-g18
			for gen in list_of_gens:
				command = 'CHGPRM TOR ' + gen + ' Tm0 ' + str(output/5.0) + ' 0'
				#print(str(ram.getSimTime()+0.01)+' '+command)
				ram.addDisturb(ram.getSimTime()+0.01, command)
			ram.contSim(i)
			# Run simulation till the end
			ram.contSim(ram.getInfTime())
			
		# Rename cur file
		#os.rename(r'C:\Users\el17jg\Desktop\GitHub\Nordic-test-system\temp_display.cur', r'C:\Users\el17jg\Desktop\GitHub\Nordic-test-system\temp_display_' + str(kp) + '-' + str(ki) + '.cur')
			
		# Copy cur file to folder
		#shutil.move(r'C:\Users\el17jg\Desktop\GitHub\Nordic-test-system\temp_display_' + str(kp) + '-' + str(ki) + '.cur', r'C:\Users\el17jg\Desktop\GitHub\Nordic-test-system\curfiles')
			