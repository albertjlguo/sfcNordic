import os
import shutil
import numpy as np
import PyRAMSES
from end_simulation import end_simulation
from move_file import move_file
from sfc import sfc
from agc import agc

if __name__ == '__main__':
    
    # Best kp & ki (when td: 0.01s ~ 0.21s)
    # kp = 55.1
    # ki = 0.1
    # td = 0.01
    
    '''
    tuning delay & kp & ki:
    '''
    for td in np.arange(0.02, 0.22, 0.01):  # td: 0.02~0.21 sec, step: 0.01
        td = "{0:.2f}".format(round(td,2))
        for kp in np.arange(0.1, 345.2, 5.0):  # kp: 0.1~345.1, step: 5.0
            kp = "{0:.2f}".format(round(float(kp),2))
            
            '''
            define relationship between kp and ki
            '''
            if float(td) == 0.01:
                if float(kp) == 0.1:  # kp: 0.1
                    coef = 3.0
                    pass
                if float(kp)>0.1 and float(kp)<=349.6: # kp: 5.1~345.1
                    coef = 0.3
                    pass
                ki_limit = coef*float(kp)
            if float(td) >= 0.02:
                ki_limit = 20.1
            '''
            ki loop
            '''
            for ki in np.arange(0.1, ki_limit+0.1, 1.0):  # ki: 0.1-0.3*kp, step: 1.0
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