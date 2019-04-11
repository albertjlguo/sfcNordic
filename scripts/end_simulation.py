import PyRAMSES
import os

ram = PyRAMSES.sim()
case = PyRAMSES.cfg('cmd.txt')

def end_simulation(ram, case, flag):
    
    '''
    End the simulation without starting both the simulation and AGC:
    '''
    if flag == 1:
        print("flag = 1: cannot start simulation")

        # Kill gnuplot
        os.system("TASKKILL /F /IM gnuplot.exe /T")
        print("kill gnuplot successfully: no-simulation")

        # End simulation and exit
        try:
            ram.endSim()
            print("endSim() successfully: no-simulation")
        except:
            print("skip endSim(): no-simulation")

            
    '''
    End the simulation normally:
    '''
    if flag == 0:
        # Kill gnuplot
        os.system("TASKKILL /F /IM gnuplot.exe /T")
        print("kill gnuplot successfully")

        # End simulation and exit
        try:
            ram.endSim()
            print("endSim() successfully")
        except:
            print("skip endSim()")
            
            
    '''
    Make sure the process of simulation and the case is ended.
    '''
    del(ram)
    del(case)
    print("delete ram & case successfully")