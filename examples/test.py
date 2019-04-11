import os
import shutil
import numpy as np
import PyRAMSES
from end_simulation import end_simulation
from move_file import move_file
from sfc import sfc
from agc import agc

if __name__ == '__main__':
    
    prepared_folder_address = 'D:/OneDrive - University of Leeds/Nordic/cur_g12' 
    breaker = 'g12' 
    
    monitor = ['g2']
    list_of_gens = ['g6', 'g7', 'g14', 'g15', 'g16']
    weight_of_gens = [8,16,32/7,8/3,32/7]
    agcTimeStep = 1.0     

    '''
    tuning delay & kp & ki:
    '''
    for td in np.arange(0.06, 0.22, 0.01):  # td: 0.06~0.21 sec, step: 0.01
        td = "{0:.2f}".format(round(td,2))
        for kp in np.arange(0.1, 325.2, 5.0):  # kp: 0.1~325.1, step: 5.0
            kp = "{0:.2f}".format(round(float(kp),2))
            for ki in np.arange(0.1, 25.2, 5.0):  # ki: 0.1-25.1, step: 5.0
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
