import os
import shutil
import numpy as np
import PyRAMSES
from end_simulation import end_simulation
from move_file import move_file
from sfc import sfc
from agc import agc

if __name__ == '__main__':
    '''
    tuning kp & ki:
    '''

    for td in np.arange(0.21, 0.22, 0.10):  # td: 0.21 sec
        td = "{0:.2f}".format(round(td,2))
        for kp in np.arange(0.1, 345.2, 5.0):  # kp: 0.1~345.1, step: 5.0
            kp = "{0:.2f}".format(round(float(kp),2))
            
            '''
            define relationship between kp and ki
            '''
            if float(kp) == 0.1:  # kp: 0.1
                coef = 3.0
                pass

            if float(kp)>0.1 and float(kp)<50.1:  # kp: 5.1~45.1
                coef = 0.3
                pass

            if float(kp)>=50.1 and float(kp)<100.1:  # kp: 50.1~95.1
                coef = 0.2415
                pass

            if float(kp)>=100.1 and float(kp)<150.1:  # kp: 100.1~145.1
                coef = 0.1908
                pass

            if float(kp)>=150.1 and float(kp)<200.1:  # kp: 150.1~195.1
                coef = 0.1339
                pass

            if float(kp)>=200.1 and float(kp)<250.1:  # kp: 200.1~245.1
                coef = 0.0655
                pass

            if float(kp)>=250.1 and float(kp)<300.1:  # kp: 250.1~295.1
                coef = 0.0444
                pass

            if float(kp)>=300.1 and float(kp)<=349.6:  # kp: 300.1~345.1
                coef = 0.0337
                pass
            
            '''
            ki loop
            '''
            for ki in np.arange(0.1, coef*float(kp), 1.0):  # ki: 0.1-coef*kp, step: 1.0
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