import PyRAMSES
import numpy as np

ram = PyRAMSES.sim()


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
            break