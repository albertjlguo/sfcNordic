import numpy as np
import PyRAMSES
from examples_models import end_simulation
from examples_models import move_file
from examples_models import sfc

# Load a simulator instance
ram = PyRAMSES.sim()

# Load saved test-case & Add more observation(s)
case = PyRAMSES.cfg('cmd.txt')  
case.addRunObs('MS g2')  # will plot a frequency-time diagram by bus g2
#case.addRunObs('BPO g6-1042')  # will plot a power (power output)-time diagram by g6
#case.addRunObs('BPO g7-1043')  # will plot a power (power output)-time diagram by g7
#case.addRunObs('BPO g14-4042')  # will plot a power (power output)-time diagram by g14
#case.addRunObs('BPO g15-4047')  # will plot a power (power output)-time diagram by g15
#case.addRunObs('BPO g16-4051')  # will plot a power (power output)-time diagram by g16

# Testing with fixed kp, ki, td
if __name__ == '__main__':
	
	'''parameters
	Args:
		flagTd (string): flag whether communication delays are the same or not
		prepared_folder_address (string): cur files' new folder (the folder is parallel with ../examples)
		breaker (string): the name of generator you want to disconnection
		monitor (string): through it get the frequency of the system
		list_of_gens: whose power will be changed to increase/decrease the frequency in the sys
		weight_of_gens: defined how much a selected generator should output (according to Pnom)
		agcTimeStep: time step
	'''

	######### parameters #########
	start_time = 150.0
	end_time = 1100.0  # (dst file)
	agcTimeStep = 1.0
	monitor = ['g2']
	breaker = 'g8'  # (dst file)
	list_of_gens = ['g6', 'g7', 'g14', 'g15', 'g16']
	weight_of_gens = [8,16,32/7,8/3,32/7]  # (dny_A.dat)
	prepared_folder_address = 'D:/OneDrive - University of Leeds/Nordic/6.1/'

	#### tuning delay (td) & kp & ki:
	flagTd = 'ones'
	
	kp = 30.1
	ki = 0.1
	td = 0.01
	list_of_td = td * np.ones(5)
	
	kp = "{0:.2f}".format(round(float(kp),2))
	ki = "{0:.2f}".format(round(float(ki),2))
	td = "{0:.2f}".format(round(float(td),2))
	
	print("kp = " + str(kp))
	print("ki = " + str(ki))
	print("td = " + str(td))
	
	sfc(ram, case, start_time, end_time, agcTimeStep, monitor, kp, ki, list_of_gens, weight_of_gens, list_of_td, prepared_folder_address, breaker, flagTd)
