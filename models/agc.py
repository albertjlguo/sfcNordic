import PyRAMSES
import numpy as np

ram = PyRAMSES.sim()

def agc(ram, start_time, t, comp_type, monitor, obs_name, nominal_frequency, errSum, agcTimeStep, kp, ki, list_of_gens, weight_of_gens, td):
    
    '''
    PI Control:
    '''
    for i in np.arange(start_time+1,t+1):  # ending time will be include the 't' sec
        #print("i = " + str(i))
        actual_frequency = ram.getObs(comp_type, monitor, obs_name)[0] # g2
        error = nominal_frequency - actual_frequency
        if abs(error)<0.00001:
            error = 0.0
        #print("error = " + str(error))

        errSum += error * agcTimeStep
        #print("errSum = " + str(errSum))
        output = float(kp) * float(error) + float(ki) * float(errSum)
        if abs(output)<0.00001:
            output = 0.0
        # print("output = " + str(output))
        
        # Send measurements to generators in 'list_of_gens'
        gens = zip(list_of_gens, weight_of_gens)
        for gen in gens:
            gensName, gensWeight = gen
            command = 'CHGPRM TOR ' + gensName + ' Tm0 ' + str(output/gensWeight) + ' 0'
            #print(str(ram.getSimTime()+0.01)+' '+command)
            td = float(td)
            ram.addDisturb(ram.getSimTime() + td, command)

        # Catch errors (voltages or frequency out of bound)
        try:
            ram.contSim(i) # be parallel under the for loop (for gen in list_of_gens).
        except:
            print("RAMSES error => break, ready to kill gnuplot")
            break