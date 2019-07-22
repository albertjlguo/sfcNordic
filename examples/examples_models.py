import pyramses
import numpy as np
import os
import shutil


def sfc(ram, case, start_time, end_time, agcTimeStep, monitor, kp, ki, list_of_gens, weight_of_gens, list_of_td, prepared_folder_address, breaker, flagTd):

	'''The framework of Secondary Frequency Control
	
	Args:
		ram: a simulator instance
		case: load saved test-case
		start_time (float): controller's starting time (sec)
		t (float): controller's ending time, here also the end time of the simulation (sec)
		agcTimeStep (float): time step (sec)
		comp_type (list) & monitor (list) & obs_name (list): pyramses framework for getting generators' parameters
		nominal_frequency (float): always default to 1.0
		errSum (float): integral of the error
		kp (float): p term of PI control
		ki (float): i term of PI control
		list_of_gens: whose power will be changed to increase/decrease the frequency in the sys
		weight_of_gens: defined how much a selected generator should output 
		(When agc is performed, different generators need to share the output power they need to bear according to their rated power)
		list_of_td (list): communication delays
		
	Raises:
		PyRAMSESError: voltages or frequency out of bound
	'''
	kp = float(kp)
	ki = float(ki)
	# td = float(td)
	######### simulation CANNOT be started => flag = 1: #########
	flag = 0
	try:
		ram.execSim(case,start_time)
	except:  # skip to end simulation & move files
		flag = 1
		pass


	######### normal <=> flag = 0: #########
	if flag == 0:
		# Initialization
		comp_type = ['SYN']
		obs_name = ['Omega']
		errSum = 0.0
		nominal_frequency = 1.0


		######### run agc control: #########
		'''
		start of agc
		'''

		for i in np.arange(start_time+agcTimeStep,end_time+1,agcTimeStep):  # ending time will be include the 'end_time' sec
			#print("i = " + str(i))
			actual_frequency = ram.getObs(comp_type, monitor, obs_name)[0] # monitor
			error = nominal_frequency - actual_frequency
			if abs(error)<0.000001: #10e-6
				error = 0.0
				errSum = 0.0
			#print("error = " + str(error))

			errSum += error * agcTimeStep
			#print("errSum = " + str(errSum))
			output = float(kp) * float(error) + float(ki) * float(errSum)
			if abs(output)<0.00001:
				output = 0.0
			# print("output = " + str(output))

			# send measurements to generators in 'list_of_gens'
			gens = zip(list_of_gens, weight_of_gens, list_of_td)
			for gen in gens:
				gensName, gensWeight, gensTd = gen
				command = 'CHGPRM TOR ' + gensName + ' Tm0 ' + str(output*gensWeight) + ' 0'
				#print(str(ram.getSimTime()+0.01)+' '+command)
				gensTd = "{0:.2f}".format(gensTd,2)
				gensTd = float(gensTd)
				ram.addDisturb(ram.getSimTime() + gensTd, command)

			# catch errors (voltages or frequency out of bound)
			try:
				ram.contSim(i)
			except:
				print("RAMSES error => break, ready to kill gnuplot")
				break
		'''
		end of agc
		'''
		pass

	kp = "{0:.2f}".format(round(float(kp),2))
	ki = "{0:.2f}".format(round(float(ki),2))
	# td = "{0:.2f}".format(round(float(td),2))
	
	######### end simulation & move files: #########
	end_simulation(ram, case, flag)
	move_file(prepared_folder_address, flagTd, breaker, kp, ki, list_of_gens, list_of_td)
	


def end_simulation(ram, case, flag):
	'''end the simulation if flag = 0 or if flag = 1 (there is a fork in the function sfc)

	Args:
		ram: a simulator instance
		case: saved test-case ('cmd.txt')
		flag (int): determine when to terminate the simulation      
	'''

	######### end the simulation without starting both the simulation and agc: #########
	if flag == 1:
		print("flag = 1: cannot start simulation")

		# kill gnuplot ('$CALL_GP F;')
		os.system("TASKKILL /F /IM gnuplot.exe /T")
		print("kill gnuplot successfully: no-simulation")

		# end simulation and exit
		try:
			ram.endSim()
			print("endSim() successfully: no-simulation")
		except:
			print("skip endSim(): no-simulation")


	######### end the simulation normally: #########
	if flag == 0:
		# kill gnuplot
		os.system("TASKKILL /F /IM gnuplot.exe /T")
		print("kill gnuplot successfully")

		# end simulation and exit
		try:
			ram.endSim()
			print("endSim() successfully")
		except:
			print("skip endSim()")


	######### make sure the process of simulation and the case is ended: #########
	del(ram)
	del(case)
	print("delete ram & case successfully")



def move_file(prepared_folder_address, flagTd, breaker, kp, ki, list_of_gens, list_of_td):
	''' move the cur file to a prepared folder & delete some cur and trace files

	Args:
		prepared_folder_address (string): cur file's new folder address
		breaker (string): the name of generator you want to disconnection (e.g.: 'g12')
		kp, ki (float): PI control's parameter
		list_of_td (list): commuication delays
	'''

	######### create a folder (that cur files will be moved into) #########
	try:
		if not os.path.exists(prepared_folder_address):
			os.makedirs(prepared_folder_address)
	except OSError:
		print('Error: Creating floder:' + prepared_folder_address)


	######### open, read and re-write contents to another file (in public folder) (cur) #########
	with open("temp_display.cur", encoding='utf-8') as f00:
		with open("temp_display_.cur", "w", encoding='utf-8') as f01:
			for line in f00:
				if "error" not in line:
					f01.write(line)
	print("re-write cur successfully")


	######### copy the file (in public folder) to another prepared folder #########
	shutil.copy("temp_display_.cur", prepared_folder_address)
	print("copy cur successfully")



	######### rename the file in new folder (cur) #########
	if flagTd == "ones":
		strTd = "{0:.2f}".format(list_of_td[0],2)
		tdText = '-' + strTd + 's'
		os.rename(prepared_folder_address + '/temp_display_.cur', 
                  prepared_folder_address + '/temp_display_' + breaker + '_' + str(kp) + '-' + str(ki) + tdText + '.cur')
		print("rename cur successfully")
    
	if flagTd == "communicationLink":
		tdText = ''
		i = 0
		while i < len(list_of_gens):
			strTd = "{0:.2f}".format(list_of_td[i],2)
			tdText += '_' + str(list_of_gens[i]) + '-' + strTd + 's'
			i += 1
		os.rename(prepared_folder_address + '/temp_display_.cur', 
                    prepared_folder_address + '/temp_display_' + breaker + '_' + str(kp) + '-' + str(ki) + tdText + '.cur')


	######### delete cur & trace files #########
	# Delete cur files in public folder
	os.unlink("temp_display.cur")
	os.unlink("temp_display_.cur")
	print("delete temp_display(_).cur successfully")


	######### delete trace: cont, disc, init, output #########
	os.unlink("cont.trace")
	os.unlink("disc.trace")
	os.unlink("init.trace")
	os.unlink("output.trace")
	print("delete trace: cont, disc, init, output successfully\n")

