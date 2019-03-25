import PyRAMSES
from agc import agc
from end_simulation import end_simulation
from move_file import move_file

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
        pass
    
    
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
        pass

    
    '''
    End simulation & Move files:
    '''
    
    end_simulation(ram, case, flag)
    move_file(flag, kp, ki, td)